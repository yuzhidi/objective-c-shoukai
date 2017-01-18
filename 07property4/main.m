/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Creature.h"
#import <stdio.h>

int main(void)
{
    @autoreleasepool {
        Creature *a = [[Creature alloc] initWithName:@"Addberg"];
        a.hitPoint = 50;
        a.magicPoint = 10;
        a.speed = 80;
        a.skill = 250;
        printf("%s: HP=%d, MP=%d (LV=%d); speed=%d, skill=%d\n",
            [a.name UTF8String], a.hitPoint, a.magicPoint, a.level,
            a.speed, a.skill);
    }
    return 0;
}
