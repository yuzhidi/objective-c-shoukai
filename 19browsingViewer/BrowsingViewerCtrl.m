/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "BrowsingViewerCtrl.h"
#import <Cocoa/Cocoa.h>
#import "BrowsingWinCtrl.h"

@implementation BrowsingViewerCtrl

- (void)openDirectory:(id)sender
{
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
    [oPanel setAllowsMultipleSelection:NO];
    [oPanel setCanChooseDirectories:YES];
    [oPanel beginWithCompletionHandler: ^(NSInteger result) {
        NSArray *files, *types;
        if (result != NSFileHandlingPanelOKButton)
            return;
        files = [[NSFileManager defaultManager]
            contentsOfDirectoryAtURL:[oPanel URL]
            includingPropertiesForKeys:NULL
            options:NSDirectoryEnumerationSkipsHiddenFiles
            error:NULL];
        types = [NSImage imageFileTypes];
        NSMutableArray *images = [NSMutableArray array];
        for (NSURL *url in files) {
            if ([types containsObject:[url pathExtension]])
                [images addObject:url];
        }
        if ([images count] > 0)
            (void)[[BrowsingWinCtrl alloc] initWithURLs:images];
    }];
}

@end
