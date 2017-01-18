/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import "People.h"
#import <stdio.h>

@implementation People

- (id)initWithName:(const char *)p {
    if ((self = [super init]) != nil) {
        name = p;
        friend = nil;
    }
    return self;
}

- (void)setFriend:(id)obj { friend = obj; }

- (const char *)nameOfFriend {
    if (friend == nil) return "none";
    return friend->name;
}

+ (void)makeFriends:(People __strong *[])p {
    [p[0] setFriend: p[1]];
    [p[1] setFriend: p[0]];
}

+ (void)printFriends:(People *const [])p number:(int)n
{
    for (int i = 0; i < n; i++)
        printf("%d: %s\n", i, [p[i] nameOfFriend]);
}

@end
