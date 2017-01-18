/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/NSObject.h>
#define  AppName    @"Quadratic"

@class NSWindow, NSNotification, NSObjectController;

@interface FunctionCtrl : NSObject
{
    NSWindow *window;
    NSObjectController *objCtrl;
}

/* Application Delegate Message */
- (void)applicationDidFinishLaunching:(NSNotification *)note;
@end
