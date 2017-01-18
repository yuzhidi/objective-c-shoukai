/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#include <stdio.h>

void myfunc(int m, void (^b)(void)) {
    printf("%d: ", m);
    b();
}

int glob = 1000;

int main(void)
{
    void (^block)(void);
    static int s = 20;
    int a = 20;

    block = ^{ printf("%d, %d, %d\n", glob, s, a); };
    myfunc(1, block);
    s = 0;
    a = 0;
    glob = 5000;
    myfunc(2, block);
    block = ^{ printf("%d, %d, %d\n", glob, s, a); };
    myfunc(3, block);
    return 0;
}
