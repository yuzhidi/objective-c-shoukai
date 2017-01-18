/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/NSObject.h>

@interface Philosopher : NSObject
{
    __weak id leftLock;
    __weak id rightLock;
}
@property int tag;
@property(readonly) const char *state;
+ (void)initialize;
- (id)initWithLeft:(id)llock right:(id)rlock;
- (void)start:(id)sender;

@end
