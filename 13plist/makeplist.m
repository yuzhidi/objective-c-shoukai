/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import <stdio.h>

#define OUTPUT   @"output.plist"

NSString *stringOfFormat(NSPropertyListFormat n) {
    if (n == NSPropertyListOpenStepFormat) return @"Ascii";
    if (n == NSPropertyListXMLFormat_v1_0) return @"XML";
    if (n == NSPropertyListBinaryFormat_v1_0) return @"Binary";
    return [NSString stringWithFormat:@"(%d)", (int)n];
}

int main(int argc, char *argv[])
{
    NSPropertyListFormat fmt;
    int outfmt = -1;

    if (argc < 2) {
        printf("Usage: %s file.plist [option]\n", argv[0]);
        printf("Option: A     write in Ascii\n");
        printf("        B     write in Binary\n");
        printf("        X     write in XML\n");
        return 1;
    }
    if (argc >= 3)
        outfmt = argv[2][0]; // character
    @autoreleasepool {
        id list;
        NSData *data;
        NSString *path = [NSString stringWithUTF8String: argv[1]];
        NSFileManager *fmanager = [NSFileManager defaultManager];
        if (![fmanager fileExistsAtPath:path]
            || (data = [NSData dataWithContentsOfFile:path]) == nil) {
            printf("Error: can't read %s\n", argv[1]);
            return 1;
        }
        list = [NSPropertyListSerialization
                    propertyListWithData:data 
	                         options:0 format:&fmt error:NULL];
        printf("In  = %s\n", [stringOfFormat(fmt) UTF8String]);
        if (outfmt < 0)
            return 0;

        if (outfmt == 'A' || outfmt == 'a') {
            [[list description] writeToFile:OUTPUT atomically:YES
                encoding:NSUTF8StringEncoding error:NULL];
            fmt = NSPropertyListOpenStepFormat;
        }else {
            fmt = (outfmt == 'B' || outfmt == 'b')
                ? NSPropertyListBinaryFormat_v1_0
                : NSPropertyListXMLFormat_v1_0;
            NSData *outdata = [NSPropertyListSerialization
                dataWithPropertyList:list
                format:fmt options:0 error:NULL];
            [outdata writeToFile:OUTPUT atomically:YES];
        }
        printf("Out = %s\n", [stringOfFormat(fmt) UTF8String]);
    }
    return 0;
}
