/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSObject.h>

@interface RGB : NSObject

- (id)initWithRed:(int)r green:(int)g blue:(int)b;
- (id)blendColor:(RGB *)color;
- (void)print;

@end

@interface RGBColor : RGB
- (int)brightness;
@end
