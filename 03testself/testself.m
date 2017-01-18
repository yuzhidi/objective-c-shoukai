/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSObject.h>
#import <stdio.h>

@interface A: NSObject
- (void)method1;
- (void)method2;
@end

@implementation A
- (void)method1 { printf("method1 of Class A\n"); }
- (void)method2 { printf("method2 of Class A\n"); }
@end

@interface B: A
- (void)method2;
@end

@implementation B
- (void)method2 {
    printf("method2 of Class B\n");
    printf("self --> ");
    [self method1];
    printf("super--> ");
    [super method2];
}
@end

@interface C: B
- (void)method1;
@end

@implementation C
- (void)method1 { printf("method1 of Class C\n"); }
@end

int main(void)
{
    id x = [[B alloc] init];
    id y = [[C alloc] init];
    printf("--- instance of B ---\n");
    [x method1];
    [x method2];
    printf("--- instance of C ---\n");
    [y method1];
    [y method2];
    return 0;
}
