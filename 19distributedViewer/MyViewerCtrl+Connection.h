/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "MyViewerCtrl.h"
#import "ShowImage.h"

@interface MyViewerCtrl (Connection) <ShowImage>
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
@end
