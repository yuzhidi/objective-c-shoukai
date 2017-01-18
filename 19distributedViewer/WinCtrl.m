/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "WinCtrl.h"
#import "MyViewerCtrl.h"

#define  ImageSizeMIN   32
#define  TitleBarHeight 22

/*extern*/
NSString *ShrinkAllNotification = @"ShrinkAllNotification";
NSString *SizeDidChangeNotification = @"SizeDidChangeNotification";

static BOOL autoResize = NO;
static NSSize screenSize = { 1028.0, 768.0 };

@implementation WinCtrl {
    id docImage;
    NSSize originalSize;
    NSUndoManager *undoManager;
    double mag;
}

+ (void)initialize
{
    static BOOL nomore = NO;
    if (nomore == NO) {
        NSScreen *screen = [[NSScreen screens] objectAtIndex:0];
        screenSize = [screen visibleFrame].size;
        nomore = YES;
    }
}

+ (BOOL)autoResize { return autoResize; }
+ (void)setAutoResize:(BOOL)flag {
    autoResize = flag;
}

/* Local Method */
- (void)windowSetUp
{
    static int wincount = 0;
    float sft = (wincount++ & 07) * 20.0;
    id imageview;
    NSRect winrect, imgrect, contrect;
    float x, y;
    NSUInteger wstyle = (NSTitledWindowMask
            | NSClosableWindowMask | NSMiniaturizableWindowMask);

    contrect.size.width = (int)(originalSize.width * mag);
    contrect.size.height = (int)(originalSize.height * mag);
    contrect.origin = NSZeroPoint;
    winrect = [NSWindow frameRectForContentRect:contrect
                                      styleMask:wstyle];
    x = 100.0 + sft;
    y = 150.0 + sft;
    if (x + winrect.size.width > screenSize.width)
        x = screenSize.width - winrect.size.width;
    if (y + winrect.size.height > screenSize.height)
        y = screenSize.height - winrect.size.height;
    contrect.origin = NSMakePoint(x, y);
    window = [[NSWindow alloc] initWithContentRect:contrect
        styleMask:wstyle backing:NSBackingStoreBuffered defer:YES];
    [window setReleasedWhenClosed:NO]; // Don't release repeatedly
    imgrect.size = originalSize;
    imgrect.origin = NSZeroPoint;
    imageview = [[NSImageView alloc] initWithFrame:imgrect];
    [imageview setImage:docImage];
    [imageview setEditable:NO];
    [imageview setImageScaling:YES];
    [imageview setFrameSize: contrect.size];
    [window setContentView:imageview];
    [window makeFirstResponder:imageview];
}

/* Local Method */
- (void)shrinkAll:(NSNotification *)notification {
    [self shrink:[notification object]];
}

- (id)initWithURL:(NSURL *)aFile
{
    if ((self = [super init]) == nil)
        return nil;
    docImage = [[NSImage alloc] initWithContentsOfURL:aFile];
    if (docImage == nil)
        return nil;

    undoManager = [[NSUndoManager alloc] init];
    filename = [aFile path];
    originalSize = [docImage size];
    mag = 1.0;
    if (autoResize) {
        double wr, hr, ratio;
        wr = screenSize.width / originalSize.width;
        hr = (screenSize.height - TitleBarHeight) / originalSize.height;
        ratio = (wr < hr) ? wr : hr;
        if (ratio < 1.0)
            mag = ratio;
    }
    [self windowSetUp];
    [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(shrinkAll:) name:ShrinkAllNotification
        object:nil];
    [window setDelegate:self];
    [window setTitleWithRepresentedFilename:filename];
    [window makeKeyAndOrderFront:self];
    [window setDocumentEdited:(mag < 1.0)];
    [[MyViewerCtrl sharedController] addWinCtrl: self];
    return self;
}

- (NSString *)attributesOfImage
{
    static NSString *fnamestr, *sizestr, *magstr;
    NSSize sz;

    if (fnamestr == nil) {
        fnamestr = NSLocalizedString(@"Filename", "filename");
        sizestr = NSLocalizedString(@"Size", "Size");
        magstr = NSLocalizedString(@"Magnification", "Magnification");
    }
    sz = [docImage size];
    return [NSString stringWithFormat:
        @"%@: %@\n%@: %d x %d\n%@: %.1lf%%",
        fnamestr, [filename lastPathComponent],
        sizestr, (int)sz.width, (int)sz.height, magstr, mag*100.0];
}

/* Local Method */
- (void)setScaleFactor:(double)factor
{
    id view = [window contentView];
    NSRect rect = [window frame];
    NSSize prev = rect.size;
    NSSize sz = [view frame].size;
    int wdif = prev.width - sz.width;
    int hdif = prev.height - sz.height;
    static NSString *shrinkName = nil;

    if (shrinkName == nil)
        shrinkName = NSLocalizedString(@"Shrink", "");
    [[undoManager prepareWithInvocationTarget:self]
                                     setScaleFactor:mag];
    [undoManager setActionName: shrinkName];

    mag = factor;
    sz.width = (int)(originalSize.width * mag);
    sz.height = (int)(originalSize.height * mag);
    [view setFrameSize:sz];
    rect.size.width = sz.width + wdif;
    rect.size.height = sz.height + hdif;
    rect.origin.x += (int)(prev.width - rect.size.width) / 2;
    rect.origin.y += (int)(prev.height - rect.size.height) / 2;
    [window setFrame:rect display:YES];
    [window setDocumentEdited:(mag < 1.0)];
    [[NSNotificationCenter defaultCenter]
        postNotificationName:SizeDidChangeNotification object:window];
}

- (void)shrink:(id)sender
{
    NSSize sz = [[window contentView] frame].size;
    if (sz.width < ImageSizeMIN || sz.height < ImageSizeMIN)
        return;
    [self setScaleFactor:(mag * 0.5)];
}

/* Local Method */
- (void)removeWindowClosing:(BOOL)flag {
    [window setDelegate:nil]; // no delegate messages any more
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (flag)
        [window close];
    window = nil;
    [[MyViewerCtrl sharedController] removeWinCtrl: self];
}

/* Local Method */
- (void)alertDidEnd:(NSAlert *)alert
    returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    if (returnCode == NSAlertDefaultReturn)
        [self removeWindowClosing: YES];
}

/* Delegate Method */
- (BOOL)windowShouldClose:(id)sender
{
    static NSString *warnstr, *closestr, *okstr, *cancelstr;
    NSAlert *alert;

    if (![window isDocumentEdited])
        return YES;
    if (warnstr == nil) {
        warnstr = NSLocalizedString(@"File %@ is edited.", "Edited");
        closestr = NSLocalizedString(@"Close the window?", "Close?");
        okstr = NSLocalizedString(@"OK", "OK");
        cancelstr = NSLocalizedString(@"Cancel", "Cancel");
    }
    alert = [NSAlert alertWithMessageText:closestr
        defaultButton:okstr alternateButton:cancelstr otherButton:nil
        informativeTextWithFormat:warnstr,
                [filename lastPathComponent]];
    [alert beginSheetModalForWindow:window modalDelegate:self
        didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:)
        contextInfo:nil];
    return NO;
}

/* Delegate Method */
- (void)windowWillClose:(NSNotification *)aNotification {
    [self removeWindowClosing: NO];
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)win {
    return undoManager;
}

@end
