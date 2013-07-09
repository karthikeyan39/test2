//
//  NewTicketViewController.h
//  Proretention1.1
//
//  Created by Admin on 10/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
@interface NewTicketViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    IBOutlet UITextField *titletextfield;
    IBOutlet UITextView *descriptiontextview;
    IBOutlet UIImageView *alarm,*loganimation,*logoanimation;
    IBOutlet UIButton *alertbutton, *pressbutton;
    SystemSoundID SoundID;
    BOOL submit;
    NSString *ticketno;
    IBOutlet UIWebView *myweb;
    IBOutlet UILabel *notificationlabel;
    IBOutlet UIToolbar *toolbar1;
}
-(IBAction)submitticket;
-(IBAction)myquery;
-(IBAction)myfaq;
-(IBAction)home;
-(IBAction)myprofile;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)closeticket;

@property (nonatomic, assign) BOOL submit;
@end
