//
//  UserHomeViewController.m
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "UserHomeViewController.h"
#import "MqttConnectionManager.h"

@interface UserHomeViewController ()

@end

@implementation UserHomeViewController

@synthesize ipAddressTextField, portNumberTextField, clientIdTextField, connectButton, viewConnectedDeviceButton, controlPanelButton, logoutButton;
@synthesize connectionManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    ipAddressTextField.layer.cornerRadius = 1.5f;
    portNumberTextField.layer.cornerRadius = 1.5f;
    clientIdTextField.layer.cornerRadius = 1.5f;
    controlPanelButton.layer.cornerRadius = 2.5f;
    connectButton.layer.cornerRadius = 2.5f;
    viewConnectedDeviceButton.layer.cornerRadius = 2.5f;
    logoutButton.layer.cornerRadius = 2.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onSwitchListener:(id)sender {
    
}

- (IBAction)onConnectButtonClick:(id)sender {
    NSString *brokerId = [NSString stringWithFormat:@"%@:%@", ipAddressTextField.text, portNumberTextField.text];
    NSString *clientId = clientIdTextField.text;
    connectionManager = [MqttConnectionManager getInstance];
    [connectionManager getConnectionWithBrokerID:ipAddressTextField.text ClientID:clientId];
}

- (IBAction)onViewConnectedDevicesButtonClick:(id)sender {
}

- (IBAction)onControlPanelButtonClick:(id)sender {
}

- (IBAction)onLogoutButtonClick:(id)sender {
    NSLog(@"Logout button clicked");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
