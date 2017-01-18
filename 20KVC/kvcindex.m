/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>

#define MAXMEMBER  8

@interface Team : NSObject
{
    id   members[MAXMEMBER];
    int  count;
}
- (NSUInteger)countOfFellows;
- (id)objectInFellowsAtIndex:(NSUInteger)index;
@end

@implementation Team
- (void)addMember:(id)someone {
    if (count < MAXMEMBER)
        members[count++] = someone;
}

- (NSUInteger)countOfFellows {
     return count; 
}

- (id)objectInFellowsAtIndex:(NSUInteger)index {
    return (index < count) ? members[index] : nil;
}
@end

int main(void)
{
    @autoreleasepool {
        id obj;
        id aTeam = [[Team alloc] init];
        [aTeam addMember:@"Hiroshi"];
        [aTeam addMember:@"Mika"];
        obj = [aTeam valueForKey:@"fellows"];
        NSLog(@"obj=%@", NSStringFromClass([obj class]));
        NSLog(@"Fellows: %@", obj); 
    }
    return 0;
}
