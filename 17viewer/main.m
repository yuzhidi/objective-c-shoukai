/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Cocoa/Cocoa.h>
#import "MyViewerCtrl.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        MyViewerCtrl *controller = [MyViewerCtrl sharedController];
        NSApplication *app = [NSApplication sharedApplication];
        [app setDelegate:controller];
        [app run];
    }
    return 0;
}
