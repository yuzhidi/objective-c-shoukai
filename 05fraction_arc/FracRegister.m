/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import "FracRegister.h"
#import <stdio.h>

@implementation FracRegister

- (id)init {
    if ((self = [super init]) != nil)
        current = prev = nil;
    return self;
}

- (Fraction *)currentValue { return current; }

- (void)setCurrentValue:(Fraction *)val
{
    current = val;
    prev = nil;
}

- (BOOL)undoCalc
{
    if (prev == nil)
        return NO;
    current = prev;
    prev = nil;
    return YES;
}

- (void)calculate:(char)op with:(Fraction *)arg
{
    Fraction *result = nil;

    if (current != nil && arg != nil)
        switch (op) {
        case '+':
            result = [current add: arg];
            break;
        case '-':
            result = [current sub: arg];
            break;
        case '*':
            result = [current mul: arg];
            break;
        case '/':
            result = [current div: arg];
            break;
        default: // Error
            break;
        }
    if (result != nil) {
        prev = current;
        current = result;
    }else
        printf("Illegal Operation\n");
}

@end
