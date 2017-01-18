/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Cocoa/Cocoa.h>
#import "BrowsingViewerCtrl.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        BrowsingViewerCtrl *controller = [BrowsingViewerCtrl sharedController];
        NSApplication *app = [NSApplication sharedApplication];
        [app setDelegate:controller];
        [app run];
    }
    return 0;
}
