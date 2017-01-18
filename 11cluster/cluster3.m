/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

static void printClass(id obj)
{
    printf("Class=%s,\tMember=%s,\tKind=%s\n",
        [NSStringFromClass([obj class]) UTF8String],
        [obj isMemberOfClass:[NSArray class]] ? "YES" : "NO",
        [obj isKindOfClass:[NSArray class]] ? "YES" : "NO"
    );
}

int main(void)
{
    @autoreleasepool {
        printClass( [[NSArray alloc] init] );
        printClass( [[NSArray alloc] initWithObjects:@"A", nil] );
        printClass( [[NSMutableArray alloc] initWithObjects:@"A", nil] );
    }
    return 0;
}
