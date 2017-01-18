/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import "QuadraticView.h"
#import <Cocoa/Cocoa.h>

#define GLineWidth   1.5

@implementation QuadraticView (Draw)

- (NSBezierPath *)pathCurve
{
    NSSize sz = [self frame].size;
    const int deltaInPixel = 4;
    double scale = sz.width / (XY_MAX * 2.0);
    double delta = deltaInPixel / scale;
#define CONV_VIEW(x)    (((x) + XY_MAX) * scale)
    int pnum = sz.width / deltaInPixel + 3;
    struct gpnt {
        double x, y;
        BOOL inView;
    } *result;
    int i;
    double x, y, ca, cb, cc;
    double ymax = (double)XY_MAX + (GLineWidth * 2) / scale;
    double ymin = -ymax;
    NSPoint pt;
    BOOL isFirst;
    NSBezierPath *path = nil;

    result = malloc(sizeof(struct gpnt) * pnum);
    ca = [[coefficients valueForKey:@"a"] doubleValue];
    cb = [[coefficients valueForKey:@"b"] doubleValue];
    cc = [[coefficients valueForKey:@"c"] doubleValue];
    for (i = 0, x = (double)-XY_MAX - delta; i < pnum; i++, x += delta) {
        result[i].x = x;
        result[i].y = y = x * (ca * x + cb) + cc;
        result[i].inView = (y >= ymin && y <= ymax);
    }
    result[0].inView = result[pnum - 1].inView = NO;
    for (i = 0; i < pnum - 1; i++) {
        if (!result[i].inView && result[i+1].inView)
            result[i].inView = YES;
        else if (result[i].inView && !result[i+1].inView)
            result[++i].inView = YES;
    }

    isFirst = YES;
    for (i = 0; i < pnum; i++)
        if (result[i].inView) {
            pt = NSMakePoint(CONV_VIEW(result[i].x), CONV_VIEW(result[i].y));
            if (isFirst) {
                path = [NSBezierPath bezierPath]; // empty path
                [path moveToPoint:pt];
                isFirst = NO;
            }else
                [path lineToPoint:pt];
        }
   free(result);
   return path;
}

- (void)redrawGraph
{
    NSBezierPath *path;
    NSSize sz = [self frame].size;
    NSRect r;
    r.origin = NSZeroPoint;
    r.size = sz;

    if (gridArray == nil) {
        int i;
        NSPoint pt;
        gridArray = [[NSMutableArray alloc] initWithCapacity:1];
        path = [NSBezierPath bezierPath]; // empty path
        for (i = 1; i <= XY_MAX * 2; i++) {
            if (i == XY_MAX)
                continue;
            pt = NSMakePoint(0.0, (i * sz.height) / (XY_MAX * 2));
            [path moveToPoint:pt];
            pt.x = sz.width;
            [path lineToPoint:pt];
            pt.x = pt.y, pt.y = 0.0;
            [path moveToPoint:pt];
            pt.y = sz.height;
            [path lineToPoint:pt];
        }
        [gridArray addObject: path];

        path = [NSBezierPath bezierPath];
        pt = NSMakePoint(0.0, sz.height / 2);
        [path moveToPoint:pt];
        pt.x = sz.width;
        [path lineToPoint:pt];
        pt.x = pt.y, pt.y = 0.0;
        [path moveToPoint:pt];
        pt.y = sz.height;
        [path lineToPoint:pt];
        [gridArray addObject: path];
    }

    [cache lockFocus];
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:r];
    [NSBezierPath setDefaultLineWidth:0.5];
    [[NSColor colorWithCalibratedWhite:0.8 alpha:1.0] set];
    [[gridArray objectAtIndex:0] stroke];
    [[NSColor blackColor] set];
    [[gridArray objectAtIndex:1] stroke];
    if ((path = [self pathCurve]) != nil) {
        [path setLineWidth: GLineWidth];
        [[NSColor blueColor] set];
        [path stroke];
    }
    [cache unlockFocus];
}

@end
