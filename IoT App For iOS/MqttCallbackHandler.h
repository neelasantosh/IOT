//
//  MqttCallbackHandler.h
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MqttOCClient.h"

@interface MqttCallbackHandler : NSObject<MqttCallbacks>


- (void)onConnectionLost:(NSObject *)context
            message:(NSString *)message;
- (void)onMessageArrived:(NSObject *)context
                 message:(MqttMessage *)message;
- (void)onMessageDelivered:(NSObject *)context
                 messageId:(int)messageId;

@end

@interface InvocationCallback : NSObject<InvocationComplete>

- (void)onSuccess:(NSObject *)invocationContext;
- (void)onFailure:(NSObject *)invocationContext
        errorCode:(int)errorCode
     errorMessage:(NSString *)errorMessage;

@end
