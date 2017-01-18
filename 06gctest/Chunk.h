/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#import <Foundation/NSObject.h>

#define MASS    100000

@interface Chunk : NSObject
{
    int group;
    id  target;
    char mass[MASS];
}
+ (void)setGroup:(int)n;
- (id)initWithLabel:(const char *)lab;
- (void)setTarget:(id)obj;
- (void)finalize;
@end
