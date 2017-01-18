/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#include <stdio.h>

int main(void)
{
    const struct {
        const char *title;
        size_t     sz;
    } table[] = {
        { "char",  sizeof(char) },
        { "short", sizeof(short) },
        { "int",   sizeof(int) },
        { "long",  sizeof(long) },
        { "long long", sizeof(long long) },
        { "int *", sizeof(int *) },
        { "float", sizeof(float) },
        { "double", sizeof(double) },
        { "long double", sizeof(long double) },
        { NULL, 0 }
    };
    int i;

#if __LP64__
    printf("LP64\n");
#else
    printf("ILP32\n");
#endif
    for (i = 0; table[i].sz; i++)
        printf("%-12s %2ld\n", table[i].title, table[i].sz);
    return 0;
}
