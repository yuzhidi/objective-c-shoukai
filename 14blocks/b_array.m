/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <Block.h>

int main(void)
{
    NSUInteger i;
    id pool = [[NSAutoreleasePool alloc] init];
    BOOL (^block)(id, NSUInteger, BOOL *)
        = ^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqualToString:@"End"])
                *stop = YES;
            return (BOOL)([obj length] > 10);
        };
    void (^print)(id, NSUInteger, BOOL *)
        = ^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqualToString:@"Quit"])
                *stop = YES;
            else
                printf("%d: %s\n", (int)idx, [obj UTF8String]);
        };

    id a = [NSMutableArray array];
    [a addObject:@"123"];
    [a addObject:@"Alpahbet"];
    [a addObject:@"Hi"];
    [a addObject:@"Quit"];
    [a addObject:@"Thank you"];
    [a addObject:@"World-wide Web"];
    [a addObject:@"Think Different!"];

    i = [a indexOfObjectPassingTest:block];
    if (i != NSNotFound)
        printf("Found at %d, %s\n", (int)i, [[a objectAtIndex:i] UTF8String]);
    [a enumerateObjectsUsingBlock:print];
    [pool release];
    return 0;
}
