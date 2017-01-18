/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSString *email;
    int       age;
}
- (id)initWithName:(NSString *)str age:(int)num;
@end

@implementation Person
- (id)initWithName:(NSString *)str age:(int)num {
    if ((self = [super init]) != nil) {
        name = str;
        age = num;
    }
    return self;
}
@end

@interface WorkingGroup : NSObject
{
    Person         *leader;
    NSMutableArray *members;
}
- (id)initWithLeader:(Person *)who;
@end

@implementation WorkingGroup
- (id)initWithLeader:(Person *)who {
    if ((self = [super init]) != nil) {
        leader = who;
        members = [NSMutableArray array];
    }
    return self;
}
- (void)addMember:(Person *)p {
    [members addObject:p];
}
@end


int main(int argc, char **argv)    // Use ARC
{
    @autoreleasepool {
        WorkingGroup *group;
        id chief = [[Person alloc] initWithName:@"Taro" age:30];
        id staff1 = [[Person alloc] initWithName:@"Yuzo" age:26];
        id staff2 = [[Person alloc] initWithName:@"Miho" age:24];
        group = [[WorkingGroup alloc] initWithLeader:chief];
        [group addMember: staff1];
        [group addMember: staff2];

        NSLog(@"1: %@", [group valueForKeyPath:@"leader.name"]);
        NSLog(@"2: %@", [group valueForKeyPath:@"members.name"]);
        NSLog(@"3: %@", [group valueForKeyPath:@"members.age"]);
        [group setValue:@"Jiro" forKeyPath:@"leader.name"];
        [group setValue:[NSNumber numberWithInt:10]
             forKeyPath:@"members.age"];
        NSLog(@"4: %@", [group valueForKeyPath:@"leader.name"]);
        NSLog(@"5: %@", [group valueForKeyPath:@"members.age"]);
    }
    return 0;
}
