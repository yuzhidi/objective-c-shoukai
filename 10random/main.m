/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#import "NSArray+Random.h"

int main(void)
{
    @autoreleasepool {
        id arr1 = [NSArray arrayWithObjects:
            @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", nil];
        id arr2 = [NSMutableArray arrayWithObjects:
            @"01", @"02", @"03", @"04", nil];
        for (int i = 5; i < 20; i++) {
            @autoreleasepool {
                printf("%s %s\n", [[arr1 anyOne] UTF8String],
                                  [[arr2 anyOne] UTF8String]);
                [arr2 addObject:[NSString stringWithFormat:@"%02d", i]];
            }
        }
    }
    return 0;
}
