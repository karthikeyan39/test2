//
//  StaffViewController.h
//  Proretention1.1
//
//  Created by Admin on 29/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <EventKitUI/EventKitUI.h>
#import <EventKit/EventKit.h>

@protocol CKCalendarDelegate;
@protocol CKCalendarDataSource;
@interface StaffViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,CKCalendarDataSource,CKCalendarDelegate>
{
    IBOutlet UIScrollView *menuscrollview;
    IBOutlet UIView *parentview, *homeview, *parentnews, *parentapp, *locatorview, *mycommunityview,*parentwebview;
    IBOutlet UIToolbar *toolbar1, *toolbar2, *toolbar3, *toolbar4, *toolbar5;
    IBOutlet UIButton *appointmentButton;
    IBOutlet UITableView *newsfeed, *eventstable, *mycontactstableview;
    IBOutlet UIButton *academicbutton, *adminbutton, *recentbutton, *addeventbutton;
    IBOutlet UIWebView *mywebview,*learningwebview;
    
    NSMutableArray *newsarray, *imagearray, *detailedarray, *datearray, *departmentarray;
    NSMutableArray *testtitlearray, *testdatearray;
    NSArray *adminnamearray, *adminchatimagearray, *adminemailarray, *adminrolearray,*adminphone,*adminstatusarry;
    NSArray *academicnamearray, *academicchatimagearray, *academicemailarray, *academicrolearray,*academicphone, *academicstatusarray;
    NSArray *recentlynamearray, *recentlychatimagearray, *recentlyemailarray, *recentlyrolearray,*recentphone, *recentstatusarry;
    NSString *eventstr,*eventsdate;
    NSString *eventstring,*eventdate;
    BOOL academic, admin, recent;
    
    IBOutlet UIView *learningloungeview,*livesupportview;
    IBOutlet UIButton *unilearn,*otherlearn,*tutorlearn,*tutorbtn;
    IBOutlet UITextView *tutortext;
     IBOutlet UIToolbar *webtoolbar,*livetoolbar;
      UIActionSheet *actionSheet;
    IBOutlet UIButton *mailbutton;
    IBOutlet UIBarButtonItem *backbtn;
    
     IBOutlet UITableView *admintable,*academictable,*recentable;
    IBOutlet UIButton *fromvalue,*tovalue,*recentvalue;
    IBOutlet UIButton *callbtn,*chatbtn,*facebtn, *emailbutton;
    IBOutlet UILabel *headinglabel;
}
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)mymap;
-(IBAction)adminaction;
-(IBAction)academicaction;
-(IBAction)recentaction;
-(IBAction)createapp;
-(IBAction)createticket;
-(IBAction)inbox;
-(IBAction)livesupport;
-(IBAction)learninglounge;
-(IBAction)businessinteligence;
-(IBAction)summary;
-(IBAction)closewebview;
-(IBAction)unilearning;
-(IBAction)otherlearning;
-(IBAction)tutorlearning;
-(IBAction)closelearingview;
-(IBAction)backtolearningview;
-(IBAction)closetextview;
-(IBAction)profileactionsheet;
-(IBAction)facetimecall;
-(IBAction)adminselect;
-(IBAction)academicselect;
-(IBAction)recentselect;
-(IBAction)livesupportback;
@end