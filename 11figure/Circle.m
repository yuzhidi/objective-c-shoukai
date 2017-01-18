/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Circle.h"
#import <Foundation/NSString.h>
#import <math.h>

#define PI  3.14159

@implementation Circle

- (void)setSize:(NSSize)newsize
{
    double x = newsize.width;
    double y = newsize.height;
    radius = sqrt(x * x + y * y);
}

- (double)area {
    return radius * radius * PI;
}

- (NSString *)figureName {
    return @"Circle";
}

- (NSString *)stringOfSize {
    return [NSString stringWithFormat: @"radius=%.2f", radius];
}

@end

