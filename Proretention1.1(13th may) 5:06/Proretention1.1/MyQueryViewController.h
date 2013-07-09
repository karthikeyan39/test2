//
//  MyQueryViewController.h
//  Proretention1.1
//
//  Created by Admin on 26/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#define cellHeight 40 // You can change according to your req.<br>
#define cellWidth 720

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <sqlite3.h>
#import <EventKitUI/EventKitUI.h>
#import <AudioToolbox/AudioToolbox.h>


@interface MyQueryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSDateFormatter *format ;
    SystemSoundID SoundID;
    bool isSelected;

    IBOutlet UIImageView *alarm;
    IBOutlet UITableView *querytable, *notestable;
    IBOutlet UIButton *addbutton,*createlog;
    IBOutlet UILabel *notificationlabel;
    
    IBOutlet UIView *ticketssbview,*addingticketview;
    IBOutlet UITextView *addingnotestextfield;
    NSString *firstnamestr, *lastnamestr, *ticketnumberstr,*datesring, *timestring,*subjectstr,*statusstr;
    NSString *numberticket;
    NSDateFormatter *dateformatdate;
    NSDateFormatter *dateformattime;
     IBOutlet UIToolbar *toolbar1;
    NSMutableArray *fullarray, *notesarray;
    NSString *ticketnumber, *titlestr, *desstr, *notestr, *adddate;
    IBOutlet UIView *popview;
     IBOutlet UIScrollView *menuscrollview;
    UIActionSheet *actionSheet;
    IBOutlet UIView *queryview;
    IBOutlet UIWebView *webview;
    IBOutlet UIButton *createbutton;
    
}
-(IBAction)homebutton;
-(IBAction)myprofile;
-(IBAction)myfaq;
-(IBAction)creatlog;
-(IBAction)addnotes;
-(IBAction)notesubmit;
-(IBAction)closenotes;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)learningcenter;
-(IBAction)livesupport:(id)sender;
-(IBAction)marketplace;
-(IBAction)careerguide;
-(void)delay1;
@end
