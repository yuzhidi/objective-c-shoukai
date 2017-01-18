/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#define SERVER  @"ShowImage"

@class NSString, NSURL;

@protocol ShowImage
- (NSString *)showImage:(NSURL *)aFile;
@end
