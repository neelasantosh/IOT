//
//  ControlPanelViewController.h
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MqttConnectionManager.h"

@interface ControlPanelViewController : UIViewController

- (IBAction)bulbOnButtonClick:(id)sender;
- (IBAction)bulbOfClick:(id)sender;
- (IBAction)temperatureChangeSlider:(UISlider*)sender;
- (IBAction)lampBrightnessSlider:(UISlider*)sender;
- (IBAction)doorOpenButtonClick:(id)sender;
- (IBAction)doorCloseButtonClick:(id)sender;
- (IBAction)garrageDoorOpenClick:(id)sender;
- (IBAction)garrageDoorCloseClick:(id)sender;
- (IBAction)onBackClick:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *bulbImageView;
@property (strong, nonatomic) IBOutlet UIImageView *dimmerLigntImageView;
@property (strong, nonatomic) IBOutlet UIImageView *doorImageView;
@property (strong, nonatomic) IBOutlet UIImageView *garrageImageView;
@property (strong, nonatomic) IBOutlet UIImageView *waterValveImageView;

@property (strong, nonatomic) MqttConnectionManager *connectionManager;
@property (strong, nonatomic) IBOutlet UIButton *bulbOnButton;
@property (strong, nonatomic) IBOutlet UIButton *bulbOffButton;
@property (strong, nonatomic) IBOutlet UIButton *doorOpenButton;
@property (strong, nonatomic) IBOutlet UIButton *doorCloseButton;
@property (strong, nonatomic) IBOutlet UISlider *temperatureSlider;
@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)onWaterValveSliderChange:(UISlider *)sender;

@end
