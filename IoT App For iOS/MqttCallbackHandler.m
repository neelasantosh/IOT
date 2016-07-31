//
//  MqttCallbackHandler.m
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "MqttCallbackHandler.h"
#import <UIKit/UIKit.h>

@implementation MqttCallbackHandler

-(void)onConnectionLost:(NSObject *)invocationContext errorMessage:(NSString *)errorMessage {
    
}
-(void)onConnectionLost:(NSObject *)context message:(NSString *)message {
    
}
-(void)onMessageArrived:(NSObject *)context message:(MqttMessage *)message {
    NSLog(@"Message: %@", message);
}
-(void)onMessageDelivered:(NSObject *)context messageId:(int)messageId {
    //NSLog(@"Message Delivered");
}

@end

@implementation InvocationCallback

-(void)onSuccess:(NSObject *)invocationContext {
    if([invocationContext isKindOfClass:[NSString class]]) {
        NSString *status = (NSString*)invocationContext;
        if([status isEqualToString:@"connect"]) {
            NSLog(@"Connected Sucessfully");
        }
        if([status isEqualToString:@"disconnect"]) {
            NSLog(@"Disconnected Sucessfully!");
        }
    }
}
-(void)onFailure:(NSObject *)invocationContext errorCode:(int)errorCode errorMessage:(NSString *)errorMessage {
    if([invocationContext isKindOfClass:[NSString class]]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error in connection!" delegate:invocationContext cancelButtonTitle:@"Ok" otherButtonTitles:@"", nil];
        [alertView show];
        NSLog(@"Error while connecting!");
    }
}

@end
