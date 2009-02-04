#import <Foundation/Foundation.h>

@interface QLMarkdown: NSObject
{}
- (NSString *)convertText:(NSString *)text;
@end

NSString* LoadBundleAndConvertText(NSString *text);
NSString* ConvertURLToText(NSURL *url);