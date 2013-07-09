//
//  NewLoginViewController.h
//  Proretention1.1
//
//  Created by Admin on 16/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Design_3_Final_ViewController_iPad.h"

@interface NewLoginViewController : UIViewController
{
    Design_3_Final_ViewController_iPad *homedesign;
    MPMoviePlayerController *m_players;
    IBOutlet UITextField *usernamefield, *passwordfield;
}
-(IBAction)homeview;
@end
