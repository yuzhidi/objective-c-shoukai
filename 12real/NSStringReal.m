/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import "NSStringReal.h"

@implementation NSString (Real)
- (double)realValue
{
    return [self doubleValue];
}
@end
