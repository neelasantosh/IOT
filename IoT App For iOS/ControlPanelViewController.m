//
//  ControlPanelViewController.m
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "ControlPanelViewController.h"

@interface ControlPanelViewController ()

@end

@implementation ControlPanelViewController
@synthesize connectionManager, brightnessSlider, temperatureSlider;
@synthesize bulbImageView, bulbOffButton, bulbOnButton, doorCloseButton, doorImageView, doorOpenButton;
@synthesize garrageImageView, backButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    connectionManager =[MqttConnectionManager getInstance];
    backButton.layer.cornerRadius = 2.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)bulbOnButtonClick:(id)sender {
    NSLog(@"Lamp is on!");
    [connectionManager publish:@"/kitchen/lamp" :@"1" :2 :false];
    [bulbOnButton setEnabled:false];
    [bulbOffButton setEnabled:true];
}

- (IBAction)bulbOfClick:(id)sender {
    NSLog(@"Lamp is off!");
    [connectionManager publish:@"/kitchen/lamp" :@"0" :2 :false];
    [bulbOnButton setEnabled:true];
    [bulbOffButton setEnabled:false];
}

- (IBAction)temperatureChangeSlider:(UISlider*)sender {
    NSString *temperature = [NSString stringWithFormat:@"%f", temperatureSlider.value];
    NSLog(@"Brightness: %d", (int)sender.value);
    [connectionManager publish:@"/balkon/temperature" :[NSString stringWithFormat:@"%d", (int)sender.value ] :2 :false];
}

- (IBAction)lampBrightnessSlider:(UISlider*)sender {
    NSString *brightness = [NSString stringWithFormat:@"%f", brightnessSlider.value];
    NSLog(@"Brightness: %d", (int)sender.value);
    [connectionManager publish:@"/roomlight1/dimmer" :[NSString stringWithFormat:@"%d", (int)sender.value ] :2 :false];
}

- (IBAction)doorOpenButtonClick:(id)sender {
    [connectionManager publish:@"/beta/door" :@"1" :2 :false];
    [doorOpenButton setEnabled:false];
    [doorCloseButton setEnabled:true];
}
- (IBAction)doorCloseButtonClick:(id)sender {
    [connectionManager publish:@"/beta/door" :@"0" :2 :false];
    [doorOpenButton setEnabled:true];
    [doorCloseButton setEnabled:false];
}

- (IBAction)garrageDoorOpenClick:(id)sender {
    [connectionManager publish:@"/car/garage" :@"1" :2 :false];
}

- (IBAction)garrageDoorCloseClick:(id)sender {
    [connectionManager publish:@"/car/garage" :@"0" :2 :false];
}

- (IBAction)onBackClick:(id)sender {
        NSLog(@"Back button clicked");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onWaterValveSliderChange:(UISlider *)sender {
    [connectionManager publish:@"/valve/water" :[NSString stringWithFormat:@"%d", (int)sender.value ] :2 :false];
}
@end
