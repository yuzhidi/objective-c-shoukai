/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "MyViewerCtrl.h"
#import "WinCtrl.h"
#import "MyInspector.h"

static NSString *AutoResizeKey = @"AutoResize";
static id sharedCntr = nil;

@implementation MyViewerCtrl
{
    __weak id autoResizeItem;
    NSMutableArray *ctrlPool;
}

+ (id)sharedController {
    if (sharedCntr == nil)
        sharedCntr = [[[self class] alloc] init];
    return sharedCntr;
}

/* Local Method */
- (NSMenu *)makeSubMenu:(NSArray *)itemsArray
    title:(NSString *)title note:(NSMutableDictionary *)iddic
{
    NSMenu *menu = [[NSMenu alloc] initWithTitle:title];
    for (NSDictionary *dic in itemsArray) {
        NSMenuItem *item;
        NSString *itemtitle = [dic objectForKey:@"title"];
        if (itemtitle == nil) { // menu separator
            [menu addItem:[NSMenuItem separatorItem]];
            continue;
        }
        NSArray *sub = [dic objectForKey:@"submenu"];
        if (sub != nil) {
            NSMenu *submenu;
            item = [menu addItemWithTitle:itemtitle
                         action:(SEL)0 keyEquivalent:@""];
            submenu = [self makeSubMenu:sub title:itemtitle note:iddic];
            [item setSubmenu: submenu];
        }else {
            NSString *key = [dic objectForKey:@"key"];
            NSString *targetstr = [dic objectForKey:@"target"];
            SEL sel = NSSelectorFromString([dic objectForKey:@"selector"]);
            item = [menu addItemWithTitle:itemtitle
                         action:sel keyEquivalent:(key ? key : @"")];
            [item setTarget: (targetstr ? self : nil)];
        }
        if (iddic != nil) {
            NSString *idkey = [dic objectForKey:@"id"];
            if (idkey != nil)
                [iddic setObject:item forKey:idkey];
        }
    }
    return menu;
}

- (void)setupMainMenu
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Menu" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableDictionary *iddic = [NSMutableDictionary dictionary];
    NSMenu *menu = [self makeSubMenu:[dic objectForKey:@"submenu"]
                         title:[dic objectForKey:@"title"] note:iddic];
    [NSApp setMainMenu: menu];
    [NSApp setWindowsMenu: [[iddic objectForKey:@"window"] submenu]];
    autoResizeItem = [iddic objectForKey:@"autoResize"];
}

- (void)openFile:(id)sender
{
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
    [oPanel setAllowsMultipleSelection:YES];
    [oPanel setAllowedFileTypes:[NSImage imageFileTypes]];
    [oPanel beginWithCompletionHandler: ^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            for (NSURL *aFile in [oPanel URLs])
                (void)[[WinCtrl alloc] initWithURL:aFile];
        }
    }];
}

- (void)addWinCtrl:(id)obj {
    [ctrlPool addObject:obj];
}

- (void)removeWinCtrl:(id)obj {
    [ctrlPool removeObject:obj];
}

- (void)activateInspector:(id)sender
{
    static Class inspectorClass = Nil;
    NSBundle *bundle;
    NSString *path;

    if (inspectorClass == Nil) {
        path = [[NSBundle mainBundle]
                   pathForResource:@"Inspector" ofType:@"bundle"];
        if ((bundle = [NSBundle bundleWithPath: path]) == nil)
            return; // ERROR!
        inspectorClass = [bundle classNamed:@"MyInspector"];
    }
    [[inspectorClass sharedInstance] activate];
}

- (void)toggleAutoResize:(id)sender
{
    BOOL newState = ([sender state] != NSOnState);
    [WinCtrl setAutoResize: newState];
    [sender setState:(newState ? NSOnState : NSOffState)];
    [[NSUserDefaults standardUserDefaults]
        setBool:newState forKey:AutoResizeKey];
}

/* Delegate Method */
- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    BOOL flag;
    [self setupMainMenu];
    ctrlPool = [NSMutableArray array];
    flag = [[NSUserDefaults standardUserDefaults]
                                boolForKey:AutoResizeKey];
    [WinCtrl setAutoResize: flag];
    [autoResizeItem setState:(flag ? NSOnState : NSOffState)];
}

/* Delegate Method */
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
