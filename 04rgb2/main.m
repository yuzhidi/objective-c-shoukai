/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "RGB.h"
#import <stdio.h>

int main(void)
{
    RGB *u;
    RGBColor *w;

    u = [[RGB alloc] initWithRed:255 green:127 blue:127];
    w = [[RGBColor alloc] initWithRed:0 green:127 blue:64];
    [u print];
    [w print];
    printf("Brightness: %d\n", [w brightness]);
    [[w blendColor: u] print];
    printf("Brightness: %d\n", [w brightness]);
    return 0;
}
