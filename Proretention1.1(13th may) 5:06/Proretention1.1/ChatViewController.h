//
//  ChatViewController.h
//  Proretention1.1
//
//  Created by Admin on 26/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"
#import<MessageUI/MFMailComposeViewController.h>
@interface ChatViewController : UIViewController
{
    IBOutlet UILabel *staffnamelbl, *departmentlbl, *rolelbl, *mailidlbl, *mobilenumberlbl;
    IBOutlet UIImageView *chatimageview;
    IBOutlet UIToolbar *toolbar1;
    IBOutlet UIView *proview;
    UIActionSheet *actionSheet;
    
    IBOutlet UIButton *mail,*call,*chat,*conference;
    BOOL online;
}
@property (nonatomic, retain) NSString *staffnamestr;
@property (nonatomic, retain) NSString *departmentstr;
@property (nonatomic, retain) NSString *rolestr;
@property (nonatomic, retain) NSString *mailidstr;
@property (nonatomic, retain) NSString *mobilenumberstr;
@property (nonatomic, retain) NSString *imagestr;
@property (nonatomic, retain)  IBOutlet UIButton *mail;
@property (nonatomic, retain) IBOutlet UIButton *call;
@property (nonatomic, retain) IBOutlet UIButton *chat;
@property (nonatomic, retain) IBOutlet UIButton *conference;
@property (nonatomic, assign) BOOL online;
@property (nonatomic, assign) BOOL offline;

-(IBAction)gohome;
-(IBAction)facetimecall;
-(IBAction)profileactionsheet;
-(IBAction)mailconnect;
-(IBAction)facebabu;

@end
