//
//  MqttConnectionManager.m
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "MqttConnectionManager.h"
#import "MqttOCClient.h"
#import "MqttCallbackHandler.h"

@implementation MqttConnectionManager

-(id)init {
    
    if(self == [super init]) {
        self.client = [[MqttClient alloc]init];
        self.client.callbacks = [[MqttCallbackHandler alloc] init];
    }
    
    return self;
}
+ (id)getInstance
{
    static MqttConnectionManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}
-(BOOL)isConnected {
    if(self.client != nil && self.client.isConnected) return true;
    return false;
}
-(void)getConnectionWithBrokerID:(NSString *)brokerId ClientID:(NSString *)clientId {
    if(self.client != nil) {
        self.client = [self.client initWithHost:brokerId port:1883 clientId:clientId];
        [self.client connectWithOptions:nil invocationContext:@"connect" onCompletion:[[InvocationCallback alloc]init]];
    }
}
-(void)publish:(NSString *)topic :(NSString *)message :(int)qos :(BOOL)retained {
    if(self.client != nil && self.isConnected) {
        char *utfMessage = (char *)[message UTF8String];
        
        MqttMessage *msg = [[MqttMessage alloc] initWithMqttMessage:topic payload:utfMessage length:(int)message.length qos:qos retained:retained duplicate:NO];
        [self.client send:msg invocationContext:@"publish" onCompletion:[[InvocationCallback alloc] init]];
    }
}

@end
