/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/NSObject.h>

@protocol NSLocking;

@interface Philosopher : NSObject
{
    __weak id <NSLocking> leftLock;
    __weak id <NSLocking> rightLock;
}
@property int tag;
@property(readonly) const char *state;
+ (void)initialize;
- (id)initWithLeft:(id <NSLocking>)llock right:(id <NSLocking>)rlock;
- (void)start:(id)sender;

@end
