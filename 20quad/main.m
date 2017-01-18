/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Cocoa/Cocoa.h>
#import "FunctionCtrl.h"

int main(int argc, char **argv) {
    @autoreleasepool {
        id controller = [[FunctionCtrl alloc] init];
        id app = [NSApplication sharedApplication];
        [app setDelegate:controller];
        [app run];
    }
    return 0;
}
