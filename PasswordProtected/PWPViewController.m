//
//  PWPViewController.m
//  PasswordProtected
//
//  Created by Björn Kaiser on 12.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PWPViewController.h"

@implementation PWPViewController

@synthesize keychain, passwordIsSet;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"MyPasswordStorage" accessGroup:nil];
    [self askForPassword];
}

- (void) askForPassword {
    
    if ([[keychain objectForKey:(id)kSecValueData] length] > 0) {
        // Ask for password
        passwordIsSet = YES;
        NSLog(@"Protected");
        UIAlertView *password = [[UIAlertView alloc] initWithTitle:@"Enter password" message:@"Please enter your password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        password.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [password show];
        [password release];
    } else if([[keychain objectForKey:(id)kSecValueData] length] == 0) {
        passwordIsSet = NO;
        // Let the user set a new password
        NSLog(@"No password set");
        UIAlertView *password = [[UIAlertView alloc] initWithTitle:@"Set password" message:@"Please enter your desired password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        password.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [password show];
        [password release];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *passwd = [[alertView textFieldAtIndex:0] text];
    if (![passwd isEqualToString:@""]) {
        if (passwordIsSet) {
            // Passwords do not match :(
            if (![passwd isEqualToString:[keychain objectForKey:(id)kSecValueData]]) {
                [self askForPassword];
            } else {
                NSLog(@"Login successfull :)");
            }
        } else {
            // Save new password
            [keychain setObject:passwd forKey:(id)kSecValueData];
        }
    } else {
        [self askForPassword];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
