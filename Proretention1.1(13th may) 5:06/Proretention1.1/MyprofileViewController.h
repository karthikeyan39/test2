//
//  MyprofileViewController.h
//  Proretention1.1
//
//  Created by Admin on 27/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
@interface MyprofileViewController : UIViewController
{

    IBOutlet UIScrollView *profilescroll;
    IBOutlet UIImageView *profileimageview;
    IBOutlet UIButton *profilebutton, *alertbutton, *testb,*pressbutton;
    IBOutlet UIImageView *test;
    BOOL alertstatus;
    IBOutlet UIView *profilehomeview;
    IBOutlet UIButton *button1, *button2;
    int check;
    
    IBOutlet UIImageView *alarm,*profileanimation,*logoanimation;
    SystemSoundID SoundID;
    IBOutlet UISegmentedControl *segmentcontrol;
    IBOutlet UIView *videoview, *basicview, *contactview,*profileupview;
    IBOutlet UIScrollView *menuscrollview;
    UIActionSheet *actionSheet;
    IBOutlet UIToolbar *toolbar1;
    IBOutlet UIImageView *modelimage;
    IBOutlet UIScrollView *gradescroll;
    IBOutlet UIView *proview;
    IBOutlet UIView *webparentview;
    IBOutlet UIWebView *profilewebview;
    IBOutlet UIToolbar *webtoolbar;
}
-(IBAction)playvideo;
-(IBAction)myquery;
-(IBAction)myfaq;
-(IBAction)home;
-(IBAction)creatlog;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)segmentaction;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)learningcenter;
-(IBAction)livesupport:(id)sender;
-(IBAction)marketplace;
-(IBAction)careerguide;
-(IBAction)myfees;
-(IBAction)mymodules;
-(IBAction)mylib;
-(IBAction)myfeedback;
-(IBAction)queries;
-(IBAction)grades;
-(IBAction)queryweb;
-(IBAction)closescroll;
-(IBAction)closeweb;
@end
