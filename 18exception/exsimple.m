/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        id array = [NSMutableArray array];        // empty array

        @try {
            if (argc == 1)
                array = [array objectAtIndex:1];  // NSRangeException
            else
                [array addObject:nil];            // NSInvalidArgumentException
            NSLog(@"success");
        }
        @catch (NSException *ex) {
            NSString *name = [ex name];
            NSLog(@"Name: %@", name);
            NSLog(@"Reason: %@", [ex reason]);
            if ([name isEqualToString:NSRangeException])
                NSLog(@"Exception was caught successfully.");
            else
                [ex raise];    // raise the exception again
        }

        NSLog(@"main exit");
    }
    return 0;
}
