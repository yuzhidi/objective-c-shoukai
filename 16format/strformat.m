/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

void pr(NSDictionary *lang, int n)
{
    NSString *fmt = [lang objectForKey:@"format"];
    NSString *opr = [lang objectForKey:@"operation"];
    const char *ss = (n > 1) ? "s" : "";
    NSString *str = [NSString stringWithFormat:fmt, opr, n, ss];
    printf("%s\n", [str UTF8String]);
}

int main(void)
{
    @autoreleasepool {
        NSDictionary *dic;
        dic = [NSDictionary dictionaryWithContentsOfFile:@"fmt.plist"];
        pr([dic objectForKey:@"en"], 1);
        pr([dic objectForKey:@"ja"], 1);
        pr([dic objectForKey:@"en"], 3);
        pr([dic objectForKey:@"ja"], 3);
    }
    return 0;
}
