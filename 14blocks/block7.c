/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#include <stdio.h>
#include <Block.h>

void (^g)(void) = NULL;
int c = 0;

void func(int n) {
    __block int sh = 0;
    void (^b1)(void) = ^{
        sh += 1;
        printf("%d: b1, n=%d, sh=%d\n", ++c, n, sh); };
    void (^b2)(void) = ^{
        sh += 20;
        printf("%d: b2, n=%d, sh=%d\n", ++c, n, sh); };

    b1();
    b2();
    g = Block_copy(b1);
    sh += n * 1000;
    n = 999;
    b2();
}

int main(void)
{
    void (^myblock)(void);
    func(1);
    myblock = g;
    myblock();
    func(2);
    myblock();
    Block_release(g);
    Block_release(myblock);
    return 0;
}
