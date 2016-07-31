//
//  ViewController.h
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<NSURLConnectionDataDelegate>

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;
- (IBAction)onSignInClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *registerMeButton;
- (IBAction)onRegisterMeClick:(id)sender;

-(BOOL)checkUserWithEmail:(NSString*)email Password:(NSString*)password;
-(void)readJsonWithString:(NSString*)data;

@end

