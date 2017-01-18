/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <stdlib.h>
#import <unistd.h>

NSMutableArray *MyList;

@interface MyOperation : NSOperation
{
    int number;
    NSTimeInterval interval;  // wait for a moment
}
- (id)initWithNum:(int)sn;
- (void)main;
@end

@implementation MyOperation

- (id)initWithNum:(int)sn
{
    if ((self = [super init]) != nil) {
        number = sn;
        interval = (double)(random() & 0x7f) / 256.0;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Release: %d", number);
}

- (void)main {
    @try {
        @autoreleasepool {
            NSNumber *obj = [NSNumber numberWithInt:number];
            [NSThread sleepForTimeInterval: interval]; // Wait
            @synchronized(MyList) {
                [MyList addObject:obj];
            }
        }
    }
    @catch(...) { /* Do Nothing */ }
}

@end

int main(void)
{
    const int Tasks = 10;
    srandom((unsigned)getpid());  // seed of a random sequence

    @autoreleasepool {
        int i;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        MyList = [[NSMutableArray alloc] init];

        NSOperation *oprs[Tasks];
        NSMutableArray *mass = [[NSMutableArray alloc] init];
        for (i = 0; i < Tasks; i++) {
            oprs[i] = [[MyOperation alloc] initWithNum:i];
            [mass addObject:oprs[i]];
        }
        [oprs[0] addDependency:oprs[2]];
        [oprs[5] addDependency:oprs[2]];
        [oprs[4] addDependency:oprs[0]];
        [oprs[4] addDependency:oprs[5]];
        [oprs[3] addDependency:oprs[6]];
        [queue addOperations:mass waitUntilFinished:NO];
        [NSThread sleepForTimeInterval: 3.0];
        for (id obj in MyList)
            printf(" %d", [obj intValue]);
        printf("\n");
    }
    return 0;
}
