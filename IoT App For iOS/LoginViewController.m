//
//  ViewController.m
//  IoT App For iOS
//
//  Created by Rajesh on 21/01/16.
//  Copyright © 2016 CDAC. All rights reserved.
//

#import "LoginViewController.h"
#import "UserHomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize emailTextField, passwordTextField, signInButton, registerMeButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    emailTextField.layer.cornerRadius = 1.5f;
    passwordTextField.layer.cornerRadius = 1.5f;
    registerMeButton.layer.cornerRadius = 2.5f;
    signInButton.layer.cornerRadius = 2.5f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)checkUserWithEmail:(NSString *)email Password:(NSString *)password {
    NSURL *loginUrl = [NSURL URLWithString:@"http://192.168.43.94:8540/IoT_App_User_WebService/Login"];
    NSString *post = [NSString stringWithFormat:@"email=%@&password=%@", email, password];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *dataLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:loginUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(urlConnection) {
        NSLog(@"Connected to login server!");
    } else {
        NSLog(@"Disconnected from login server!");
    }
    return NO;
}

- (IBAction)onSignInClick:(id)sender {
    if([[emailTextField text] isEqualToString:@""] || [[passwordTextField text] isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill all fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"", nil];
        [alertView show];
    } else {
        [self checkUserWithEmail:emailTextField.text Password:passwordTextField.text];
    }
}
- (IBAction)onRegisterMeClick:(id)sender {
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //[self readJsonWithString:[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]];
    NSLog(@"retreiving data from login server!");
    NSError *error;
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"Result %@", [dictionary objectForKey:@"result"]);
    if([[dictionary objectForKey:@"result"] isEqualToString:@"sucess"]) {
        NSLog(@"Inside sucess....");
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //UIStoryboard *storyBoard = self.storyboard;
        UserHomeViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"userHome"];
        //UserHomeViewController *controller = [[UserHomeViewController alloc]init];
        //[self.navigationController pushViewController:viewController animated:YES];
        [self presentViewController:viewController animated:YES completion:nil];
    } else  {
        NSLog(@"Wrong Credentials!");
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error in connection!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"", nil];
    [alertView show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
}
-(void)readJsonWithString:(NSString *)data {
    NSLog(@"%@", data);
    //NSMutableDictionary *dict = data
}
@end
