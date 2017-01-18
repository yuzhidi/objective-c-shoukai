/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#include <stdio.h>
#include <Block.h>

void pr(int (^block)(void)) {
    printf("%d\n", block());
}

int (^g)(void) = ^{ return 100; };

void func1(int n) {
    int (^b1)(void) = ^{ return n; };
    pr(b1);
    g = Block_copy(b1);
}

void func2(int n) {
    int a = 10;
    int (^b2)(void) = ^{ return n * a; };
    pr(b2);
}

int main(void)
{
    pr(g);
    func1(5);
    func2(5);
    pr(g);
    return 0;
}
