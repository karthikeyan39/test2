//
//  Design_3_Final_ViewController_iPad.h
//  Proretention1.1
//
//  Created by sandip sayaji kote on 05/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <EventKitUI/EventKitUI.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>
#import "MKHorizMenu/MKHorizMenu.h"
#import "JHTickerView.h"
#import "MyprofileViewController.h"
#import "MyQueryViewController.h"
#import "MyFAQViewController.h"
#import "NewTicketViewController.h"
#import <MapKit/MapKit.h>
@class  ExpandableNavigation;
@protocol CKCalendarDelegate;
@protocol CKCalendarDataSource;

@interface Design_3_Final_ViewController_iPad : UIViewController<MKHorizMenuDataSource, MKHorizMenuDelegate,EKEventEditViewDelegate,CKCalendarDelegate,CKCalendarDataSource,UITableViewDelegate,UITableViewDataSource, MKMapViewDelegate,UIActionSheetDelegate, UIPopoverControllerDelegate> {
    
    MKHorizMenu *_horizMenu;
    NSMutableArray *_items;
    UILabel *_selectionItemLabel;
    BOOL alertstatus;
    UIButton* button1;
    UIButton* button2;
    UIButton* button3;
    UIButton* button4;
    UIButton* button5;
    UIButton* main;
    ExpandableNavigation* navigation;
    UIImageView *ViewdisableImg;
    int check;
    
        UIButton* aButton1;
        UIButton* aButton2;
        UIButton* aButton3;
        UIButton* aButton4;
        UIButton* aButton5;
    JHTickerView *ticker;
    JHTickerView *newsticker;
    NSArray *nib;
    NSArray *name,*name1;
    
    IBOutlet UILabel *answerlabel;
    IBOutlet UILabel *questionlabel;
    IBOutlet UISegmentedControl *faqsegment;
    NSArray *queryarray;
    NSMutableDictionary *dicValue;
    
    IBOutlet UILabel *queryname,*querydes;
    IBOutlet UILabel *annlabel;
    IBOutlet UITableView *newsfeed;
    IBOutlet UIView *learningview;
    NSMutableArray *newsarray,*announcementarray, *eventarray;
    
    IBOutlet UIWebView *newswebview;
   IBOutlet UIActivityIndicatorView*activityind;
    IBOutlet UIView *parentwebview;
    IBOutlet UIWebView *myweb;
    BOOL isShowingNewsList;
    BOOL isShowingannouncementList;
    BOOL isShowingEventList;
    int selectedValueIndex;
    
    NSString *eventstring,*eventdate;
    IBOutlet UILabel *eventlabel, *eventdatelabl, *noappointmentlabel;
    
    IBOutlet UITableView *eventstable;
    NSMutableArray *eventtilearray,*myeventsdatearray;
    NSString *eventstr,*eventsdate;
    
    IBOutlet UILabel *lbl1,*lbl2,*lbl3,*lbl4,*lbl5,*lbl6;
    IBOutlet UIButton *btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7, *btn8, *btn9;
    BOOL runonce;
    IBOutlet UIImageView *alarm, *homeanimation,*logoanimation;
    SystemSoundID SoundID;
    IBOutlet UIView *mainview,*parentnews,*parentapp,*parentevents;
    MyprofileViewController *myprofileview;
    MyQueryViewController *myqueryview;
    MyFAQViewController *myfaqview;
    NewTicketViewController *newticket;
    NSArray *imagearray;
    NSArray *newevents, *neweventsdate;
    NSArray *detailedarray, *datearray;
    IBOutlet UIView *locatorview;
    IBOutlet UIView *mycommunityview;
    IBOutlet UITableView *communitytable;
    IBOutlet UIScrollView *communityscroll;
    IBOutlet UIScrollView *mytimetableview;
    NSArray *communitynamearray, *communitydepartmentarray, *communityrolearray, *communityimagearray, *communityalertimage;
    NSMutableArray *test1;
    NSMutableArray *testtitlearray, *testdatearray;
    NSMutableArray *newtitlearray, *newdatearray;
    IBOutlet UIScrollView *menuscrollview;
//    UIActionSheet *actionSheet;
    IBOutlet UIToolbar *toolbar1, *toolbar2, *toolbar3, *toolbar4, *toolbar5;
    IBOutlet UITableView *mycontactstableview;
    NSMutableArray *namearray, *chatimagearray, *emailarray, *phonenumberarray, *departmentarray, *rolearray;
    NSArray *adminnamearray, *adminchatimagearray, *adminemailarray, *adminrolearray,*adminphone,*adminstatusarry;
    NSArray *academicnamearray, *academicchatimagearray, *academicemailarray, *academicrolearray,*academicphone, *academicstatusarray;
    NSArray *recentlynamearray, *recentlychatimagearray, *recentlyemailarray, *recentlyrolearray,*recentphone, *recentstatusarry;
    BOOL academic, admin, recent;
    IBOutlet UIButton *academicbutton, *adminbutton, *recentbutton,*createappoint;
    BOOL online, offline;
    
}
//-----------------------------------------
@property (nonatomic, strong) UIActionSheet *actionSheet;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) IBOutlet UIButton *chatbutton;

@property (weak, nonatomic) IBOutlet UIButton *userPhoto;
@property (weak, nonatomic) IBOutlet UILabel *Username;

//-----------------------------------------
@property (nonatomic, retain) IBOutlet UIButton *appointmentButton;
@property (nonatomic, retain) IBOutlet UIButton *aButton1;
@property (nonatomic, retain) IBOutlet UIButton *aButton2;
@property (nonatomic, retain) IBOutlet UIButton *aButton3;
@property (nonatomic, retain) IBOutlet UIButton *aButton4;
@property (nonatomic, retain) IBOutlet UIButton *aButton5;

// .......... scrollview Buttons ...........
@property (weak, nonatomic) IBOutlet UIButton *HomeButton;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;
@property (nonatomic, retain) IBOutlet MKHorizMenu *horizMenu;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) IBOutlet UILabel *selectionItemLabel; 

// .......... menu .......................
@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;
@property (nonatomic, retain) IBOutlet UIButton *button4;
@property (nonatomic, retain) IBOutlet UIButton *button5;
@property (nonatomic, retain) IBOutlet UIButton *main;



@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;


@property(nonatomic,retain)IBOutlet UIImageView *ViewdisableImg;

@property (retain) ExpandableNavigation* navigation;

- (IBAction) touchMenuItem:(id)sender;

-(IBAction)menuButton:(id)sender;

-(IBAction)Home:(id)sender;

-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;

-(IBAction)myprofile;
-(IBAction)myfeedback;
-(IBAction)myquery;
-(IBAction)myfaq;


-(IBAction)closewebview;
-(IBAction)closelearningview;
-(IBAction)gotolearningview;

//............................................

@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UIView *View2;
@property (weak, nonatomic) IBOutlet UIView *View3;
@property (weak, nonatomic) IBOutlet UIScrollView *View4;
@property (weak, nonatomic) IBOutlet UIView *annouview;
@property (weak, nonatomic) IBOutlet UIView *newsview;


@property (weak, nonatomic) IBOutlet UIView *ProfileView;
@property (weak, nonatomic) IBOutlet UITableView *Profiletable;


@property (weak, nonatomic) IBOutlet UITableView *tableview2;
@property (weak, nonatomic) IBOutlet UITableView *tableview3;


@property (weak, nonatomic) IBOutlet UITableView *querytable;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UIView *myView2;

@property (weak, nonatomic) IBOutlet UIImageView *Detail_Image_ipad;
- (IBAction)BackButton:(id)sender;

- (IBAction)CreateTicket_ipad:(id)sender;

- (IBAction)CreateAppointment_ipad:(id)sender;
-(IBAction)openAppointments:(id)sender;

-(IBAction)faq:(id)sender;
-(IBAction)creatlog;
-(IBAction)mymap;
-(IBAction)facetimecall;

@property (weak, nonatomic) IBOutlet MKMapView *mymapview;
@property (nonatomic, retain) NSString *latitudestr;
@property (nonatomic, retain) NSString *longitudestr;
@property (strong, nonatomic) IBOutlet UIButton *actionbutton;
@property (strong, nonatomic) IBOutlet UIImageView *headeriamge;
-(IBAction)profileactionsheet;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)learningcenter;
-(IBAction)universitylearningcenter;
-(IBAction)livesupport:(id)sender;
-(IBAction)marketplace;
-(IBAction)careerguide;
-(IBAction)chatoption:(id)sender;
-(IBAction)adminaction;
-(IBAction)academicaction;
-(IBAction)recentaction;
-(IBAction)emailinbox;
-(IBAction)createapp;
@end
