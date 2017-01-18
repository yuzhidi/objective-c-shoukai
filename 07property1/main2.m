/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Creature2.h"
#import <stdio.h>

int main(void)
{
    @autoreleasepool {
        Creature *a = [[Creature alloc] initWithName:@"Nike"];
        a.hitPoint = 50;
        printf("%s: HP=%d (LV=%d)\n",
            [a.name UTF8String], a.hitPoint, a.level);
    }
    return 0;
}
