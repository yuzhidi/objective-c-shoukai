/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSString *email;
    int       age;
}
- (void)setName:(NSString *)aName;
- (NSString *)email;
@end

@implementation Person

- (void)setName:(NSString *)aName
{
    NSLog(@"Access: setName:");
    name = aName;
}

- (NSString *)email
{
    NSLog(@"Access: email:");
    return email;
}

@end

int main(void)
{
    static NSString *keys[] = { @"name", @"email", @"age", nil };
    @autoreleasepool {
        id obj = [[Person alloc] init];
        [obj setValue:@"Taro" forKey:@"name"];
        [obj setValue:@"taro@ryugu-jo" forKey:@"email"];
        [obj setValue:[NSNumber numberWithInt:16] forKey:@"age"];
        for (int i = 0; keys[i]; i++)
            NSLog(@"%@: %@", keys[i], [obj valueForKey:keys[i]]); 
    }
    return 0;
}
