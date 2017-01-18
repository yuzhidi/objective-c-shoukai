/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Cocoa/Cocoa.h>
#import "ShowImage.h"

int main(int argc, const char **argv)
{
    if (argc <= 1)
        return 1; // Error
    @autoreleasepool {
        id theProxy = [NSConnection
            rootProxyForConnectionWithRegisteredName:SERVER host:@""];
        if (theProxy) {
            NSString *s, *r;
            [theProxy setProtocolForProxy: @protocol(ShowImage)];
            s = [NSString stringWithUTF8String:argv[1]];
            r = [theProxy showImage: [NSURL fileURLWithPath:s]];
            if (r) fprintf(stderr, "Message: %s\n", [r UTF8String]);
        }else
            fprintf(stderr, "Error: Can't connect\n");
    }
    return 0;
}
