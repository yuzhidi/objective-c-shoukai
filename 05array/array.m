/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import <Foundation/Foundation.h>
#import "People.h"

int main(void)
{
    People *a[4];
    static const char *const names[] = {
        "Laura", "Donna", "James", "Audrey" };
    @autoreleasepool {
        for (int i = 0; i < 4; i++)
            a[i] = [[People alloc] initWithName:names[i]];
        [People makeFriends: &a[0]];
        [People makeFriends: &a[2]];
        a[0] = nil;
    }
    [People printFriends:a number:4];
    return 0;
}
