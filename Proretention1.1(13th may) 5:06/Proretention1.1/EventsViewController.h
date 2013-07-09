//
//  EventsViewController.h
//  Proretention1.1
//
//  Created by Admin on 19/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <EventKitUI/EventKitUI.h>
#import <EventKit/EventKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "MyprofileViewController.h"
#import "NewLoginViewController.h"
@protocol CKCalendarDelegate;
@protocol CKCalendarDataSource;
@interface EventsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,CKCalendarDelegate,CKCalendarDataSource>
{
    IBOutlet UIView *parentview;
    IBOutlet UITableView *eventstable;
    IBOutlet UIView *detailedview;
    IBOutlet UIButton *calendarbutton;
    
    IBOutlet UILabel *headinglabel, *locationlabel, *startdatelabel, *enddatelabel, *diarylabel;
    IBOutlet UITextView *notesview;
    NSString *titlestring, *eventdatestr, *eventstartdate, *eventenddate, *eventlocation, *eventnotes;
    NSMutableArray *eventarray, *eventdatearray, *enddatearray, *locationarray, *notesarray;
    
    IBOutlet UIImageView *alarm;
    IBOutlet UIToolbar *toolbar1;
    SystemSoundID SoundID;
    NSDateFormatter *monthformat;
    UIActionSheet *actionSheet;
    NewLoginViewController *backtologin;
    MyprofileViewController *profileactionview;
}


-(IBAction)backtohome;
-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)profileactionsheet;
-(IBAction)facetimecall;
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;
-(IBAction)createapp;
@end
