//
//  RegistratoinViewController.m
//  IoT App For iOS
//
//  Created by Rajesh on 24/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "RegistratoinViewController.h"

@interface RegistratoinViewController ()

@end

@implementation RegistratoinViewController

@synthesize nameTextField, emailTextField, passwordTextField, recEmailTextField, mobileTextField, submitButton, backButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    nameTextField.layer.cornerRadius = 1.5f;
    emailTextField.layer.cornerRadius = 1.5f;
    passwordTextField.layer.cornerRadius = 1.5f;
    recEmailTextField.layer.cornerRadius = 1.5f;
    mobileTextField.layer.cornerRadius = 1.5f;
    submitButton.layer.cornerRadius = 2.5f;
    backButton.layer.cornerRadius = 2.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onBackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onSubmitClick:(id)sender {
    if([[nameTextField text]isEqualToString:@""] || [[emailTextField text] isEqualToString:@""] || [[passwordTextField text] isEqualToString:@""] || [[recEmailTextField text] isEqualToString:@""] || [[mobileTextField text] isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill all fields!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"", nil];
        [alertView show];
    } else {
        [self registerUser];
    }
}
-(void)registerUser {
    NSURL *registrationUrl = [NSURL URLWithString:@"http://192.168.43.94:8540/IoT_App_User_WebService/Registration"];
    NSString *post = [NSString stringWithFormat:@"name=%@&email=%@&password=%@&recoveryEmail=%@&mobile=%@", [nameTextField text], [emailTextField text], [passwordTextField text], [recEmailTextField text], [mobileTextField text]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *dataLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:registrationUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(urlConnection) {
        NSLog(@"Connected to registration server");
    } else {
        NSLog(@"Disconnected from registration server");
    }
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSError *error;
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"Result %@", [dictionary objectForKey:@"result"]);
    if([[dictionary objectForKey:@"result"] isEqualToString:@"sucess"]) {
        NSLog(@"Registered Sucessfully!");
        [self.navigationController popViewControllerAnimated:YES];
    } else  if([[dictionary objectForKey:@"result"] isEqualToString:@"email error"]){
        NSLog(@"Email Error!");
    } else  if([[dictionary objectForKey:@"result"] isEqualToString:@"error"]){
        NSLog(@"Unknown Error Occured!");
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error in connection!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"", nil];
    [alertView show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
}



@end
