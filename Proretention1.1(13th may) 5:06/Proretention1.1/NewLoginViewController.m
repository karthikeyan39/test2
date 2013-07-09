//
//  NewLoginViewController.m
//  Proretention1.1
//
//  Created by Admin on 16/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "NewLoginViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "StaffViewController.h"
#import "AppDelegate.h"
@interface NewLoginViewController ()

@end

@implementation NewLoginViewController

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
     AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    ap.stafforstudent = FALSE;
    [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"catloginbg.png"]];
   
    
    
    
////    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
////    if (! [defaults boolForKey:@"notFirst3"])
////    {
//    
//        NSURL* url = [[NSBundle mainBundle] URLForResource:@"lanvideo" withExtension:@"mov"];
//        
//        m_players = [[MPMoviePlayerController alloc] initWithContentURL:url];
//        [m_players.backgroundView setBackgroundColor:[UIColor blackColor]];
//        [m_players.view setBackgroundColor:[UIColor blackColor]];
//        [m_players setControlStyle:MPMovieControlStyleNone];
//        [[m_players view] setFrame:[self.view bounds]];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
//        
//        [m_players play];
//        
//        [self.view addSubview:[m_players view]];
//     //   [defaults setBool:YES forKey:@"notFirst3"];
//        
//  //  }
//    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if (! [defaults boolForKey:@"startvideo"])
    {
        //[self performSelector:@selector(delay1) withObject:nil afterDelay:0.4];
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"lanvideo" withExtension:@"mov"];
        
        m_players = [[MPMoviePlayerController alloc] initWithContentURL:url];
        [m_players.backgroundView setBackgroundColor:[UIColor blackColor]];
        [m_players.view setBackgroundColor:[UIColor blackColor]];
        [m_players setControlStyle:MPMovieControlStyleNone];
        [[m_players view] setFrame:[self.view bounds]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
        
        [m_players play];
        
        [self.view addSubview:[m_players view]];
        [defaults setBool:YES forKey:@"startvideo"];
        
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
- (void) moviePlayBackDidFinish:(NSNotification*)_notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [m_players.view removeFromSuperview];
    [m_players stop];
    
    m_players = nil;
}
-(void)keyboardWillShow
{
    NSLog(@"Showing");
    [self.view setFrame:CGRectMake(-130,0,self.view.frame.size.width,self.view.frame.size.height)];
}

-(void)keyboardWillHide {
    [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
}
-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)viewDidUnload
{
    homedesign = nil;
}
-(IBAction)homeview
{
    if ([usernamefield.text isEqualToString:@""] && [passwordfield.text isEqualToString:@""])
    {
        homedesign = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
        [self presentViewController:homedesign animated:NO completion:nil];
    }
    if ([usernamefield.text isEqualToString:@"s"] && [passwordfield.text isEqualToString:@"s"])
    {
        StaffViewController *staffview = [[StaffViewController alloc]initWithNibName:@"StaffViewController" bundle:nil];
        [self presentViewController:staffview animated:NO completion:nil];
    }
   }
@end
