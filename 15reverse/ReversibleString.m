/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/NSString.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSInvocation.h>
#import <stdio.h>
#import <stdlib.h>

@interface ReversibleString: NSObject
{
    NSString *content;
}
- (id)initWithString:(NSString *)string;
- (id)reversedString;
@end


@implementation ReversibleString

- (id)initWithString:(NSString *)string
{
    if ((self = [super init]) != nil)
        content = string;
    return self;
}

- (id)reversedString
{
    unichar *buffer;
    int length, i, j, tmp;
    id reversed;

    if ((length = [content length]) <= 0)
        return @"";
    buffer = malloc(sizeof(unichar) * length);
    [content getCharacters:buffer range:NSMakeRange(0, length)];
    for (i = 0, j= length-1; i < j; i++, j--)
        tmp = buffer[i], buffer[i] = buffer[j], buffer[j] = tmp;
    reversed = [NSString stringWithCharacters:buffer length:length];
    free(buffer);
    return reversed;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL sel = [anInvocation selector];
    if ([content respondsToSelector:sel])
        [anInvocation invokeWithTarget:content];
    else
        [super forwardInvocation:anInvocation];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector])
        return YES;
    if ([self methodForSelector:aSelector] != (IMP)NULL)
        return YES;
    if ([content respondsToSelector:aSelector])
        return YES;
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector])
        return [super methodSignatureForSelector:aSelector];
    return [content methodSignatureForSelector:aSelector];
}
@end


int main(void)
{
    char buf[100];
    id s, a, b, c, d, e;
    @autoreleasepool {
        scanf("%s", buf);
        s = [NSString stringWithUTF8String:buf];
        a = [[ReversibleString alloc] initWithString:s];
        b = [[ReversibleString alloc] initWithString:@"Reverse?"];
        printf("%s\n", [a UTF8String]);
        c = [[a reversedString] stringByAppendingString: b];
        printf("%s\n", [c UTF8String]);
        d = [[ReversibleString alloc] initWithString:c];
        e = [b stringByAppendingString: [d reversedString]];
        printf("%s\n", [e UTF8String]);
    }
    return 0;
}
