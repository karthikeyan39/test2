//
//  NewsViewController.h
//  Proretention1.1
//
//  Created by Admin on 18/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import "NewLoginViewController.h"
#import "MyprofileViewController.h"

@interface NewsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *newstable;
    IBOutlet UIView *detailedview,*masterview;
    IBOutlet UILabel *headinglabel, *contentlabel;
    IBOutlet UIImageView *newsimageview,*smallimage;
    IBOutlet UITextView *contentview;
    NSMutableArray *newsarray, *imagearray, *detailedarray, *datearray;
    
    IBOutlet UIImageView *alarm;
    SystemSoundID SoundID;
    UIActionSheet *actionSheet;
    IBOutlet UIToolbar *toolbar1;
    NSArray *alphbetarray;
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
@end
