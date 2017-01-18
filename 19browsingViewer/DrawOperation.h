/*** Copyright: OGIHARA Takeshi, Sept. 2010 ***/

#import <Cocoa/Cocoa.h>

@interface DrawOperation : NSOperation
{
    NSURL          *file;
    __weak NSView  *view;  // parent
    NSPoint  location;
}
+ (void)setPictureSize:(CGFloat)value;
- (id)initWithURL:(NSURL *)imgurl
    parentView:(NSView *)parent at:(NSPoint)loc;
- (void)main;
@end
