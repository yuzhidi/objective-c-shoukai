/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#include <Foundation/NSObject.h>
#include <stdio.h>

@interface A : NSObject
+ (void)initialize;
@end

@implementation A
+ (void)initialize {  printf("I'm A\n"); }
@end

@interface B : A
+ (void)initialize;
+ (void)setMessage:(const char *)msg;
- (void)sayHello;
@end

static const char *myMessage = "Hello";

@implementation B
+ (void)initialize { printf("I'm B\n"); }
+ (void)setMessage:(const char *)msg { myMessage = msg; }
- (void)sayHello { printf("%s\n", myMessage); }
@end

int main(void)
{
    id obj = [[B alloc] init];
    [obj sayHello];
    [B setMessage: "Have a good day!"];
    [obj sayHello];
    return 0;
}
