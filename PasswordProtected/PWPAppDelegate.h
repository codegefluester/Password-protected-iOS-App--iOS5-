//
//  PWPAppDelegate.h
//  PasswordProtected
//
//  Created by Björn Kaiser on 12.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PWPViewController;

@interface PWPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PWPViewController *viewController;

@end
