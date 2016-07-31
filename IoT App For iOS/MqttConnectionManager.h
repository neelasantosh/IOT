//
//  MqttConnectionManager.h
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MqttOCClient.h"

@interface MqttConnectionManager : NSObject

@property (strong, nonatomic) MqttClient *client;
@property (strong, nonatomic) id<MqttTraceHandler> callback;

+(id)getInstance;

-(void)getConnectionWithBrokerID:(NSString*) brokerId ClientID:(NSString*)clientId;
-(BOOL)isConnected;

-(void)publish:(NSString*)topic :(NSString*)message :(int)qos :(BOOL)retained;
-(void)subscribe:(NSString*)topic;

-(void)disconnect;

@end
