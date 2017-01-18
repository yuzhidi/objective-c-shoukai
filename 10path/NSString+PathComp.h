/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import <Foundation/NSString.h>

@interface NSString (PathComp)

- (NSString *)stringByAppendingPathComponents:(NSString *)aString, ...
        NS_REQUIRES_NIL_TERMINATION;

@end
