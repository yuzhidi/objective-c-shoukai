/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

#define  PATH   @"./cluster2.m"

static void printClass(id obj)
{
    printf("Class=%s,\tMember=%s,\tKind=%s\n",
        [NSStringFromClass([obj class]) UTF8String],
        [obj isMemberOfClass:[NSFileHandle class]] ? "YES" : "NO",
        [obj isKindOfClass:[NSFileHandle class]] ? "YES" : "NO"
    );
}

int main(void)
{
    @autoreleasepool {
        printClass( [NSFileHandle fileHandleForReadingAtPath:PATH] );
        printClass( [NSFileHandle fileHandleWithStandardError] );
        printClass( [NSFileHandle fileHandleWithNullDevice] );
    }
    return 0;
}
