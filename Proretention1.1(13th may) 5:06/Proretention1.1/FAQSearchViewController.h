//
//  FAQSearchViewController.h
//  FAQSearch
//
//  Created by Vril Mac on 6/6/13.
//  Copyright (c) 2013 Vril Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>
#import <AudioToolbox/AudioToolbox.h>


@interface FAQSearchViewController : UIViewController<UITableViewDataSource , UITableViewDelegate , UISearchDisplayDelegate , UISearchBarDelegate>
{
    BOOL isSearching,searchstart;
    
    NSMutableArray *filteredList;
    
       
    NSMutableArray *DLSregform,*idcheck,*sconul,*ceremonies,*certificates,*alumini,*diploma,*ills;
    NSMutableArray *DLSsupport,*container;
    BOOL dlsreg,dlssup,idchk,sco,cere,cert,alu,dip,inter;
    IBOutlet UITextView *answer;
    IBOutlet UITableView *searchtable;
    IBOutlet UILabel *lbl;
    IBOutlet UIView *parentview ,*mainview;
    
    IBOutlet UIImageView *animation;
    
    IBOutlet UIButton *button1, *button2;
    int check;
    
    BOOL alertstatus;
    IBOutlet UIButton *alertbutton,*pressbutton;
    IBOutlet UIImageView *alarm, *faqanimation, *logoanimation;
    SystemSoundID SoundID;
    IBOutlet UIView *faqmainview;
    IBOutlet UIToolbar *toolbar1;
    UIActionSheet *actionSheet;
     IBOutlet UIScrollView *menuscrollview;
    IBOutlet UIView *faqparenview;
}

-(IBAction)homeaction;
-(IBAction)myprofile;
-(IBAction)myquery;
-(IBAction)creatlog;
-(IBAction)directsearch;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)showmainmenu;
-(void)showmenu;
-(void)hidemenu;
-(IBAction)learningcenter;
-(IBAction)livesupport:(id)sender;
-(IBAction)marketplace;
-(IBAction)careerguide;
@end
