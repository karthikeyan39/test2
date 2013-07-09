//
//  ChatViewController.m
//  Proretention1.1
//
//  Created by Admin on 26/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "ChatViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "NewLoginViewController.h"
#import "AppDelegate.h"
#import "StaffViewController.h"
@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize staffnamestr,departmentstr,rolestr,mailidstr,mobilenumberstr,imagestr;
@synthesize mail,chat,call,conference,online,offline;
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
    proview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"profilebg.png"]];
    if( online)
    {
        call.enabled = NO;
        mail.enabled = YES;
        chat.enabled = YES;
        conference.enabled = YES;
    }
    if(offline )
    {
        call.enabled = NO;
        mail.enabled = YES;
        chat.enabled = NO;
        conference.enabled = NO;
    }
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    staffnamelbl.text = staffnamestr;
    departmentlbl.text = departmentstr;
    rolelbl.text = rolestr;
    mailidlbl.text = mailidstr;
    mobilenumberlbl.text = mobilenumberstr;
    UIImage *im = [UIImage imageNamed:imagestr];
    [chatimageview setImage:im];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)gohome
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        StaffViewController *staffview = [[StaffViewController alloc]initWithNibName:@"StaffViewController" bundle:nil];
        [self presentViewController:staffview animated:NO completion:nil];
    }
    else
    {
//        Design_3_Final_ViewController_iPad *homeview = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
//        [self presentViewController:homeview animated:NO completion:nil];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

-(IBAction)mailconnect
{
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail])
    {
        [composer setToRecipients:[NSArray arrayWithObjects:@"sent584@gmail.com", nil]];
        [composer setSubject:@"subject here"];
        [composer setMessageBody:@"message here" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
        }
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (error)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:[NSString stringWithFormat:@"error %@", [error description]] delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(IBAction)facetimecall
{
    //AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
   // if(ap.stafforstudent)
   // {
    NSURL *url = [NSURL URLWithString:@"facetime://sent584@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
  //  NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
   // }
   // else
   // {
    //    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
     //   [[UIApplication sharedApplication] openURL:url];

  //  }
}

-(IBAction)facebabu
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
      [[UIApplication sharedApplication] openURL:url];

}

-(IBAction)profileactionsheet
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        actionSheet =[[UIActionSheet alloc]initWithTitle:@" John Smith" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:nil, nil];
        [actionSheet showFromRect:CGRectMake(954, -10, 50, 75) inView:self.view animated:YES];
        UIButton *btns2 =[[actionSheet subviews]objectAtIndex:1];
        btns2.showsTouchWhenHighlighted = YES;
        [btns2 setBackgroundImage:[UIImage imageNamed:@"action3.png"] forState:UIControlStateNormal];
    }
    else
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
}
-(void)actionSheet:(UIActionSheet *)actionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        if( buttonIndex >=0)
        {
            if (buttonIndex == 0)
            {
                NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
                [self presentViewController:backtologin animated:NO completion:nil];
            }
        }
    }
    else
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
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
