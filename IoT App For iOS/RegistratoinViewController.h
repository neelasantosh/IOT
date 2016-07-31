//
//  RegistratoinViewController.h
//  IoT App For iOS
//
//  Created by Rajesh on 24/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistratoinViewController : UIViewController<NSURLConnectionDataDelegate>
- (IBAction)onBackClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *recEmailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)onSubmitClick:(id)sender;

-(void)registerUser;

@end
