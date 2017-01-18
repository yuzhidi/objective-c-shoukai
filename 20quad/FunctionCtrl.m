/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "FunctionCtrl.h"
#import <Cocoa/Cocoa.h>
#import "QuadraticView.h"


@implementation FunctionCtrl

/* Local Method */
- (void)setupMainMenu
{
    NSMenuItem *item;
    NSMenu *menu, *submenu;

    menu = [[NSMenu alloc] initWithTitle: AppName];
    item = [menu addItemWithTitle:@"Action"
        action:@selector(submenuAction:) keyEquivalent:@""];
    submenu = [[NSMenu alloc] initWithTitle:@"Action"];
    [menu setSubmenu:submenu forItem:item];
    item = [submenu addItemWithTitle:@"Quit " AppName
        action:@selector(terminate:) keyEquivalent:@"q"];
    // if target is nil, the message is sent to the first responder.
    [NSApp setMainMenu:menu];
}

/* Local Method */
- (void)windowSetUp
{
    const CGFloat space = 32.0;
    const CGFloat vmgn1 = 24.0;
    const CGFloat vmgn2 = vmgn1 + space * 3 + 12.0;
    const CGFloat hmgn1 = 30.0, hmgn2 = 10.0;
    const CGFloat titwid = 16.0, digwid = 48.0, sliderwid = 300.0;
    const int maxtick = 6;
    static NSString *title[] = { @"a", @"b", @"c" };
    static double initVal[] = { 1.0, 0.0, -1.0 };
    NSSize vsize = NSMakeSize(500.0, 500.0);
    NSRect winrect, r;
    NSView *cview;
    NSTextField *tx[3], *t;
    NSSlider *sl[3];
    QuadraticView *qv;
    int i;
    CGFloat vp, hp;
    NSString *str;
    NSMutableDictionary *dic;
    dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
        [NSNumber numberWithDouble:initVal[0]], @"a",
        [NSNumber numberWithDouble:initVal[1]], @"b",
        [NSNumber numberWithDouble:initVal[2]], @"c", nil];
    objCtrl = [[NSObjectController alloc] initWithContent:dic];

    NSNumberFormatter *nFormatter = [[NSNumberFormatter alloc] init];
    [nFormatter setFormat:@"0.00"];

    winrect.origin = NSMakePoint(200.0, 200.0);
    winrect.size = NSMakeSize(vsize.width, vsize.height + vmgn2);
    window = [[NSWindow alloc] initWithContentRect:winrect
        styleMask: NSTitledWindowMask
        backing:NSBackingStoreBuffered defer:YES];
    [window setReleasedWhenClosed:NO];
    [window setTitle: AppName];
    r.size = vsize;
    r.origin = NSMakePoint(0.0, vmgn2);
    qv = [[QuadraticView alloc] initWithFrame:r];
    cview = [window contentView];

    vp = vmgn1 + space * 2;
    for (i = 0; i < 3; i++, vp -= space) {
        hp = hmgn1;
        r = NSMakeRect(hp, vp, titwid, 16.0);
        t = [[NSTextField alloc] initWithFrame:r];
        [cview addSubview: t];
        [t setStringValue:title[i]];
        [t setEditable:NO];
        [t setBezeled:NO];
        [t setDrawsBackground:NO];
        hp += titwid + hmgn2;
        r = NSMakeRect(hp, vp-6.0, digwid, 24.0);
        tx[i] = [[NSTextField alloc] initWithFrame:r];
        [cview addSubview: tx[i]];
        [tx[i] setEditable:YES];
        [tx[i] setBezeled:YES];
        [tx[i] setDrawsBackground:YES];
        [tx[i] setAlignment: NSRightTextAlignment];
        [tx[i] setFormatter: nFormatter];
        [tx[i] setFloatValue: initVal[i]];

        hp += digwid + hmgn2;
        r = NSMakeRect(hp, vp-6.0, sliderwid, 24.0);
        sl[i] = [[NSSlider alloc] initWithFrame:r];
        [cview addSubview: sl[i]];
        [sl[i] setMaxValue:(float) maxtick];
        [sl[i] setMinValue:(float)-maxtick];
        [sl[i] setFloatValue: initVal[i]];
        [sl[i] setNumberOfTickMarks: maxtick * 2 + 1];

        str = [NSString stringWithFormat:@"content.%@", title[i]];
        [tx[i] bind:@"value" toObject:objCtrl withKeyPath:str options:nil];
        [sl[i] bind:@"value" toObject:objCtrl withKeyPath:str options:nil];
        [qv bind:title[i] toObject:objCtrl withKeyPath:str options:nil];
    }
    [qv setCoefficients: dic];
    [cview addSubview: qv];
}

/* Application Delegate Message */
- (void)applicationDidFinishLaunching:(NSNotification *)note
{
    [self setupMainMenu];
    [self windowSetUp];
    [window makeKeyAndOrderFront:self];
}

@end
