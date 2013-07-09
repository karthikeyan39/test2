//
//  SupportViewController.h
//  Proretention1.1
//
//  Created by Admin on 23/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>
#import "MessageUI/MessageUI.h"
#import<MessageUI/MFMailComposeViewController.h>
@interface SupportViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIScrollView *menuscrollview;
    IBOutlet UIView *parentview;
    IBOutlet UIImageView *alarm;
    SystemSoundID SoundID;
    UIActionSheet *actionSheet;
    
    IBOutlet UIButton *callbtn,*chatbtn,*facebtn, *emailbutton;
    IBOutlet UIToolbar *toolbar1;
    NSMutableArray *adminfull,*academicfull;
    NSMutableArray *adminnamearray, *adminchatimagearray,*adminstatusarry,*adminrolearray, *adminemailarray, *adminphone;
    NSMutableArray *academicnamearray, *academicchatimagearray, *academicstatusarray;
     NSMutableArray *recentlynamearray, *recentlychatimagearray, *recentstatusarry,*recentlyemailarray, *recentlyrolearray,*recentphone ;
    BOOL admin,academic,recent;
    IBOutlet UITableView *admintable,*academictable,*recentable;;
    IBOutlet UIButton *fromvalue,*tovalue,*recentvalue;
//    UITableViewCell *getcell;
//    NSString *celltext;
}
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)back;
-(IBAction)facetime;
-(IBAction)profileactionsheet;

-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;

-(IBAction)gobackprofile;
-(IBAction)gobackfaq;
-(IBAction)gobackrequest;
-(IBAction)ticketcreate;
-(IBAction)learningcenter;
-(IBAction)marketplace;
-(IBAction)careerguide;
-(IBAction)emailaction;
-(IBAction)adminselect;
-(IBAction)academicselect;
-(IBAction)recentselect;
-(IBAction)conference;
@end
