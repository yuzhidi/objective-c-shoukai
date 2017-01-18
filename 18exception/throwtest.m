/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdlib.h>

NSString *MyException = @"MyException";

static void subfunc(int v)
{
    switch (v) {
    case 0:
        break;  // Do Nothing
    case 1:
        @throw @"REIGAI";
    case 2:
        @throw [NSNumber numberWithInt: v];
    default:
        [NSException raise:MyException
                  format:@"Illegal operation with %d", v];
        break;
    }
}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        int val = (argc > 1) ? atoi(argv[1]) : 0;
 
        @try {
            subfunc(val);
            NSLog(@"function exit\n");
        }
        @catch (NSException *ex) {                     // (1)
            NSLog(@"Exception: %@, Reason: %@\n", [ex name], [ex reason]);
            @throw ex;
        }
        @catch (NSValue *ex) {                         // (2)
            NSLog(@"Value \"%@\" was caught\n", ex);
        }
        // @catch (NSNumber *ex) {                     // (3)
        //     NSLog(@"Number \"%@\" was caught\n", ex);
        // }
        @catch (id ex) {                               // (4)
            NSLog(@"Object \"%@\" was caught\n", ex);
            @throw;
        }
 
        NSLog(@"main exit\n");
    }
    return 0;
}
