/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "MyViewerCtrl+Connection.h"
#import <Cocoa/Cocoa.h>
#import "WinCtrl.h"

@implementation MyViewerCtrl (Connection)

- (NSString *)showImage:(NSURL *)aFile
{
    if ([[NSFileManager defaultManager]
            isReadableFileAtPath:[aFile path]]) {
        (void)[[WinCtrl alloc] initWithURL:aFile];
        return nil;
    }
    return @"Can't read";
}

NSConnection *conn = nil;

/* Delegate Method */
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    conn = [[NSConnection alloc] init];
    [conn setRootObject:self];
    if ([conn registerName:SERVER] == NO) {
        NSLog(@"Can't establish %@ server.\n", SERVER);
    }
}

@end
