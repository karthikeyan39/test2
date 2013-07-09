//
//  NewTicketViewController.m
//  Proretention1.1
//
//  Created by Admin on 10/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "NewTicketViewController.h"
#import "FMDatabase.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "AppDelegate.h"


@interface NewTicketViewController ()

@end

@implementation NewTicketViewController
@synthesize  submit;
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
//    CGRect web = myweb.frame;
//    web.origin.x = 0;
//    web.origin.y = 50;
//    web.size.width = 600;
//    web.size.height = 800;
//    myweb.frame = web;
    [self.view.superview setBounds:CGRectMake(0, 30, 1000, 800)];
    [myweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9002/Ticket/StudentTicketCreation.aspx"]]];
    
    titletextfield.delegate = self;
    descriptiontextview.delegate = self;
    descriptiontextview.layer.borderWidth = 2;
    descriptiontextview.layer.borderColor = [[UIColor grayColor] CGColor];
    descriptiontextview.layer.cornerRadius = 8;
    NSArray *dbpaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpaths = [dbpaths objectAtIndex:0];
    NSString *dirpaths = [docpaths stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *mydatabases = [FMDatabase databaseWithPath:dirpaths];
    [mydatabases open];
    [mydatabases executeUpdate:@"create table myquerieslist(status varchar,subject varchar,description varchar,firstname varchar,lastname varchar, createdon datetime)"];
    [mydatabases close];
}

-(IBAction)submitticket
{
    if([titletextfield.text isEqualToString: @""])
    {
        UIAlertView *erroralert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Enter Your Query" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [erroralert show];
    }
    else
    {
        AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
        app.submitquery = TRUE;
        NSDate *creadteddate = [NSDate date];
        NSString *firstname = @"Aaron";
        NSString *lastname = @"Archer";
        NSString *status = @"Open";
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docpaths = [paths objectAtIndex:0];
        NSString *dirpaths = [docpaths stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
        FMDatabase *mydatabasess = [FMDatabase databaseWithPath:dirpaths];
        [mydatabasess open];
        [mydatabasess executeUpdate:@"insert into myquerieslist(status, subject, description,firstname,lastname, createdon)values(?,?,?,?,?,?)",status,titletextfield.text,descriptiontextview.text, firstname,lastname,creadteddate];
        FMResultSet *resultticket = [mydatabasess executeQuery:@"select rowid from newticketsf"];
        while ([resultticket next])
        {
            ticketno = [resultticket stringForColumn:@"rowid"];
        }
        
        notificationlabel.text = [NSString stringWithFormat:@"Your ticket has been Submitted. Ticket Number is %@",ticketno];
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveup:) userInfo:nil repeats:NO];
//        
//        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(moveupp:) userInfo:nil repeats:NO];
//        
//        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextview:) userInfo:nil repeats:NO];
        [mydatabasess close];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your Ticket Hsa Been Submitted Successfully" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
//        [alert show];
        MyQueryViewController *myquery = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
        [self presentViewController:myquery animated:NO completion:nil];
        }
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    //[self submitticket];
//    [titletextfield resignFirstResponder];
//    return YES;
//}
//
//- (BOOL)textViewShouldEndEditing:(UITextView *)textView
//{
//    NSLog(@"called");
//    descriptiontextview.returnKeyType = UIReturnKeyDone;
//    [self submitticket];
//    [descriptiontextview resignFirstResponder];
//    return YES;
//}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0)
//    {
//        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
////        if (! [defaults boolForKey:@"notatelabel"])
////        {
//            MyQueryViewController *myquery = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
//            myquery.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//            [self presentViewController:myquery animated:YES completion:nil];
//            [self dismissViewControllerAnimated:YES completion:nil];
//        
//            // [defaults setBool:YES forKey:@"notatelabel"];
//      //  }
//    }
//}

-(IBAction)myquery
{
    MyQueryViewController *myqueryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    //myqueryview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myqueryview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)myfaq
{
    FAQSearchViewController *myfaqview = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
   // myfaqview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myfaqview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)home
{
    Design_3_Final_ViewController_iPad *homeview = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    //homeview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:homeview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)myprofile
{
    MyprofileViewController *myprofileview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
    //myprofileview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myprofileview animated:NO completion:nil];
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

-(IBAction)closeticket
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)moveup:(NSTimer *)t
{
    CGRect frame = notificationlabel.frame;
    frame.origin.x = 350; // new x coordinate
    frame.origin.y = 700; // new y coordinate
    frame.size.width = 500;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1];
    notificationlabel.frame = frame;
    [UIView commitAnimations];
    //lbl.frame = CGRectMake(500, 600, 100, 100);
}


-(void)moveupp:(NSTimer *)t
{
    CGRect frame = notificationlabel.frame;
    frame.origin.x = 350; // new x coordinate
    frame.origin.y = 800; // new y coordinate
    frame.size.width = 500;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1];
    notificationlabel.frame = frame;
    [UIView commitAnimations];
    //lbl.frame = CGRectMake(500, 600, 100, 100);
}

-(void)nextview:(NSTimer *)t
{
    MyQueryViewController *myquery = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    myquery.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myquery animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
