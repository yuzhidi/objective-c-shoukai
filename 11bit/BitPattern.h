/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import <Foundation/NSString.h>

@interface BitPattern : NSString
{
    unsigned char  value;
}

- (id)initWithChar:(char)val;    /* designated initializer */
- (NSUInteger)length;
- (unichar)characterAtIndex:(NSUInteger)index;
@end
