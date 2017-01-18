/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSObject.h>
#import <stdio.h>
#if !defined(LOOP)
# define  LOOP	3000
#endif

unsigned long rnd = 201109;

@interface testObj : NSObject
- (int)testMethod;
@end

@implementation testObj
- (int)testMethod {
    rnd = rnd * 1103515245UL + 12345;
    return (rnd & 1) ? 1 : -1;
}
@end

int main(void)
{
    int (*f)(id, SEL);
    id obj = [[testObj alloc] init];
    int v = [obj testMethod];
    f = (int (*)(id,SEL))[obj methodForSelector:@selector(testMethod)];
    for (int i = 0; i < LOOP; i++)
        for (int j = 0; j < 20000; j++)
            v += (*f)(obj, @selector(testMethod));
    return (v == 0);
}
