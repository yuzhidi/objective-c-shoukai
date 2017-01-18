/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import "Volume.h"
#import <stdio.h>

int main(void)
{
    id v, w;

    v = [[Volume alloc] initWithMin:0 max:10 step:2];
    w = [[Volume alloc] initWithMin:0 max:9 step:3];
    [v up];
    printf("%d %d\n", [v value], [w value]);
    [v up];
    [w up];
    printf("%d %d\n", [v value], [w value]);
    [v down];
    [w down];
    printf("%d %d\n", [v value], [w value]);
    return 0;
}
