//
//  PWPViewController.h
//  PasswordProtected
//
//  Created by Björn Kaiser on 12.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import "KeychainItemWrapper.h"

@interface PWPViewController : UIViewController {
    KeychainItemWrapper *keychain;
    BOOL passwordIsSet;
}

@property (nonatomic, retain) KeychainItemWrapper *keychain;
@property (nonatomic) BOOL passwordIsSet;

- (void) askForPassword;

@end
