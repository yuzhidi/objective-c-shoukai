/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

#define  Manufacturer  @"Phantom Cookie, Inc."
#define  Year          @"2011"
NSString *note = @"Copyright " Year @" " Manufacturer;

NSString *euro = @"Euro=\u20ac";
NSString *clef = @"G-clef=\U0001d11e";

int main(void)
{
    @autoreleasepool {
        NSString *myname = @"T. Ogihara";
        NSString *work = [@"Name: " stringByAppendingString: myname];

        printf("%s\n", [work UTF8String]);
        printf("%s\n", [note UTF8String]);
        printf("%s\n", [euro UTF8String]);
        printf("%s\n", [clef UTF8String]);
    }

    return 0;
}
