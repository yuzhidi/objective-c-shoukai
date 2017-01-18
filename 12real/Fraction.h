/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSObject.h>
#import "RealNumber.h"

@class NSString;

@interface Fraction : NSObject <RealNumber>
{
   int sgn;   // sign
   int num;   // numerator
   int den;   // denominator
}

+ (id)fractionWithNumerator:(int)n denominator:(int)d;
- (id)initWithNumerator:(int)n denominator:(int)d;
- (Fraction *)add:(Fraction *)obj;
- (Fraction *)sub:(Fraction *)obj;
- (Fraction *)mul:(Fraction *)obj;
- (Fraction *)div:(Fraction *)obj;
- (NSString *)description;

@end
