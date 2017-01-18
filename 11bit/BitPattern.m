/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import "BitPattern.h"

@implementation BitPattern

- (id)initWithChar:(char)val
{
    if ((self = [super init]) != nil)
        value = val;
    return self;
}

- (NSUInteger)length
{
    return 8;
}

- (unichar)characterAtIndex:(NSUInteger)index
{
    return (value & (0x80 >> index)) ? '1' : '0';
}

@end
