/*** Copyright: OGIHARA Takeshi, Nov. 2010 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

@interface Goods : NSObject {
    int price;
    NSString *item;
}
@property int price;
@property(retain) NSString *item;
- (void)test:(void (^)(void))block;
- (NSString *)description;
- (void)blockNothing;
- (void)blockPrice;
- (void)blockPriceCopy;
- (void)blockItem;
- (void)blockItemString;
- (void)blockSelf;
@end

@implementation Goods
@synthesize price, item;

- (void)test:(void (^)(void))block {
    void (^cp)(void);
    block();
    printf("[self, item] = ");
    printf("[%d, %d], ", (int)[self retainCount], (int)[item retainCount]);
    cp = [block copy];
    printf("[%d, %d], ", (int)[self retainCount], (int)[item retainCount]);
    [cp release];
    printf("[%d, %d]\n", (int)[self retainCount], (int)[item retainCount]);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%d)", item, price];
};

- (void)blockNothing {
    [self test: ^{ printf("Nothing\n"); } ];
}

void (^bb)(void);

- (void)blockPrice {
    [self test: ^{ printf("Price=%d\n", ++price); } ];
}
- (void)blockPriceCopy {
    void (^bb)(void) = [^{ printf("CopyPrice=%d\n", ++price); } copy];
    [self test: bb];
    [bb release];
}
- (void)blockItem {
    [self test: ^{ printf("Item=%s\n", [item UTF8String]); }];
}
- (void)blockItemString {
    id str = item;
    [self test: ^{ printf("String=%s\n", [str UTF8String]); }];
}
- (void)blockSelf {
    [self test:
        ^{ printf("Self=\"%s\"\n", [[self description] UTF8String]); }];
}
@end

int main(void)
{
    id pool = [[NSAutoreleasePool alloc] init];
    Goods *g = [[Goods alloc] init];
    NSString *s = [[NSString alloc] initWithUTF8String:"iPad"];
    g.price = 499;
    g.item = s;
    [s release];
    [g blockNothing];
    [g blockPrice];
    [g blockPriceCopy];
    [g blockItem];
    [g blockItemString];
    [g blockSelf];
    [pool release];
    return 0;
}
