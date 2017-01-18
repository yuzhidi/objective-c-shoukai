/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#include <stdio.h>

void func(int (^block)(int))
{
    int v = block(10);
    printf("%d\n", v);
}

int main(void)
{
    int (^b)(int) = ^(int x){ return x * 2; };
    printf("%d\n", b(4));
    func(b);
    func(^(int a){
        int i, k = 0;
        for (i = a; i > 0; i--) k += i;
        return k;
    });
    return 0;
}
