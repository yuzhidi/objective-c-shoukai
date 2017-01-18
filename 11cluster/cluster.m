/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

static void printClass(NSString *obj)
{
    printf("Class=%s,\tMember=%s,\tKind=%s\n",
        [NSStringFromClass([obj class]) UTF8String],
        [obj isMemberOfClass:[NSString class]] ? "YES" : "NO",
        [obj isKindOfClass:[NSString class]] ? "YES" : "NO"
    );
}

int main(void)
{
    NSString *ss = @"static string";
    @autoreleasepool {
        printClass( ss );
        printClass( [ss stringByAppendingString:@"(^-^)"] );
        printClass( [NSString stringWithUTF8String:"(-_-)"] );
        printClass( NSHomeDirectory() );
    }
    return 0;
}
