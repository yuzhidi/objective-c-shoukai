/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSObject.h>
#import <stdio.h>

@interface A : NSObject
- (void)whoAreYou;
@end

@implementation A
- (void)whoAreYou { printf("I'm A\n"); }
@end

@interface B : NSObject
- (void)whoAreYou;
@end

@implementation B
- (void)whoAreYou { printf("I'm B\n"); }
@end

int main(void)
{
    id obj;
    int n;

    scanf("%d", &n);
    switch (n) {
    case 0:  obj = [[A alloc] init]; break;
    case 1:  obj = [[B alloc] init]; break;
    case 2:  obj = [[NSObject alloc] init]; break;
    }
    [obj whoAreYou];
    return 0;
}
