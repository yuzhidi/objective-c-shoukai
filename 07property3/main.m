/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Creature.h"
#import <stdio.h>

int main(void)
{
    @autoreleasepool {
        Creature *a = [[Creature alloc] initWithName:@"Nike"];
        a.hitPoint = 50;
        a.magicPoint = 80;
        printf("%s: HP=%d, MP=%d (LV=%d)\n",
            [a.name UTF8String], a.hitPoint, a.magicPoint, a.level);
    }
    return 0;
}
