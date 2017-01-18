/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Cocoa/Cocoa.h>

@interface MyViewerCtrl: NSObject <NSApplicationDelegate>
+ (id)sharedController;
- (void)setupMainMenu;
- (void)openFile:(id)sender;
- (void)addWinCtrl:(id)obj;
- (void)removeWinCtrl:(id)obj;
- (void)activateInspector:(id)sender;
- (void)toggleAutoResize:(id)sender;
@end
