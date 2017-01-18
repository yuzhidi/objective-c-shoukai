/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import "Fraction.h"
#import "FracRegister.h"
#import <Foundation/NSString.h>
#import <stdio.h>

#define BUFSIZE  80

static Fraction *getFraction(const char *buf)
{
    int a, b, c;

    if (sscanf(buf, "%d'%d/%d", &a, &b, &c) == 3)
        b = (a < 0) ? (a * c - b) : (a * c + b);
    else if (sscanf(buf, "%d/%d", &b, &c) != 2) {
        if (sscanf(buf, "%d", &b) == 1)
            c = 1;
        else
            return nil;
    }
    return [Fraction fractionWithNumerator:b denominator:c];
}

static Fraction *readFraction(FILE *fp)
{
    char buf[BUFSIZE];
    Fraction *frac = nil;

    for ( ; ; ) {
        if (fgets(buf, BUFSIZE, fp) == NULL) // EOF is input
            return nil;
        if ((frac = getFraction(buf)) != nil)
            break;
    }
    return frac;
}

int main(void)
{
    char com[BUFSIZE], cc;
    BOOL contflag = YES;
    FracRegister *reg;
    Fraction *val;

    @autoreleasepool {
        reg = [[FracRegister alloc] init];

        while (contflag)
            @autoreleasepool {
                printf("? ");
                if ((val = readFraction(stdin)) != nil)
                    [reg setCurrentValue:val];
                else
                    contflag = NO;

                while (contflag) {
                    if (fgets(com, BUFSIZE, stdin) == NULL
                        || (cc = com[0]) == 'q' || cc == 'Q') {
                        contflag = NO;
                        break;
                    }
                    if (cc == 'c' || cc == 'C') // Clear
                        break;
                    if (cc == '+' || cc == '-' || cc == '*' || cc == '/') {
                        if ((val = getFraction(com+1)) == nil)
                            val = readFraction(stdin);
                        if (val == nil) { // EOF
                            contflag = NO;
                            break;
                        }
                        [reg calculate:cc with:val];
                    }else if (cc == 'u' || cc == 'U') { // Undo
                        if (![reg undoCalc])
                            printf("Can't UNDO\n");
                    }else {
                        printf("Illegal operator\n");
                        continue;
                    }
                    printf("= %s\n",
                        [[[reg currentValue] description] UTF8String]);
                }
            }
    }
    return 0;
}
