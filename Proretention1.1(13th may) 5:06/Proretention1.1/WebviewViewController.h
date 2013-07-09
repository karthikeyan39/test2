//
//  WebviewViewController.h
//  Proretention1.1
//
//  Created by Admin on 23/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface WebviewViewController : UIViewController
{
     IBOutlet UIView *parentwebview;
      IBOutlet UIView *learningview;
     IBOutlet UIWebView *myweb;
    IBOutlet UIImageView *alarm,*otherimg,*uniimage;
    IBOutlet UIScrollView *menuscrollview;
    SystemSoundID SoundID;
    UIActionSheet *actionSheet;
    IBOutlet UIButton *other,*unilearning,*tutorbtn;
    IBOutlet UIToolbar *toolbar1;
    IBOutlet UITextView *tutortextview;
    IBOutlet UIBarButtonItem *backbtn;
}
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)universitylearningcenter;
-(IBAction)otherlearningcenter;
-(IBAction)virtualtutor;
-(IBAction)closewebview;
-(IBAction)closelearningview;
-(IBAction)gotolearningview;
-(IBAction)gobackprofile;
-(IBAction)gobackfaq;
-(IBAction)gobackrequest;
-(IBAction)ticketcreate;
-(IBAction)livesupport;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)marketplace;
-(IBAction)careerguide;
-(IBAction)closetextview;
@end
