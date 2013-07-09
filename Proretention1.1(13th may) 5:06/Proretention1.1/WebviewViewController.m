//
//  WebviewViewController.m
//  Proretention1.1
//
//  Created by Admin on 23/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "WebviewViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "MyFAQViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "SupportViewController.h"
#import "NewLoginViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
@interface WebviewViewController ()

@end

@implementation WebviewViewController
@synthesize alertbutton, pressbutton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    tutortextview.layer.borderWidth = 2;
    tutortextview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    tutortextview.layer.cornerRadius =8;
    tutortextview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textbg.png"]];
    backbtn.enabled = NO;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [myweb reload];
}
-(IBAction)closewebview
{
    Design_3_Final_ViewController_iPad *home =[[Design_3_Final_ViewController_iPad alloc] initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    [self presentViewController:home animated:NO completion:nil];
}
-(IBAction)closelearningview
{
    Design_3_Final_ViewController_iPad *home =[[Design_3_Final_ViewController_iPad alloc] initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    [self presentViewController:home animated:NO completion:nil];
}
-(IBAction)gotolearningview
{
    parentwebview.hidden = YES;
    learningview.hidden = NO;
    [myweb reload];
    uniimage.hidden = NO;
    otherimg.hidden = NO;
    other.hidden = NO;
    unilearning.hidden = NO;
}
-(IBAction)universitylearningcenter
{
    backbtn.enabled = YES;
    parentwebview.hidden = NO;
   [myweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://buzzedu.com/moodle/course/index.php"]]];
    uniimage.hidden = YES;
    otherimg.hidden = YES;
    other.hidden = YES;
    unilearning.hidden = YES;
  //  [myweb reload];
}

-(IBAction)otherlearningcenter
{
    backbtn.enabled = YES;
     parentwebview.hidden = NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"listing" ofType:@"html" inDirectory:@"otherlearn"]];
    [myweb loadRequest:[NSURLRequest requestWithURL:url]];
    uniimage.hidden = YES;
    otherimg.hidden = YES;
    other.hidden = YES;
    unilearning.hidden = YES;
   // [myweb reload];
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
   // NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
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
-(IBAction)showmainmenu
{
    if(learningview.frame.origin.x == 0)
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
    [UIView animateWithDuration:0.25 animations:^{[learningview setFrame:CGRectMake(menuscrollview.frame.size.width, learningview.frame.origin.y, learningview.frame.size.width, learningview.frame.size.height)];}];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25 animations:^{[learningview setFrame:CGRectMake(0, learningview.frame.origin.y, learningview.frame.size.width, learningview.frame.size.height)];}];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
-(IBAction)virtualtutor
{
    backbtn.enabled = YES;
//    uniimage.image = [UIImage imageNamed:@"tutor.png"];
//    unilearning.enabled = NO;
//    tutorbtn.hidden = NO;
//    tutortextview.hidden = NO;
//     //tutortextview.textAlignment = NSTextAlignmentJustified;
//    tutortextview.text = @"                                                                                                                                            Virtual Tutor offers a new in-class pedagogy where teachers and students are networked in classrooms (conventional or online) and off-it. Real-time collaboration and feedback is the backbone of Virtual Tutor.Virtual Tutor provides a conduit to the breadth and width of open content including YouTube for Education, Wikipedia, Open Courseware and Gooru (a learning search engine).The content, with all its multimedia richness, is available on the cloud at home for students to preview and revise. Real-time, powerful student analytics from in-class quizzes and assignments, add the final dimension of power to the Virtual Tutor, enabling the teacher to spot slow-learners ahead of time.";
    parentwebview.hidden = NO;
   [myweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://harness.cloudapp.net/workbook.aspx"]]];
}
-(IBAction)closetextview
{
    unilearning.enabled = YES;
    uniimage.image = [UIImage imageNamed:@"unilearning.png"];
    tutorbtn.hidden = YES;
    tutortextview.hidden = YES;
}
@end
