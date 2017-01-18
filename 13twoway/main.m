/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import "TwoWayList.h"
#import <stdio.h>

static NSString *ArchivePath = @"save.dat";

int main(void)
{
    id list = nil;
    id fmanager;
    int n;

    @autoreleasepool {
        fmanager = [NSFileManager defaultManager];
        if ([fmanager fileExistsAtPath:ArchivePath])
            list = [NSKeyedUnarchiver unarchiveObjectWithFile:ArchivePath];
        else {
            scanf("%d", &n);
            list = [[TwoWayList alloc] initWithIntValue:n];
        }
        for ( ; ; ) {
            id p;
            for (p = list; p; p = [p next])
                printf(" %d", [p intValue]);
            putchar('\n');
            if (scanf("%d", &n) != 1)
                break;
            [list addNewValue: n];
        }
        [NSKeyedArchiver archiveRootObject:list toFile:ArchivePath];
    }
    return 0;
}
