//
//  CareerViewController.h
//  Proretention1.1
//
//  Created by Admin on 24/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface CareerViewController : UIViewController
{
    IBOutlet UIScrollView *menuscrollview;
    SystemSoundID SoundID;
    UIActionSheet *actionSheet;
    IBOutlet UIImageView *alarm;
    IBOutlet UIView *careerview;
    IBOutlet UIWebView *webview;
    IBOutlet UIActivityIndicatorView*activityind;
    NSTimer *timer;
    IBOutlet UIToolbar *toolbar1;
}
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)gohome;
-(IBAction)gobackprofile;
-(IBAction)gobackfaq;
-(IBAction)gobackrequest;
-(IBAction)ticketcreate;
-(IBAction)livesupport;
-(IBAction)learningcenter;
-(IBAction)marketplace;
@end
