/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSObject.h>
#import <stdio.h>

@interface X : NSObject
- (int)value;
@end

@interface Y : NSObject
- (float)value;
@end

@interface Z : X
- (const char *)value;
@end

@implementation X
- (int)value { return 2005; }
@end

@implementation Y
- (float)value { return 3.14159; }
@end

@implementation Z
- (const char *)value { return "Say Hello"; }
@end

int main(void)
{
    X *x, *z;
    id y;
    float r;

    x = [[X alloc] init];
    y = [[Y alloc] init];
    z = [[Z alloc] init];
    r = [x value];
    printf("%f\n", r);
    r = [y value];
    printf("%f\n", r);
    r = [z value];
    printf("%f\n", r);
    return 0;
}
