//
//  JavaScriptTestAppDelegate.h
//  JavaScriptTest
//
//  Created by Tang Xiaoping on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JavaScriptTestViewController;

@interface JavaScriptTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JavaScriptTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JavaScriptTestViewController *viewController;

@end

