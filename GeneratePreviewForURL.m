#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>

#import "QLMarkdown.h"

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */


OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
	NSString *htmlString = ConvertURLToText((NSURL *)url);
	CFDataRef data = (CFDataRef) [htmlString dataUsingEncoding:NSUTF8StringEncoding];
	CFDictionaryRef props = (CFDictionaryRef) [NSDictionary dictionary];
	QLPreviewRequestSetDataRepresentation(preview, data, kUTTypeHTML, props);
    return noErr;
}

void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
