/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Cocoa/Cocoa.h>

@interface MyInspector: NSObject <NSWindowDelegate>
{
    NSPanel            *panel;
    __weak NSTextField *textfield;
}

+ (id)sharedInstance;
- (id)init;
- (void)activate;
- (void)showMain:(NSNotification *)aNotification;
- (void)windowClosed:(NSNotification *)aNotification;
- (void)shrinkAll:(id)sender;
@end
