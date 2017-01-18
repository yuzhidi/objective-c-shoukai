/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>

@class NSString;

@interface Figure : NSObject
@property(assign) NSPoint location;
- (void)setSize:(NSSize)newsize;
- (double)area;
- (NSString *)figureName;
- (NSString *)stringOfSize;
- (NSString *)description;
@end
