/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "BitPattern.h"
#import <Foundation/Foundation.h>
#import <stdio.h>

int main(int argc, char *argv[])
{
    NSString *bits, *tmp;
    @autoreleasepool {
        bits = [[BitPattern alloc] initWithChar:argv[1][0]];
        printf("Bit Pattern = %s\n", [bits UTF8String]);
        tmp = [@"Bit Pattern = " stringByAppendingString: bits];
        printf("%s\n", [tmp UTF8String]);
    }
    return 0;
}
