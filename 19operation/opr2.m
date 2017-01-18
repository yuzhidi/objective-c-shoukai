/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <stdlib.h>
#import <unistd.h>

NSMutableArray *MyList;

int main(void)
{
    const int Tasks = 10;
    int i;
    @autoreleasepool {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        srandom((unsigned)getpid());  // seed of a random sequence
        MyList = [[NSMutableArray alloc] init];

        for (i = 0; i < Tasks; i++) {
            NSBlockOperation *opr;
            NSTimeInterval interval = (double)(random() & 0x7f) / 256.0;
            opr = [NSBlockOperation blockOperationWithBlock: ^{
                NSNumber *obj = [NSNumber numberWithInt:i];
                [NSThread sleepForTimeInterval: interval];
                @synchronized(MyList) {
                    [MyList addObject:obj];
                }
            }];
            [queue addOperation:opr];
        }
        [queue waitUntilAllOperationsAreFinished];
        for (id obj in MyList)
            printf(" %d", [obj intValue]);
        printf("\n");
    }
    return 0;
}
