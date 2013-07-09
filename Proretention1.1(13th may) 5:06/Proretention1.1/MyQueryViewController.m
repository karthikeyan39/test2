//
//  MyQueryViewController.m
//  Proretention1.1
//
//  Created by Admin on 26/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "MyQueryViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "MyFAQViewController.h"
#import "FAQSearchViewController.h"
#import "NewTicketViewController.h"
#import "newcustomcell.h"
#import "AppDelegate.h"
#import "NewLoginViewController.h"
#import "WebviewViewController.h"
#import "SupportViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
@interface MyQueryViewController ()

@end

@implementation MyQueryViewController
@synthesize alertbutton, pressbutton;
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
     [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9002/Ticket/studentInbox.aspx"]]];
    popview.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:0.000000000000000138777878078145];
    CGRect pop = popview.frame;
    pop.origin.x = 950;
    pop.origin.y = 1000;
    popview.frame = pop;

    [self updatedesdatabase];
    AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    querytable.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    querytable.layer.borderWidth = 2;
    querytable.layer.cornerRadius = 8;
    ticketssbview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    ticketssbview.layer.borderWidth = 2;
    ticketssbview.layer.cornerRadius = 8;
    notestable.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    notestable.layer.borderWidth = 2;
    notestable.layer.cornerRadius = 8;
    
    if (app.submitquery)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docpaths = [paths objectAtIndex:0];
        NSString *dirpaths = [docpaths stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
        FMDatabase *mydatabasess = [FMDatabase databaseWithPath:dirpaths];
        [mydatabasess open];
        FMResultSet *resultticket = [mydatabasess executeQuery:@"select rowid from myquerieslist"];
        while ([resultticket next])
        {
            ticketnumber = [resultticket stringForColumn:@"rowid"];
        }
         notificationlabel.text = [NSString stringWithFormat:@"Ticket number %@ has been Submitted Successfully",ticketnumber];
        notificationlabel.hidden = NO;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveup:) userInfo:nil repeats:NO];
        
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(moveupp:) userInfo:nil repeats:NO];
        app.submitquery = FALSE;
    }

    format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];

    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil
                                    repeats:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    querytable.dataSource = self;
    querytable.delegate = self;
    notestable.dataSource = self;
    notestable.delegate = self;
    
    addingticketview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    addingticketview.layer.borderWidth = 2;
    addingticketview.layer.cornerRadius = 8;
    
    addingnotestextfield.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    addingnotestextfield.layer.borderWidth = 2;
    addingnotestextfield.layer.cornerRadius = 8;
   menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newmainbgs.png"]];
    queryview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
}
-(void)delay1
{
    createlog.hidden = NO;
}
-(void)targetMethod:(NSTimer *)t
{
//    [UIView animateWithDuration:0.1
//                          delay:0.1
//                        options: UIViewAnimationCurveEaseIn
//                     animations:^{
//                         bg.frame = CGRectMake(0, 132, 1024, 535);
//                     }
//                     completion:^(BOOL finished){
//                     }];
//    [self.view addSubview:bg];
}

-(void)viewWillAppear:(BOOL)animated
{
    fullarray = [[NSMutableArray alloc]init];
    notesarray = [[NSMutableArray alloc]init];
    dateformatdate = [[NSDateFormatter alloc]init];
    dateformattime = [[NSDateFormatter alloc]init];
    [dateformatdate setDateFormat:@"dd/MM/yyyy HH:ss:mm"];
    [dateformattime setDateFormat:@"HH:ss:mm"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [paths objectAtIndex:0];
    NSString *dirpath = [docpath stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *ticketdb = [FMDatabase databaseWithPath:dirpath];
    [ticketdb open];
    FMResultSet *tickets = [ticketdb executeQuery:@"select rowid,status,subject,description,firstname,lastname,createdon from myquerieslist order by rowid desc"];
    while ([tickets next])
    {
        firstnamestr = [tickets stringForColumn:@"firstname"];
        lastnamestr = [tickets stringForColumn:@"lastname"];
        statusstr = [tickets stringForColumn:@"status"];
        subjectstr = [tickets stringForColumn:@"subject"];
        ticketnumberstr = [tickets stringForColumn:@"rowid"];
        datesring = [tickets dateForColumn:@"createdon"];
        desstr = [tickets stringForColumn:@"description"];
        NSDate *created = [dateformatdate stringFromDate:datesring];
        NSDate *timeformat = [dateformattime stringFromDate:datesring];
        
        NSString *fullstring = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@,%@",ticketnumberstr,firstnamestr,lastnamestr,created,timeformat,subjectstr,statusstr,desstr];
        [fullarray addObject:fullstring];
    }
    [ticketdb close];
   
    NSLog(@"***********%@",fullarray);
}
-(IBAction)homebutton
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

-(IBAction)myfaq
{
//    MyFAQViewController *myfaqview = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
//    //myfaqview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:myfaqview animated:NO completion:nil];
//   // [self dismissViewControllerAnimated:YES completion:nil];
    FAQSearchViewController *fa = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
    [self presentViewController:fa animated:NO completion:nil];
}
-(IBAction)creatlog
{
    NewTicketViewController *newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
    //newticket.modalPresentationStyle = UIModalPresentationFormSheet;
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self hidemenu];
    [self presentViewController:newticket animated:NO completion:nil];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == querytable)
    {
        return  1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == querytable)
    {
        //return [[fullarray objectAtIndex:section] count];
        return [fullarray count];
    }
    if (tableView == notestable)
    {
        return [notesarray count];
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == querytable)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
    newcustomcell *cellnews = (newcustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cellnews == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"customcellquery" owner:self options:nil];
        cellnews = [nib objectAtIndex:0];
    }
        if ([indexPath row] % 2)
        {
            cellnews.contentView.backgroundColor = [UIColor colorWithRed:181.0/255 green:221.0/255 blue:234.0/255 alpha:1];
        }
        else
        {
            cellnews.contentView.backgroundColor = [UIColor colorWithRed:234.0/255 green:209.0/255 blue:166.0/255 alpha:1];
        }
    cellnews.selectionStyle = UITableViewCellSelectionStyleGray;
    NSString *resting = [fullarray objectAtIndex:indexPath.row];
    NSArray *rearray = [resting componentsSeparatedByString:@","];
        //NSLog(@"^^^^^^ %@", [rearray objectAtIndex:7]);
    cellnews.ticketlabel.text = [rearray objectAtIndex:0];
    cellnews.namelabel.text = [NSString stringWithFormat:@"%@ " " %@",[rearray objectAtIndex:1],[rearray objectAtIndex:2]];
    cellnews.datelabel.text = [rearray objectAtIndex:3];
    cellnews.timelabel.text = [rearray objectAtIndex:4];
    cellnews.subjectlabel.text = [rearray objectAtIndex:5];
    cellnews.statuslabel.text = [rearray objectAtIndex:6];
    cellnews.descriptionlabel.text = [rearray objectAtIndex:7];
    return cellnews;
    }
    if (tableView == notestable)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        if ([indexPath row] % 2)
        {
            cell.contentView.backgroundColor = [UIColor colorWithRed:181.0/255 green:221.0/255 blue:234.0/255 alpha:1];
            cell.backgroundColor = [UIColor colorWithRed:181.0/255 green:221.0/255 blue:234.0/255 alpha:1];
        }
        else
        {
            cell.contentView.backgroundColor = [UIColor colorWithRed:191.0/255 green:169.0/255 blue:191.0/255 alpha:1];
            cell.backgroundColor = [UIColor colorWithRed:191.0/255 green:169.0/255 blue:191.0/255 alpha:1];
        }
        NSString *str = [notesarray objectAtIndex:indexPath.row];
        NSArray *arr = [str componentsSeparatedByString:@","];
        //cell.backgroundColor = [UIColor colorWithRed:181.0/255 green:221.0/255 blue:234.0/255 alpha:1];
        cell.textLabel.text = [arr objectAtIndex:0];
        cell.detailTextLabel.text = [arr objectAtIndex:1];
        return cell;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == querytable)
    {
         return 130;
    }
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [notesarray removeAllObjects];
    addbutton.enabled = YES;
    NSString *fieldstring = [fullarray objectAtIndex:indexPath.row];
    NSArray *ticketarr = [fieldstring componentsSeparatedByString:@","];
    numberticket = [ticketarr objectAtIndex:0];
    
    NSArray *dbpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentpath = [dbpath objectAtIndex:0];
    NSString *directorypath = [documentpath stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *notedb = [FMDatabase databaseWithPath:directorypath];
    [notedb open];
    
    FMResultSet *noteresult = [notedb executeQuery:@"select * from descriptionupdates where ticketid = ?",numberticket ];
    while ([noteresult next])
    {
        notestr = [noteresult stringForColumn:@"notedescription"];
        adddate = [noteresult dateForColumn:@"addeddate"];
        NSDate *addeddate = [format stringFromDate:adddate];
        NSString *fullstr = [NSString stringWithFormat:@"%@,%@",notestr,addeddate];
        [notesarray addObject:fullstr];
        NSLog(@"%@",addeddate);
    }
    [notedb close];
    [notestable reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)updatedesdatabase
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [path objectAtIndex:0];
    NSString *dirpath = [docpath stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *destable = [FMDatabase databaseWithPath:dirpath];
    [destable open];
    [destable executeUpdate:@"create table descriptionupdates (ticketid integer,notedescription vachar,addeddate datetime)"];
    [destable close];
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(-200,0,self.view.frame.size.width,self.view.frame.size.height)];     
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(20,0,self.view.frame.size.width,self.view.frame.size.height)];
}

-(IBAction)addnotes
{
    addingticketview.hidden = NO;
}
-(IBAction)closenotes
{
    addingticketview.hidden = YES;
}
-(IBAction)notesubmit
{
    addingticketview.hidden = YES;
    [addingnotestextfield resignFirstResponder];
    [notesarray removeAllObjects];
    
    NSDate *update = [NSDate date];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [path objectAtIndex:0];
    NSString *dirpath = [docpath stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *insertdescription = [FMDatabase databaseWithPath:dirpath];
    [insertdescription open];
    [insertdescription executeUpdate:@"insert into descriptionupdates (ticketid,notedescription,addeddate) values(?,?,?)",numberticket, addingnotestextfield.text,update];
    NSLog(@"%@",dirpath);
    [insertdescription close];
    
    NSArray *dbpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentpath = [dbpath objectAtIndex:0];
    NSString *directorypath = [documentpath stringByAppendingPathComponent:@"myqueriesdb.sqlite"];
    FMDatabase *notedb = [FMDatabase databaseWithPath:directorypath];
    [notedb open];

    FMResultSet *noteresult = [notedb executeQuery:@"select * from descriptionupdates where ticketid = ?",numberticket ];
    while ([noteresult next])
    {
        notestr = [noteresult stringForColumn:@"notedescription"];
        adddate = [noteresult dateForColumn:@"addeddate"];
        NSDate *addeddate = [format stringFromDate:adddate];
        
        NSString *fullstr = [NSString stringWithFormat:@"%@,%@",notestr,addeddate];
        [notesarray addObject:fullstr];
    }
    [notedb close];
    [notestable reloadData];
    
}
-(void)moveup:(NSTimer *)t
{
    NSLog(@"Moving Up");
    CGRect frame = popview.frame;
    frame.origin.x = 700; // new x coordinate
    frame.origin.y = 400; // new y coordinate
  //  frame.size.width = 550;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1];
    popview.frame = frame;
    [UIView commitAnimations];
    //lbl.frame = CGRectMake(500, 600, 100, 100);
}
-(void)moveupp:(NSTimer *)t
{
    NSLog(@"Moving Down");
    CGRect frame = popview.frame;
    frame.origin.x = 950; // new x coordinate
    frame.origin.y = 800; // new y coordinate
    //frame.size.width = 550;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1];
    popview.frame = frame;
    [UIView commitAnimations];
    //lbl.frame = CGRectMake(500, 600, 100, 100);
}
-(IBAction)showmainmenu
{
    if(queryview.frame.origin.x == 0)
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
                         [queryview setFrame:CGRectMake(menuscrollview.frame.size.width, queryview.frame.origin.y, queryview.frame.size.width, queryview.frame.size.height)];
                     }];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [queryview setFrame:CGRectMake(0, queryview.frame.origin.y, queryview.frame.size.width, queryview.frame.size.height)];
                     }];
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
@end
