//
//  ViewController.h
//  Proretention1.1
//
//  Created by sandip sayaji kote on 02/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

@class mainViewControlleriPad;
@class mainViewControlleriPhone;

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    MPMoviePlayerController *m_players;
}

@property(nonatomic,retain)mainViewControlleriPad *main_ipad;
@property(nonatomic,retain)IBOutlet UIView *primaryView_ipad;
@property(nonatomic,retain)IBOutlet UIView *primaryShadeView_ipad;
@property(nonatomic,retain)IBOutlet UIView *UIID_UIView_ipad;
@property(nonatomic,retain)IBOutlet UITextField *username_ipad;
@property(nonatomic,retain)IBOutlet UITextField *password_ipad;
@property(nonatomic,retain)IBOutlet UIButton *loginButton_ipad;

@property(nonatomic,retain)IBOutlet UILabel *UDID_Label_ipad;
@property(nonatomic,retain)IBOutlet UILabel *Model_Label_ipad;

- (IBAction)iPad_login:(id)sender;
-(IBAction)registerUDID_iPad;


@property(nonatomic,retain)mainViewControlleriPhone *main_iphone;
@property(nonatomic,retain)IBOutlet UIView *primaryView;
@property(nonatomic,retain)IBOutlet UIView *primaryShadeView;
@property(nonatomic,retain)IBOutlet UIView *UIID_UIView;
@property(nonatomic,retain)IBOutlet UITextField *password_iphone;
@property(nonatomic,retain)IBOutlet UITextField *username_iphone;
@property(nonatomic,retain)IBOutlet UIButton *loginButton_iphone;

- (IBAction)iPhone_login:(id)sender;
-(IBAction)registerUDID_iPhone;



@end
