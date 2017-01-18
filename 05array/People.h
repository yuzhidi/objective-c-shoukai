/*** Copyright: OGIHARA Takeshi, Arg. 2011 ***/

#import <Foundation/Foundation.h>

@interface People : NSObject {
    const char *name;
    __weak People *friend;
}
- (id)initWithName:(const char *)p;
- (void)setFriend:(id)obj;
- (const char *)nameOfFriend;
+ (void)makeFriends:(People *__strong [])p;
+ (void)printFriends:(People *const [])p number:(int)n;
@end
