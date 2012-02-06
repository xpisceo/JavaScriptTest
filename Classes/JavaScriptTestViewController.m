//
//  JavaScriptTestViewController.m
//  JavaScriptTest
//
//  Created by Tang Xiaoping on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JavaScriptTestViewController.h"
#import "KeychainItemWrapper.h"

@implementation JavaScriptTestViewController

@synthesize webView;
@synthesize safeData;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	webView.delegate = self;
	
	NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html" inDirectory:@"www"];
	NSURL *htmlUrl = [NSURL fileURLWithPath:htmlPath];
	[webView loadRequest:[NSURLRequest requestWithURL:htmlUrl]];
	
//	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
//	NSString *jsString = [[NSString alloc] initWithContentsOfFile:filePath];
//	[webView stringByEvaluatingJavaScriptFromString:jsString];

	
	KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Password" accessGroup:nil];
	self.safeData = wrapper;
    [wrapper release];
	
	NSString *name = [self.safeData objectForKey:(id)kSecValueData];
//	NSString *mobile = [self.safeData objectForKey:@"mobile"];
	NSLog(@"name=%@", name);
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)helloJS:(id)sender;
{
	[webView stringByEvaluatingJavaScriptFromString:@"showAlert();"];
	
}

#pragma mark --
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	
	NSString *requestString = [[request URL] absoluteString];
	NSArray *components = [requestString componentsSeparatedByString:@":"];
	if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
		if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"]) 
		{
			UIAlertView *alert = [[UIAlertView alloc] 
								  initWithTitle:@"Alert from Cocoa Touch" message:[components objectAtIndex:2]
								  delegate:self cancelButtonTitle:nil
								  otherButtonTitles:@"OK", nil];
			[alert show];
		}
		return NO;
	}
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	NSLog(@"finish load");
}

@end
