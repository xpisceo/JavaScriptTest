//
//  JavaScriptTestViewController.h
//  JavaScriptTest
//
//  Created by Tang Xiaoping on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeychainItemWrapper;

@interface JavaScriptTestViewController : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
	KeychainItemWrapper *safeData;
}
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) KeychainItemWrapper *safeData;

- (IBAction)helloJS:(id)sender;
@end

