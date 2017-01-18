/*** Copyright: OGIHARA Takeshi, Sept. 2010 ***/

#import <Cocoa/Cocoa.h>
#import "DrawOperation.h"
#import "WinCtrl.h"

@interface ClickableImageView : NSImageView
@property (retain) NSURL *url;
@end

@implementation ClickableImageView
@synthesize url;

- (void)mouseDown:(NSEvent *)theEvent
{
    if ([theEvent clickCount] >= 2)
        (void)[[WinCtrl alloc] initWithURL:url];
}
@end

static CGFloat pictureSize = 200.0;

@implementation DrawOperation

+ (void)setPictureSize:(CGFloat)value {
    pictureSize = value;
}

- (id)initWithURL:(NSURL *)imgurl
    parentView:(NSView *)parent at:(NSPoint)loc
{
    if ((self = [super init]) != nil) {
        file = imgurl;
        view = parent;
        location = loc;
    }
    return self;
}

/* Local Method */
- (NSImage *)imageResized:(NSURL *)url
{
    double rw, rh, r;
    NSSize sz;
    NSImage *img, *alt;
    NSRect frame, rect;

    img = [[NSImage alloc] initWithContentsOfURL:url];
    if (img == nil)
        return nil;
    sz = [img size];
    rw = sz.width / pictureSize;
    rh = sz.height / pictureSize;
    if (rw <= 1.0 && rh <= 1.0) // if size is small enough
        return img;
    // make a small image
    frame.size = sz;
    frame.origin = NSZeroPoint;
    r = (rw > rh) ? rw : rh;
    sz.width /= r;
    sz.height /= r;
    rect.size = sz;
    rect.origin = NSZeroPoint;
    alt = [[NSImage alloc] initWithSize:sz];
    [alt lockFocus];
    [img drawInRect:rect fromRect:frame
          operation:NSCompositeCopy fraction:1.0];
    [alt unlockFocus];
    return alt;
}

- (void)main
{
    NSImage *img;
    ClickableImageView *imgview;
    NSRect frame;
    NSSize sz;

    @try {
        @autoreleasepool {
            if (view == nil || [self isCancelled])
                return;
            if ((img = [self imageResized:file]) == nil)
                return;
            sz = [img size];
            frame.size = sz;
            location.x += (pictureSize - sz.width) / 2.0;
            frame.origin = location;
            imgview = [[ClickableImageView alloc] initWithFrame:frame];
            [imgview setImage:img];
            imgview.url = file;
            [view addSubview: imgview];
            [imgview setNeedsDisplay:YES];
        }
    }
    @catch(...) { }
}

@end
