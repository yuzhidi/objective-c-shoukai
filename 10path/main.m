/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSString.h>
#import <Foundation/NSPathUtilities.h>
#import "NSString+PathComp.h"
#import <stdio.h>

int main(void)
{
    NSString *pict = @"Pictures";
    NSString *homedir, *s;
    @autoreleasepool {
        homedir = NSHomeDirectory();
        s = [homedir stringByAppendingPathComponent: pict];
        printf("%s\n", [s UTF8String]);
        s = [homedir stringByAppendingPathComponents: pict, @"tmp", nil];
        printf("%s\n", [s UTF8String]);
        s = [homedir stringByAppendingPathComponents:
            @"Desktop", pict, @"Wallpaper", nil];
        printf("%s\n", [s UTF8String]);
    }
    return 0;
}
