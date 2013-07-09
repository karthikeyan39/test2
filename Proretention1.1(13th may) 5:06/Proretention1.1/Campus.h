//
//  Campus.h
//  Proretention1.1
//
//  Created by Admin on 21/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>
@interface Campus : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *imageScrollView;
    UIImageView *imageView;
    UIImageView *details;
    SystemSoundID SoundID;
    UIActionSheet *actionSheet;
    IBOutlet UIImageView *alarm,*mapani;
    
    NSMutableArray *fromarray,*toarray;
    IBOutlet UIToolbar *toolbar1;
    NSMutableArray *array,*array1;
    BOOL showing,showing1;
    IBOutlet UITableView *fromtable,*totable;
    IBOutlet UIButton *gobutton, *fromvalue, *tovalue,*getdirection;
    IBOutlet UIView *locationview;
    UITableViewCell *getcell;
    NSString *celltext;
    int noofclick;
    IBOutlet UILabel *lbl1,*lbl2,*lbl3,*lbl4;

}
@property (nonatomic, retain) IBOutlet UIScrollView *imageScrollView;
@property (nonatomic, retain) IBOutlet UIScrollView *detailsScrollView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *details;
@property (nonatomic, retain) IBOutlet UIButton *alertbutton;
@property (nonatomic, retain) IBOutlet UIButton *pressbutton;

@property (nonatomic, retain) IBOutlet UITableView *fromselection;
@property (nonatomic, retain) IBOutlet UITableView *toselection;


-(IBAction)alertaction:(id)sender;
-(IBAction)alertoff:(id)sender;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)backtohome;
-(IBAction)firstmap;
-(IBAction)secondmap;
-(IBAction)thirdmap;
-(IBAction)fourthmap;
-(IBAction)location;
-(IBAction)goaction;
-(IBAction)frombtn;
-(IBAction)tobtn;
@end
