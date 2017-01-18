/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#include <stdio.h>
#include <Block.h>

void pr(int (^block)(void)) {
    printf("%d\n", block());
}

void func1(void) {
    int i;
    int (^blocks1[10])(void);
    for (i = 0; i < 10; i++)
        blocks1[i] = ^{ return i; };
    for (i = 0; i < 10; i++)
        pr(blocks1[i]);
}

void func2(void) {
    int i;
    int (^blocks2[10])(void);
    for (i = 0; i < 10; i++)
        blocks2[i] = Block_copy( ^{ return i; } );
    for (i = 0; i < 10; i++)
        pr(blocks2[i]);
}

int main(void)
{
    func1();
    func2();
    return 0;
}
