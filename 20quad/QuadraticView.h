/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <AppKit/NSView.h>
#import <AppKit/NSKeyValueBinding.h>
#define XY_MAX      12
#define COEFFS      3

@class NSImage;

@interface QuadraticView : NSView
{
    NSMutableDictionary *coefficients;
    NSImage *cache;
    NSMutableArray *gridArray;
}
- (id)initWithFrame:(NSRect)rect;
- (void)dealloc;
@property(copy) NSMutableDictionary *coefficients;
- (void)drawRect:(NSRect)aRect;
- (void)moveGraph:(NSPoint)d;
- (void)mouseDown:(NSEvent *)event;

/* Key-Value Binding */
- (void)bind:(NSString *)binding toObject:(id)obsvObj
    withKeyPath:(NSString *)keyPath options:(NSDictionary *)options;
- (void)observeValueForKeyPath:(NSString *)keyPath
	ofObject:(id)object change:(NSDictionary *)change
	context:(void *)context;
@end
