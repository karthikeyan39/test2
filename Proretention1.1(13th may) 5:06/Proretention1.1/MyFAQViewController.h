//
//  MyFAQViewController.h
//  sendfiles
//
//  Created by Vril Mac on 5/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"
#import <EventKitUI/EventKitUI.h>
#import <AudioToolbox/AudioToolbox.h>

@interface MyFAQViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{

    NSMutableArray *categoreislist,*DLSregform,*idcheck,*sconul,*ceremonies,*certificates,*alumini,*diploma,*ills;
    NSMutableArray *DLSsupport;
    NSMutableArray *filteredList,*container;
    BOOL dlsreg,dlssup,idchk,sco,cere,cert,alu,dip,inter,alertstatus;
    IBOutlet UIImageView *myfaqimageview;
    IBOutlet UIButton *myfaqbutton, *alertbutton,*pressbutton;
    BOOL searchstart,isSearching;
    IBOutlet UIImageView *animation,*faq,*faqanimation,*logoanimation;
    IBOutlet UIView *firstview,*partextview;
    
    IBOutlet UIButton *button1, *button2;
    int check;
    
    IBOutlet UIBarButtonItem *backbutton;
    IBOutlet UIToolbar *searchtoolbar;
    
    IBOutlet UIImageView *alarm;
    SystemSoundID SoundID;
    BOOL swipe;
    UISwipeGestureRecognizer *recognizer;
    CATransition *animations;
    IBOutlet UIScrollView *menuscrollview;
    UIActionSheet *actionSheet;
    IBOutlet UIToolbar *toolbar1;
    IBOutlet UIImageView *faqimage, *aniimage;
}

-(IBAction)homeaction;
-(IBAction)myprofile;
-(IBAction)myquery;
-(IBAction)creatlog;
-(IBAction)backtofaq;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)cateroy:(id)sender;
-(void)showcategory;
-(void)hidecategory;

-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)learningcenter;
-(IBAction)livesupport:(id)sender;
@property(nonatomic, retain) IBOutlet UITableView *categories;
@property(nonatomic, retain) IBOutlet UITableView *catques;
@property(nonatomic, weak) IBOutlet UIView *faqanswerview;
@property(nonatomic, weak) IBOutlet UIView *parentview;
@property(nonatomic, weak) IBOutlet UITextView *showans;
-(IBAction)marketplace;
-(IBAction)careerguide;
@end
