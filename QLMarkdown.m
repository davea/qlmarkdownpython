#import "QLMarkdown.h"

NSString* LoadBundleAndConvertText(NSString *text) {
	NSBundle *ownBundle = [NSBundle bundleWithIdentifier:@"org.minuszero.qlgenerator.QLMarkdownPython"];
	NSLog(@"%@", ownBundle);
	NSString *pyBundlePath = [ownBundle pathForResource:@"QLMarkdown" ofType:@"plugin"];
	NSLog(@"%@", pyBundlePath);
	NSBundle *pyBundle = [NSBundle bundleWithPath:pyBundlePath];
	NSLog(@"%@", pyBundle);
	[pyBundle load];
	NSLog(@"loaded pyBundle");
	Class QLMarkdown = [pyBundle principalClass];
	id markdown = [[QLMarkdown alloc] init];
	
	NSString *htmlString = [markdown convertText:text];
	[markdown release];
	return htmlString;
}

NSString* ConvertURLToText(NSURL *url) {
	NSString *text = [NSString stringWithContentsOfURL:url];
	return LoadBundleAndConvertText(text);
}