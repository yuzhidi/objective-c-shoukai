/*** Copyright: OGIHARA Takeshi, Aug. 2011 ***/

#import <Foundation/NSObject.h>
#import <stdio.h>

int main()
{
    id obj = [[NSObject alloc] init];
    printf("init: %d\n", (int)[obj retainCount]);
    [obj retain];
    printf("retain: %d\n", (int)[obj retainCount]);
    [obj retain];
    printf("retain: %d\n", (int)[obj retainCount]);

    [obj release];
    printf("release: %d\n", (int)[obj retainCount]);
    [obj release];
    printf("release: %d\n", (int)[obj retainCount]);
    [obj release];

    return 0;
}
