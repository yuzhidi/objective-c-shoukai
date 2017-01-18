/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSObject.h>

@interface RGB : NSObject
{
    unsigned char  red, green, blue;
}

- (id)initWithRed:(int)r green:(int)g blue:(int)b;
- (id)blendColor:(RGB *)color;
- (void)print;

@end
