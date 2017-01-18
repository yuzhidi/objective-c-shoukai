/*** Copyright: OGIHARA Takeshi, Jan. 2008 ***/

#import <Foundation/NSObject.h>
#import "Fraction.h"

@interface FracRegister : NSObject
{
    Fraction *current;
    Fraction *prev;
}

- (id)init;
- (void)dealloc;
- (Fraction *)currentValue;
- (void)setCurrentValue:(Fraction *)val;
- (BOOL)undoCalc;
- (void)calculate:(char)op with:(Fraction *)arg;

@end
