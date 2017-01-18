/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

int main(void)
{
    @autoreleasepool {
        id dic = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
        id date = [NSDate date];
        id str = [NSString stringWithFormat:@"Date=%@", date];
        printf("%s\n", [str UTF8String]);
        str = [NSString localizedStringWithFormat:@"Date=%@", date];
        printf("%s\n", [str UTF8String]);
        str = [[NSString alloc] initWithFormat:@"Date=%@" locale:dic, date];
        printf("%s\n", [str UTF8String]);
//      printf("%s\n", [[dic description] UTF8String]);
    }
    return 0;
}
