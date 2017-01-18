/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSString.h>
#import "Figure.h"
#import "Circle.h"
#import "Rectangle.h"
#import <stdio.h>

BOOL testloop(void)
{
    Figure *fig = nil;
    double x, y, w, h;
    char buf[64], com;

    do {
        printf("Shape (C=Circle, R=Rectangle. Q=Quit) ? ");
        if (scanf("%s", buf) == 0 || (com = buf[0]) == 'Q' || com == 'q')
            return NO;
        switch (com) {
        case 'C': case 'c': /* Circle */
            fig = [[Circle alloc] init];
            break;
        case 'R': case 'r': /* Rectangle */
            fig = [[Rectangle alloc] init];
            break;
        }
    }while (fig == nil);

    printf("Location ? ");
    scanf("%lf %lf", &x, &y);
    fig.location = NSMakePoint(x, y);
    printf("Size ? ");
    scanf("%lf %lf", &w, &h);
    [fig setSize: NSMakeSize(w, h)];
    printf("%s\n", [[fig description] UTF8String]);
    return YES;
}

int main(void)
{
    BOOL flag;
    do {
        @autoreleasepool {
            flag = testloop();
        }
    }while (flag);
    return 0;
}
