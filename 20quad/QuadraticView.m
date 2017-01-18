/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "QuadraticView.h"
#import "QuadraticView+Draw.h"
#import <Cocoa/Cocoa.h>

static NSString *BindKeys[] = { @"a", @"b", @"c" };

@implementation QuadraticView {
    __weak id bindObj[COEFFS];
    id bindKey[COEFFS];
}

- (id)initWithFrame:(NSRect)rect
{
    if ((self = [super initWithFrame:rect]) == nil)
        return nil;
    if ((cache = [[NSImage alloc] initWithSize:rect.size]) == nil)
        return nil;
    gridArray = nil;
    return self;
}

- (void)dealloc {
    for (int i = 0; i < COEFFS; i++)
        bindObj[i] = bindKey[i] = nil;
}

@dynamic coefficients;
- (NSMutableDictionary *)coefficients { return coefficients; }
- (void)setCoefficients:(NSMutableDictionary *)val
{
    if (coefficients != val)
        coefficients = [val mutableCopy];
    [self redrawGraph];
    [self display];
}

- (void)drawRect:(NSRect)aRect {
    [cache compositeToPoint:(aRect.origin)
                      fromRect:aRect operation:NSCompositeCopy];
}

- (void)moveGraph:(NSPoint)d  /* move the graph */
{
    double a = [[coefficients valueForKey:@"a"] doubleValue];
    double b = [[coefficients valueForKey:@"b"] doubleValue];
    double c = [[coefficients valueForKey:@"c"] doubleValue];
    // new b := b - 2ax,  new c := c + ax^2 - bx + y
    double w = a * d.x;
    id bval = [NSNumber numberWithDouble:(b - 2.0 * w)];
    id cval = [NSNumber numberWithDouble:(c + (w - b) * d.x + d.y)];
    [coefficients setObject:bval forKey:@"b"];
    [coefficients setObject:cval forKey:@"c"];
    [self setCoefficients: coefficients]; // KVC & redraw
    [bindObj[1] setValue:bval forKeyPath:bindKey[1]]; /* b */
    [bindObj[2] setValue:cval forKeyPath:bindKey[2]]; /* c */
}

- (void)mouseDown:(NSEvent *)event 
{
    /* Get mouse dragging and move the graph */
    NSPoint p, prev, delta;
    const NSUInteger DRAG_MASK = (NSLeftMouseUpMask|NSLeftMouseDraggedMask);
    double scale = (XY_MAX * 2.0) / [self frame].size.width;

    p = [event locationInWindow];
    prev = [self convertPoint:p fromView:nil]; /* View based point */
    for ( ; ; ) {
        event = [[self window] nextEventMatchingMask:DRAG_MASK];
        if ([event type] == NSLeftMouseUp)
            break;
        p = [event locationInWindow];
        p = [self convertPoint:p fromView:nil];
        delta.x = scale * (p.x - prev.x);
        delta.y = scale * (p.y - prev.y);
        [self moveGraph: delta];
        prev = p;
    }
}

- (void)bind:(NSString *)binding toObject:(id)obsvObj
    withKeyPath:(NSString *)keyPath options:(NSDictionary *)options
{
    int i;
    for (i = 0; i < COEFFS; i++)
        if ([binding isEqualToString: BindKeys[i]]) break;
    if (i < COEFFS) {
        [obsvObj addObserver:self forKeyPath:keyPath
                     options:NSKeyValueObservingOptionNew
                     context:(__bridge void *)BindKeys[i]];
        bindKey[i] = keyPath;
        bindObj[i] = obsvObj;
    }else
        [super bind:binding toObject:obsvObj
            withKeyPath:keyPath options:options];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
	ofObject:(id)object change:(NSDictionary *)change
	context:(void *)context
{
    int i;
    for (i = 0; i < COEFFS; i++)
        if (context == (__bridge void *)BindKeys[i])
            break;
    if (i < COEFFS) {
        [coefficients setObject:[object valueForKeyPath:keyPath]
                         forKey:BindKeys[i]];
        [self setCoefficients: coefficients]; // KVC & redraw
    }else
        [super observeValueForKeyPath:keyPath
	    ofObject:object change:change context:context];
}

@end
