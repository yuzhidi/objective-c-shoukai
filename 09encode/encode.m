/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

struct grid {
    int x, y;
    double weight;
};

int main(void)
{
    struct grid  foo, bar;

    @autoreleasepool {
        NSMutableArray *arr = [NSMutableArray array];
        foo.x = 12;
        foo.y = 9;
        foo.weight = 0.87;
        [arr addObject:[[NSValue alloc] initWithBytes:&foo
                            objCType:@encode(struct grid)]];
        foo.x += 3;
        foo.y -= 2;
        foo.weight = 1.2;
        [arr addObject:[[NSValue alloc] initWithBytes:&foo
                            objCType:@encode(struct grid)]];
        for (id obj in arr) {
            [obj getValue: &bar];
            printf("(%d, %d) %5.2lf\n", bar.x, bar.y, bar.weight);
        }
    }

    return 0;
}
