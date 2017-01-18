/*** Copyright: OGIHARA Takeshi, Jan. 2008 ***/

#import <Foundation/NSObject.h>

@class NSString;

@interface Fraction : NSObject
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
