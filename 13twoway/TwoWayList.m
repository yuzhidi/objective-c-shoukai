/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "TwoWayList.h"
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>
#import <Foundation/NSKeyedArchiver.h>
#import <stdio.h>

static NSString *BLValue = @"BLValue";
static NSString *BLPrev = @"BLPrev";
static NSString *BLNext = @"BLNext";

@implementation TwoWayList

- (id)copyWithZone:(NSZone *)zone
{
    TwoWayList *obj = [[[self class] alloc] initWithIntValue: value];
    if (obj) {
        obj->next = next;
        obj->prev = prev;
    }
    return obj;
}

- (id)initWithIntValue:(int)val
{
    if ((self = [super init]) != nil) {
        value = val;
        /* prev = next = nil; */
    }
    return self;
}

#ifdef DEBUG
- (void)dealloc {
    printf("dealloc: %d\n", value);
}
#endif

- (void)addNewValue:(int)val
{
    if (value > val) {
        TwoWayList *tmp = [self copy];
        tmp->prev = self;
        if (next)
            next->prev = tmp;
        value = val;
        next = tmp;
    }else if (next)
        [next addNewValue:val];
    else {
        next = [[[self class] alloc] initWithIntValue:val];
        next->prev = self;
    }
}

- (id)next {
    NSAssert((next == nil || next->prev == self), @"Wrong Pointers");
    return next;
}
- (int)intValue { return value; }

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:value forKey:BLValue];
    [aCoder encodeObject:next forKey:BLNext];
    [aCoder encodeConditionalObject:prev forKey:BLPrev];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]) != nil) {
        next = [aDecoder decodeObjectForKey:BLNext];
        prev = [aDecoder decodeObjectForKey:BLPrev];
        value = [aDecoder decodeIntForKey:BLValue];
    }
    return self;
}

@end
