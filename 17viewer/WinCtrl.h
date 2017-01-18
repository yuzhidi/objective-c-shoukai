/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Cocoa/Cocoa.h>

extern NSString *ShrinkAllNotification;
extern NSString *SizeDidChangeNotification;

@interface WinCtrl : NSObject <NSWindowDelegate>
{
    NSString *filename;
    NSWindow *window;
}
+ (void)initialize;
+ (BOOL)autoResize;
+ (void)setAutoResize:(BOOL)flag;
- (id)initWithURL:(NSURL *)aFile;
- (NSString *)attributesOfImage;
- (void)shrink:(id)sender;
@end
