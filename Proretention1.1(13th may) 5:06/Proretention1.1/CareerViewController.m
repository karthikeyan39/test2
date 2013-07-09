//
//  CareerViewController.m
//  Proretention1.1
//
//  Created by Admin on 24/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "CareerViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "MyFAQViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "SupportViewController.h"
#import "WebviewViewController.h"
#import "MarketViewController.h"
#import "NewLoginViewController.h"
@interface CareerViewController ()

@end

@implementation CareerViewController
@synthesize alertbutton,pressbutton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
     menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"job-index" ofType:@"htm" inDirectory:@"career"]];
    [webview loadRequest:[NSURLRequest requestWithURL:url ]];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading)userInfo:nil repeats:YES];
 }

-(void)loading
{
    if (!webview.loading)
        [activityind stopAnimating];
    else
        [activityind startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)showmainmenu
{
    if(careerview.frame.origin.x == 0)
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
    [UIView animateWithDuration:0.25 animations:^{[careerview setFrame:CGRectMake(menuscrollview.frame.size.width, careerview.frame.origin.y, careerview.frame.size.width, careerview.frame.size.height)];}];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25 animations:^{[careerview setFrame:CGRectMake(0, careerview.frame.origin.y, careerview.frame.size.width, careerview.frame.size.height)];}];
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
-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
    //NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
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
    if( buttonIndex >=0)
    {
        if (buttonIndex == [ actionSheet destructiveButtonIndex])
        {
            MyprofileViewController *profileactionview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
            [self presentViewController:profileactionview animated:NO completion:nil];
        }
        if (buttonIndex == 1)
        {
            NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
            [self presentViewController:backtologin animated:NO completion:nil];
        }
    }
}

-(IBAction)gohome
{
    Design_3_Final_ViewController_iPad *homeview = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    [self presentViewController:homeview animated:NO completion:nil];
}
-(IBAction)gobackprofile
{
    MyprofileViewController *profileview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
    [self presentViewController:profileview animated:NO completion:nil];
}
-(IBAction)gobackfaq
{
//    MyFAQViewController *faqview = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
//    [self presentViewController:faqview animated:NO completion:nil];
    FAQSearchViewController *fa = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
    [self presentViewController:fa animated:NO completion:nil];
}
-(IBAction)gobackrequest
{
    MyQueryViewController *queryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    [self presentViewController:queryview animated:NO completion:nil];
}
-(IBAction)ticketcreate
{
    NewTicketViewController *newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self hidemenu];
    [self presentViewController:newticket animated:YES completion:nil];
}
-(IBAction)livesupport
{
    SupportViewController *supportview = [[SupportViewController alloc]initWithNibName:@"SupportViewController" bundle:nil];
    [self presentViewController:supportview animated:NO completion:nil];
}
-(IBAction)learningcenter
{
    WebviewViewController *learnng = [[WebviewViewController alloc]initWithNibName:@"WebviewViewController" bundle:nil];
    [self presentViewController:learnng animated:NO completion:nil];
}
-(IBAction)marketplace
{
    MarketViewController *market = [[MarketViewController alloc]initWithNibName:@"MarketViewController" bundle:nil];
    [self presentViewController:market animated:NO completion:nil];
}

@end
