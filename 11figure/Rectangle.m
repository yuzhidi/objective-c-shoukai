/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#import "Rectangle.h"
#import <Foundation/NSString.h>

@implementation Rectangle

- (void)setSize:(NSSize)newsize {
    size = newsize;
}

- (double)area {
    return size.width * size.height;
}

- (NSString *)figureName {
    return (size.width == size.height) ? @"Square" : @"Rectangle";
}

- (NSString *)stringOfSize {
    return [NSString stringWithFormat:
        @"size=%.2f x %.2f", size.width, size.height];
}

@end

