/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "BrowsingWinCtrl.h"
#import "BrowsingViewerCtrl.h"
#import "DrawOperation.h"

#define PicSize        200
#define PicMargin      6
#define PreviewSize    (PicSize + PicMargin)
#define ScreenMargin   48

@implementation BrowsingWinCtrl {
    NSArray   *imageURLs;
    NSWindow  *window;
    __weak NSView    *docview;
    NSOperationQueue *queue;
    int       wpics, hpics, rows;
}

/* Local Method */
- (void)fixDimensions:(int)count
{
    NSScreen *screen = [[NSScreen screens] objectAtIndex:0];
    NSSize sz = [screen visibleFrame].size;
    wpics = ((int)sz.width - ScreenMargin) / PreviewSize;
    hpics = ((int)sz.height - ScreenMargin) / PreviewSize;
    if (wpics * hpics < count) { /* needs scroller */
        rows = (count + wpics - 1) / wpics;
        return;
    }
    if (hpics * hpics >= count)
        hpics = (int)sqrt((double)count);
    wpics = (count + hpics - 1) / hpics;
    hpics = rows = (count + wpics - 1) / wpics;
}

/* Local Method */
- (void)showImages
{
    int i, count;
    int x, y;
    NSPoint loc;
    CGFloat hgt;
    DrawOperation *op;

    count = [imageURLs count];
    hgt = [docview frame].size.height;
    for (i = 0; i < count; i++) {
        y = i / wpics;
        x = i - (y * wpics);
        loc.x = x * PreviewSize;
        loc.y = hgt - y * PreviewSize - PicSize;
        op = [[DrawOperation alloc]
                initWithURL:[imageURLs objectAtIndex:i]
                parentView:docview at:loc];
        [queue addOperation:op];
    }
}

- (id)initWithURLs:(NSArray *)content
{
    NSScrollView *scview;
    NSClipView *clip;
    NSString *pathname;
    BOOL withScroller;
    NSRect contrect, viewrect;
    NSUInteger wstyle = (NSTitledWindowMask |
        NSClosableWindowMask | NSMiniaturizableWindowMask);

    if ((self = [super init]) == nil)
        return nil;
    [DrawOperation setPictureSize:PicSize];
    queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:10];
    imageURLs = content;
    [self fixDimensions:[imageURLs count]];
    withScroller = (rows > hpics);
    contrect.size.width = wpics * PreviewSize - PicMargin;
    contrect.size.height = hpics * PreviewSize - PicMargin;
    contrect.origin = NSZeroPoint;
    viewrect = contrect;
    if (withScroller) {
        contrect.size.width += [NSScroller scrollerWidth];
        viewrect.size.height = rows * PreviewSize - PicMargin;
    }
    scview = [[NSScrollView alloc] initWithFrame:contrect];
    [scview setHasVerticalScroller:withScroller];
    NSView *vw; // to retain the view
    docview = vw = [[NSView alloc] initWithFrame:viewrect];
    [scview setDocumentView:docview];
    clip = [scview contentView];
    [clip setDrawsBackground:YES];
    [clip setBackgroundColor:[NSColor lightGrayColor]];
    pathname = [[[imageURLs objectAtIndex:0]
                    path] stringByDeletingLastPathComponent];
    window = [[NSWindow alloc]
        initWithContentRect:contrect styleMask:wstyle
        backing:NSBackingStoreBuffered defer:YES];
    [window setContentView: scview];
    [window setReleasedWhenClosed:NO];
    [window setTitleWithRepresentedFilename:pathname];
    [window setDelegate:self];
    [window center];
    if (withScroller) {
       CGFloat p = (rows - hpics) * PreviewSize;
       [docview scrollPoint:NSMakePoint(0.0, p)];
    }
    [window makeKeyAndOrderFront:self];
    [[BrowsingViewerCtrl sharedController] addWinCtrl:self];
    [self showImages];
    return self;
}

/* Delegate Messages */
- (BOOL)windowShouldClose:(id)sender
{
    [window setDelegate:nil];
    window = nil;
    [queue cancelAllOperations];
    [[BrowsingViewerCtrl sharedController] removeWinCtrl:self];
    return YES;
}

@end
