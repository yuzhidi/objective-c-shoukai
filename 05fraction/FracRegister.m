/*** Copyright: OGIHARA Takeshi, Feb. 2008 ***/

#import "FracRegister.h"
#import <stdio.h>

@implementation FracRegister

- (id)init {
    if ((self = [super init]) != nil)
        current = prev = nil;
    return self;
}

- (void)dealloc {
    [current release];
    [prev release];
    [super dealloc];
}

- (Fraction *)currentValue { return current; }

- (void)setCurrentValue:(Fraction *)val
{
    [val retain];
    [current release];
    current = val;
    [prev release];
    prev = nil;
}

- (BOOL)undoCalc
{
    if (prev == nil)
        return NO;
    [current release];
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
        [result retain];
        [prev release];
        prev = current;
        current = result;
    }else
        printf("Illegal Operation\n");
}

@end
