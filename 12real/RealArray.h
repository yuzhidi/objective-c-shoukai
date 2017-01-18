/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSArray.h>
#import "RealNumber.h"

@interface NSMutableArray (RealArray)
- (void)addRealNumber:(id <RealNumber>)number;
- (void)sort;
@end
