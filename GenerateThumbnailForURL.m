#import <Cocoa/Cocoa.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#import <WebKit/WebKit.h>

#import "QLMarkdown.h"

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
	NSString *htmlString = ConvertURLToText((NSURL*)url);
	NSRect viewRect = NSMakeRect(0.0, 0.0, 800.0, 600.0);
	float scale = maxSize.height / 800.0;
	NSLog(@"scale: %f, %@", scale, NSStringFromSize(NSSizeFromCGSize(maxSize)));
    NSSize scaleSize = NSMakeSize(scale, scale);
    CGSize thumbSize = NSSizeToCGSize(NSMakeSize((maxSize.width * (600.0/800.0)), 
												 maxSize.height));
	
	WebView* webView = [[WebView alloc] initWithFrame: viewRect];
    [webView scaleUnitSquareToSize: scaleSize];
	[[[webView mainFrame] frameView] setAllowsScrolling:NO];
	[[webView mainFrame] loadHTMLString:htmlString baseURL:nil];
	
	while ([webView isLoading])
		CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, true);
	
	[webView display];
	
	CGContextRef context = 
	QLThumbnailRequestCreateContext(thumbnail, thumbSize, false, NULL);
	
    if (context) {
		NSGraphicsContext* nsContext = 
		[NSGraphicsContext
		 graphicsContextWithGraphicsPort: (void*) context 
		 flipped: [webView isFlipped]];
		
		[webView displayRectIgnoringOpacity: [webView bounds]
								  inContext: nsContext];
		
		QLThumbnailRequestFlushContext(thumbnail, context);
		
		CFRelease(context);
    }
    return noErr;
}

void CancelThumbnailGeneration(void* thisInterface, QLThumbnailRequestRef thumbnail)
{
    // implement only if supported
}
