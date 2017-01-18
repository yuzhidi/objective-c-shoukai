/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

@interface NSString (Bracket)
- (NSString *)putInBrackets;
@end

@implementation NSString (Bracket)
- (NSString *)putInBrackets {
    NSAssert([self length] > 0, @"Null string is not allowed");
    return [NSString stringWithFormat:@"<%@>", self];
}
@end

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSString *s;
        NSCParameterAssert(argc != 1);
        s = [NSString stringWithUTF8String:argv[1]];
        printf("%s\n", [[s putInBrackets] UTF8String]);
    }
    return 0;
}
