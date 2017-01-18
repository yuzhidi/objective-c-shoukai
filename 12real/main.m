/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <stdio.h>
#import "RealNumber.h"
#import "Fraction.h"
#import "NSStringReal.h"
#import "RealArray.h"

int main(void)
{
    @autoreleasepool {
        id array = [NSMutableArray array];
        [array addRealNumber:@"1.3"];
        [array addRealNumber:@"0.35"];
        [array addRealNumber:@"0.2"];
        [array addRealNumber:
            [Fraction fractionWithNumerator:1 denominator:3]];
        [array addRealNumber:
            [Fraction fractionWithNumerator:3 denominator:8]];
        [array addRealNumber:
            [Fraction fractionWithNumerator:3 denominator:2]];
        [array sort];
        printf("%s\n", [[array description] UTF8String]);
    }
    return 0;
}
