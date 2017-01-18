/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#include <stdio.h>

void pr(int (^block)(void)) {
    printf("%d\n", block());
}

void func(void) {
    int i;
    int (^blocks[10])(void);
    for (i = 0; i < 10; i++)
        blocks[i] = ^{ return i; };
    for (i = 0; i < 10; i++)
        pr(blocks[i]);
}

int main(void)
{
    @autoreleasepool {
        func();
    }
    return 0;
}
