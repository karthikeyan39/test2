//
//  ViewController.m
//  Proretention1.1
//
//  Created by sandip sayaji kote on 02/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "ViewController.h"


#import "Design_3_Final_ViewController_iPad.h"
int global_UDID_iphone;
int global_UDID_ipad;

@interface ViewController ()

@end

@implementation ViewController

@synthesize main_ipad;
@synthesize main_iphone;
@synthesize UIID_UIView;
@synthesize primaryView;
@synthesize primaryShadeView;

@synthesize UIID_UIView_ipad;
@synthesize primaryView_ipad;
@synthesize primaryShadeView_ipad;
@synthesize username_ipad,username_iphone,password_iphone,password_ipad,loginButton_ipad,loginButton_iphone;
@synthesize UDID_Label_ipad,Model_Label_ipad;


int global_UDID;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"lanvideo" withExtension:@"mov"];
    
    m_players = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [m_players.backgroundView setBackgroundColor:[UIColor blackColor]];
    [m_players.view setBackgroundColor:[UIColor blackColor]];
    [m_players setControlStyle:MPMovieControlStyleNone];
    [[m_players view] setFrame:[self.view bounds]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [m_players play];
    
    [self.view addSubview:[m_players view]];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBarHidden = YES;
    [self.username_iphone setDelegate:self];
    [self.username_iphone setReturnKeyType:UIReturnKeyDone];
    [self.username_iphone addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.password_iphone setDelegate:self];
    [self.password_iphone setReturnKeyType:UIReturnKeyDone];
    [self.password_iphone addTarget:self
                             action:@selector(textFieldFinished:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.username_ipad setDelegate:self];
    [self.username_ipad setReturnKeyType:UIReturnKeyDone];
    [self.username_ipad addTarget:self
                             action:@selector(textFieldFinished:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.password_ipad setDelegate:self];
    [self.password_ipad setReturnKeyType:UIReturnKeyDone];
    [self.password_ipad addTarget:self
                             action:@selector(textFieldFinished:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self resignFirstResponder];
}

- (void) moviePlayBackDidFinish:(NSNotification*)_notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [m_players.view removeFromSuperview];
    [m_players stop];
    
    m_players = nil;
}

-(void)viewDidAppear:(BOOL)animated
{
   
        self.navigationController.navigationBarHidden = YES;
    [self.username_iphone setDelegate:self];
    [self.username_iphone setReturnKeyType:UIReturnKeyDone];
    [self.username_iphone addTarget:self
                             action:@selector(textFieldFinished:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.password_iphone setDelegate:self];
    [self.password_iphone setReturnKeyType:UIReturnKeyDone];
    [self.password_iphone addTarget:self
                             action:@selector(textFieldFinished:)
                   forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.username_ipad setDelegate:self];
    [self.username_ipad setReturnKeyType:UIReturnKeyDone];
    [self.username_ipad addTarget:self
                           action:@selector(textFieldFinished:)
                 forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.password_ipad setDelegate:self];
    [self.password_ipad setReturnKeyType:UIReturnKeyDone];
    [self.password_ipad addTarget:self
                           action:@selector(textFieldFinished:)
                 forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self resignFirstResponder];
}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [self iPad_login:self];
//
//    return YES;
//}
- (IBAction)textFieldFinished:(id)sender
{
    // [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)iPhone_login:(id)sender {    
    
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    global_UDID_iphone = [defaults integerForKey:@"global_iphone"];
//    if (global_UDID_iphone==1) {                                      //checking is user already register??
//        main_iphone=[[mainViewControlleriPhone alloc]init];
//        [self presentViewController:main_iphone animated:YES completion:nil];
//    }
//    else
//    {
        primaryShadeView.hidden =NO;
        UIID_UIView.hidden=NO;
        [self goAction];
    
        primaryView.userInteractionEnabled = YES;
//    }
}

- (void)goAction
{
    primaryView.userInteractionEnabled = NO;
        
    username_iphone.hidden=YES;
    password_iphone.hidden=YES;
    loginButton_iphone.hidden=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        UIID_UIView.frame = CGRectMake(0, 00, UIID_UIView.frame.size.width, UIID_UIView.frame.size.height);
        
        CALayer *layer = primaryView.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m21 = 1.0 / -300;
//        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 10.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
        primaryShadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
    //    primaryView.transform = CGAffineTransformMakeScale(0.9,0.9);
           primaryShadeView.alpha = 1;
        }];
    }];
    

    
}

//- (IBAction)iPad_login:(id)sender {
//    
//    if ([username_ipad.text isEqualToString:@""] && [password_ipad.text isEqualToString:@""])
//    {
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        
//            global_UDID_ipad = [defaults integerForKey:@"global_ipad"];
//            if (global_UDID_ipad==1) {                                      //checking is user already register??
//                main_ipad=[[Design_3_Final_ViewController_iPad alloc]init];
//                //[self presentViewController:main_ipad animated:YES completion:nil];
//               // [self presentViewController:main_ipad animated:YES completion:nil];
//                 [self.navigationController pushViewController:main_ipad animated:YES];
//            }
//            else
//            {
//                NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
//                NSString *model=[[UIDevice currentDevice]model];
//    
//                UDID_Label_ipad.text=udid;
//                Model_Label_ipad.text=model;
//    
//    
//                NSLog(@"Model is : %@",model);
//                NSLog(@"UDID: [%@]", udid);
//    
//                primaryShadeView_ipad.hidden =NO;
//                UIID_UIView_ipad.hidden=NO;
//                [self goAction_ipad];
//                primaryView_ipad.userInteractionEnabled = YES;
//            }
//       
//        
//    }
//    else {
//            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Invalid User !"
//                                                          message:@"Enter valid User name & Password"
//                                                         delegate:nil
//                                                cancelButtonTitle:@"OK"
//                                                otherButtonTitles:nil];
//        
//            [message show];
//        }
//
//    
//
//}
- (void)goAction_ipad
{
    primaryView_ipad.userInteractionEnabled = NO;
    
    username_ipad.hidden=YES;
    password_ipad.hidden=YES;
    loginButton_ipad.hidden=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        UIID_UIView_ipad.frame =CGRectMake(0,0, UIID_UIView_ipad.frame.size.width, UIID_UIView_ipad.frame.size.height);
        
        //CGRectMake(0, 0, self.view.bounds.size.width/2, self.view.bounds.size.height/2);
        
        CALayer *layer = primaryView_ipad.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m21 = 1.0 / -300;
       // layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 10.0f * M_PI / 360.0f, 1.0f, 0.0f, 0.0f);
        primaryShadeView_ipad.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
    //   primaryView.transform = CGAffineTransformMakeScale(0.9,0.9);
            primaryShadeView_ipad.alpha = 1;
        }];
    }];
    
    
    
}

//-(IBAction)registerUDID_iPad
//{
//    // Store the data
//    global_UDID_ipad=1;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    [defaults setInteger:global_UDID_ipad forKey:@"global_ipad"];
//    [defaults synchronize];
//    
//    UIID_UIView_ipad.hidden=YES;
//    primaryShadeView_ipad.hidden=YES;
//    NSLog(@"test........");
//    username_ipad.hidden=NO;
//    password_ipad.hidden=NO;
//    loginButton_ipad.hidden=NO;
//
//    main_ipad=[[Design_3_Final_ViewController_iPad alloc]init];
//    [self.navigationController pushViewController:main_ipad animated:YES];
//    //[self presentViewController:main_ipad animated:YES completion:nil];
//    
//    
//}
//-(IBAction)registerUDID_iPhone
//{
//    // Store the data
//    global_UDID_iphone=1;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    [defaults setInteger:global_UDID_iphone forKey:@"global_iphone"];
//    [defaults synchronize];
//    
//    main_iphone=[[mainViewControlleriPhone alloc]init];
//    [self presentViewController:main_iphone animated:YES completion:nil];
//    
//}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//    return NO;
//}

//------ UITextField Delegate methods for Keyboard operation ------//
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
   // NSLog(@"Working!!!");
    [self iPad_login:self];
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}

//-------------------------------------------------------------------//
//-(NSUInteger)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskLandscapeRight;
//}

@end
