//
//  UserHomeViewController.h
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MqttConnectionManager.h"

@interface UserHomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *ipAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *portNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *clientIdTextField;
@property (strong, nonatomic) IBOutlet UISwitch *cleanSessionSwitch;
@property (strong, nonatomic) IBOutlet UIButton *connectButton;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;
@property (strong, nonatomic) IBOutlet UIButton *viewConnectedDeviceButton;
@property (strong, nonatomic) IBOutlet UIButton *controlPanelButton;
- (IBAction)onSwitchListener:(id)sender;
- (IBAction)onConnectButtonClick:(id)sender;
- (IBAction)onViewConnectedDevicesButtonClick:(id)sender;
- (IBAction)onControlPanelButtonClick:(id)sender;
- (IBAction)onLogoutButtonClick:(id)sender;

@property MqttConnectionManager *connectionManager;

@end
