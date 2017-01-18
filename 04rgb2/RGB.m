/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "RGB.h"
#import <stdio.h>

static unsigned char roundUChar(int v)
{
    if (v < 0) return 0;
    if (v > 255) return 255;
    return (unsigned char)v;
}

@implementation RGB
{
@protected
    unsigned char  red, green, blue;
}

- (id)initWithRed:(int)r green:(int)g blue:(int)b
{
    if ((self = [super init]) != nil) {
        red = roundUChar(r);
        green = roundUChar(g);
        blue = roundUChar(b);
    }
    return self;
}

- (id)blendColor:(RGB *)color
{
    red = ((unsigned int)red + color->red) / 2;
    green = ((unsigned int)green + color->green) / 2;
    blue = ((unsigned int)blue + color->blue) / 2;
    return self;
}

- (void)print {
    printf("(%d, %d, %d)\n", red, green, blue);
}

@end


@implementation RGBColor

- (int)brightness
{
    double r = (double)red;
    double g = (double)green;
    double b = (double)blue;
    int brite = (int)(r * 0.30 + g * 0.57 + b * 0.11);
    return brite;
}

@end
