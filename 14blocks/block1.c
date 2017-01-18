/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#include <stdio.h>

int main(void)
{
    int k = 10;
    void (^b)(int) = ^(int i){ printf("%d\n", i); };

    b(5);
    b(k * 2);
    return 0;
}
