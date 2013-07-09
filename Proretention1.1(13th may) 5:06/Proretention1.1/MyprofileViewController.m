
//  MyprofileViewController.m
//  Proretention1.1
//
//  Created by Admin on 27/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.


#import "MyprofileViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyFAQViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "NewLoginViewController.h"
#import "WebviewViewController.h"
#import "SupportViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
#import "AppDelegate.h"
@interface MyprofileViewController ()
@end

@implementation MyprofileViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)playvideo
{
        NSURL *playurl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"profilevideo" ofType:@"mp4"]];
        MPMoviePlayerViewController *playercntlr = [[MPMoviePlayerViewController alloc]initWithContentURL:playurl];
        [self presentMoviePlayerViewControllerAnimated:playercntlr];
        playercntlr.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        [playercntlr.moviePlayer play];
        playercntlr = nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    proview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"profilebg.png"]];
     [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
     [webtoolbar setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
//    profileupview.layer.borderWidth= 1;
//    profileupview.layer.backgroundColor=[[UIColor lightGrayColor] CGColor];
//    profileupview.layer.cornerRadius = 8;
    
   menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newmainbgs.png"]];
   // profilehomeview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil
//                                    repeats:NO];
//      profilehomeview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]];
    [profileimageview setImage:[UIImage imageNamed:@"newbg.png"]];
    [profilebutton setImage:[UIImage imageNamed:@"newprofile1.png"] forState:UIControlStateNormal];
    profilescroll.contentSize = CGSizeMake(0, 620);
//    profilescroll.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]];
    profilescroll.scrollEnabled = YES;
    gradescroll.contentSize = CGSizeMake(0, 900);
    check = 1;
    
    [test.layer setBorderColor: [[UIColor colorWithRed:163.0/255 green:157.0/255 blue:159.0/255 alpha:1]CGColor]];
    [test.layer setBorderWidth: 2.0];
    videoview.layer.borderWidth = 2;
    basicview.layer.borderWidth = 2;
    contactview.layer.borderWidth = 2;
    
    videoview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    basicview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    contactview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}
-(void)targetMethod:(NSTimer *)t
{
    [UIView animateWithDuration:0.1
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         gradescroll.frame = CGRectMake(3, -12, 1000, 500);
                     }
                     completion:^(BOOL finished){
                     }];
  //  [self.view addSubview:profilehomeview];
    [profilescroll addSubview:gradescroll];
}
-(IBAction)myquery
{
    MyQueryViewController *myqueryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
  //  AppDelegate *apps = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //apps.alert += 1;
    //[[NSUserDefaults standardUserDefaults] setInteger:apps.alert forKey:@"activealarm"];
    //NSLog(@"$$$$$$$$$$ %@",apps.alert);
    //myqueryview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
   [self presentViewController:myqueryview animated:NO completion:nil];
   // [self dismissViewControllerAnimated:YES completion:nil];

}
-(IBAction)myfaq
{
//    MyFAQViewController *myfaqview = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
//    //myfaqview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:myfaqview animated:NO completion:nil];
//    //[self dismissViewControllerAnimated:YES completion:nil];
    FAQSearchViewController *fa = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
    [self presentViewController:fa animated:NO completion:nil];

}
-(IBAction)home
{
    Design_3_Final_ViewController_iPad *homeview = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    //homeview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:homeview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)creatlog
{
    NewTicketViewController *newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
    //newticket.modalPresentationStyle = UIModalPresentationFormSheet;
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self hidemenu];
    [self presentViewController:newticket animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)alertaction:(id)sender
{
    alarm.hidden = NO;
    pressbutton.hidden = NO;
    alertbutton.hidden = YES;
    alarm.animationImages = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"a1.png"],[UIImage imageNamed:@"a2.png"],[UIImage imageNamed:@"a3.png"],[UIImage imageNamed:@"a4.png"],[UIImage imageNamed:@"a5.png"],[UIImage imageNamed:@"a6.png"],[UIImage imageNamed:@"a7.png"],nil];
    [alarm setAnimationRepeatCount:0];
    
    alarm.animationDuration = 1;
    
    [alarm startAnimating];
    
    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"soundfile" ofType:@"mp3"]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &SoundID);
    
    AudioServicesPlaySystemSound(SoundID);
    
}

-(IBAction)alertoff:(id)sender
{
    alarm.hidden = YES;
    pressbutton.hidden = YES;
    alertbutton.hidden = NO;
    AudioServicesRemoveSystemSoundCompletion(SoundID);
    AudioServicesDisposeSystemSoundID(SoundID);
    [alarm stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)segmentaction
{
    if (segmentcontrol.selectedSegmentIndex == 0)
    {
        profilescroll.scrollEnabled = NO;
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{ profilescroll.contentOffset = CGPointMake(0, 0);}completion:nil];
    }
    if (segmentcontrol.selectedSegmentIndex == 1)
    {
        profilescroll.scrollEnabled = NO;
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{ profilescroll.contentOffset = CGPointMake(0, 300);}completion:nil];
        [self alertaction:alertbutton];
    }
}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    UITouch *touch = [touches anyObject];
//    
//    // If the touch was in the placardView, move the placardView to its location
//    
//    if ([touch view] == videoview)
//    {
//        CGPoint location = [touch locationInView:self.view];
//        CGPoint placardCenter = videoview.center;
//        placardCenter.x = location.x;
//        videoview.center = placardCenter;
//        return;
//    }
//    if ([touch view] == basicview)
//    {
//        CGPoint location = [touch locationInView:self.view];
//        CGPoint placardCenter = basicview.center;
//        placardCenter.x = location.x;
//        basicview.center = placardCenter;
//        return;
//    }
//    if ([touch view] == contactview)
//    {
//        CGPoint location = [touch locationInView:self.view];
//        CGPoint placardCenter = contactview.center;
//        placardCenter.x = location.x;
//        contactview.center = placardCenter;
//        return;
//    }
//}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    if ([touch view] == videoview)
//    {
//        videoview.center = CGPointMake(115, 268);
//    }
//    if ([touch view] == basicview)
//    {
//        basicview.center = CGPointMake(424, 268);
//    }
//    if ([touch view] == contactview)
//    {
//        contactview.center = CGPointMake(821, 268);
//    }
//
//}
//
-(IBAction)showmainmenu
{
    if(profilehomeview.frame.origin.x == 0)
    {
        [self showmenu];
    }
    else
    {
        [self hidemenu];
    }
}
-(void)showmenu
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [profilehomeview setFrame:CGRectMake(menuscrollview.frame.size.width, profilehomeview.frame.origin.y, profilehomeview.frame.size.width, profilehomeview.frame.size.height)];
                     }];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [profilehomeview setFrame:CGRectMake(0, profilehomeview.frame.origin.y, profilehomeview.frame.size.width, profilehomeview.frame.size.height)];
                    }];
    //menuscrollview.hidden = YES;
}
-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
    NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
    // [myWebView loadRequest:httpReq];
    
    //NSURL *urll = [NSURL URLWithString:@"http://username:password@192.168.1.1"];
    
    
    NSLog(@"http Req:--%@",httpReq);
}
-(IBAction)profileactionsheet
{
    actionSheet =[[UIActionSheet alloc]initWithTitle:@"Aaron Davidson" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:@"", nil];
    [actionSheet showFromRect:CGRectMake(964, -10, 50, 75) inView:self.view animated:YES];
    UIButton *btn = [[actionSheet subviews] objectAtIndex:1];
    btn.showsTouchWhenHighlighted = YES;
    UIButton *btns2 =[[actionSheet subviews]objectAtIndex:2];
    btns2.showsTouchWhenHighlighted = YES;
    [btn setBackgroundImage:[UIImage imageNamed:@"action1.png"] forState:UIControlStateNormal];
    [btns2 setBackgroundImage:[UIImage imageNamed:@"action3.png"] forState:UIControlStateNormal];
}
-(void)actionSheet:(UIActionSheet *)actionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog( @"buttonIndex%d",buttonIndex);
    if( buttonIndex >=0)
    {
        if (buttonIndex == [ actionSheet destructiveButtonIndex])
        {
            MyprofileViewController *profileactionview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
            [self presentViewController:profileactionview animated:NO completion:nil];
        }
        //    if ([choice isEqualToString:@"Logout"])
        //    {
        if (buttonIndex == 1)
        {
            NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
            [self presentViewController:backtologin animated:NO completion:nil];
        }
    }
    
}

-(IBAction)learningcenter
{
    WebviewViewController *web = [[WebviewViewController alloc] initWithNibName:@"WebviewViewController" bundle:nil];
    [self presentViewController:web animated:NO completion:nil];
}
-(IBAction)livesupport:(id)sender
{
    SupportViewController *support = [[SupportViewController alloc] initWithNibName:@"SupportViewController" bundle:nil];
    [self presentViewController:support animated:NO completion:nil];
}
-(IBAction)marketplace
{
    MarketViewController *mymarket = [[MarketViewController alloc]initWithNibName:@"MarketViewController" bundle:nil];
    [self presentViewController:mymarket animated:NO completion:nil];
}
-(IBAction)careerguide
{
    CareerViewController *careerview = [[CareerViewController alloc]initWithNibName:@"CareerViewController" bundle:nil];
    [self presentViewController:careerview animated:NO completion:nil];
}
-(IBAction)myfees
{
//        gradescroll.hidden = NO;
//     modelimage.frame = CGRectMake(0, 63, 1000, 250);
//    gradescroll.contentSize = CGSizeMake(0, 500);
//        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"feestype11.jpg"]];
    webparentview.hidden = NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fee" ofType:@"htm" inDirectory:nil]];
    [profilewebview loadRequest:[NSURLRequest requestWithURL:url]];
}
-(IBAction)mymodules
{
//        gradescroll.hidden = NO;
//        modelimage.frame = CGRectMake(0, 20, 1020, 800);
//       gradescroll.contentSize = CGSizeMake(0, 850);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"modulestype11.jpg"]];
    webparentview.hidden = NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mod" ofType:@"htm" inDirectory:nil]];
    [profilewebview loadRequest:[NSURLRequest requestWithURL:url]];
}
-(IBAction)mylib
{
//        gradescroll.hidden = NO;
//    modelimage.frame = CGRectMake(0, 43, 1010, 600);
//    gradescroll.contentSize = CGSizeMake(0, 500);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"libtype11.jpg"]];
    webparentview.hidden = NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"libb" ofType:@"htm" inDirectory:nil]];
    [profilewebview loadRequest:[NSURLRequest requestWithURL:url]];

}
-(IBAction)myfeedback
{
//        gradescroll.hidden = NO;
//    modelimage.frame = CGRectMake(0, 43, 1000, 300);
//    gradescroll.contentSize = CGSizeMake(0, 500);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"feedtype1.png"]];
     webparentview.hidden = NO;
    [profilewebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9002/survey/StudentSurvey.aspx"]]];

}
//-(IBAction)queries
//{
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"feestype.png"]];
//}

-(IBAction)grades
{
//        gradescroll.hidden = NO;
//    modelimage.frame = CGRectMake(0, 43, 1000, 300);
//    gradescroll.contentSize = CGSizeMake(0, 750);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
//    [modelimage setImage:[UIImage imageNamed:@"gradetype11.jpg"]];
    webparentview.hidden = NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"grad" ofType:@"htm" inDirectory:nil]];
    [profilewebview loadRequest:[NSURLRequest requestWithURL:url]];
}
-(IBAction)queryweb
{
    webparentview.hidden = NO;
    [profilewebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9002/Ticket/studentInbox.aspx"]]];
}
-(IBAction)closescroll
{
    gradescroll.hidden = YES;
}
-(IBAction)closeweb
{
    webparentview.hidden = YES;
}
@end
