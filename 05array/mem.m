/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdlib.h>
#import "People.h"

int main(void)
{
    People *__strong *a;
    static const char *const names[] = {
        "Laura", "Donna", "James", "Audrey" };
    a = (People *__strong *)calloc(sizeof(People *), 4);
    @autoreleasepool {
        for (int i = 0; i < 4; i++)
            a[i] = [[People alloc] initWithName:names[i]];
        [People makeFriends: &a[0]];
        [People makeFriends: &a[2]];
        a[0] = nil;
    }
    [People printFriends:a number:4];
    for (int i = 0; i < 4; i++)
        a[i] = nil;
    free(a);
    return 0;
}
