//
//  SupportViewController.m
//  Proretention1.1
//
//  Created by Admin on 23/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "SupportViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "NewLoginViewController.h"
#import "MyFAQViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "WebviewViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
#import "newscustomcell.h"
#import "ChatViewController.h"
@interface SupportViewController ()

@end

@implementation SupportViewController
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
    [fromvalue setTitle:@"Administrative Support" forState:UIControlStateNormal];
      [tovalue setTitle:@"Academic Support" forState:UIControlStateNormal];
      [recentvalue setTitle:@"Recently Contacted" forState:UIControlStateNormal];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
//    callbtn.layer.borderWidth = 2;
//    callbtn.layer.cornerRadius = 20;
//    callbtn.layer.borderColor = [[UIColor blackColor] CGColor];
//    chatbtn.layer.borderWidth = 2;
//    chatbtn.layer.cornerRadius = 12;
//    chatbtn.layer.borderColor = [[UIColor blackColor] CGColor];
//    facebtn.layer.borderWidth = 2;
//    facebtn.layer.cornerRadius = 12;
//    facebtn.layer.borderColor = [[UIColor blackColor] CGColor];
    menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    
    admintable.dataSource = self;
    admintable.delegate = self;
    
    academictable.dataSource = self;
    academictable.delegate = self;

    recentable.dataSource = self;
    recentable.delegate = self;

    adminnamearray = [NSMutableArray arrayWithObjects:@"Ms Carla Ben",@"Mr Johnson Green",@"Ms Zara White",@"Mr Kevin Gabon", @"Mr Higgin James",@"Ms Nicola Boisete", nil];
    adminchatimagearray = [NSMutableArray arrayWithObjects:@"l1.jpg",@"pr1.jpg",@"l2.jpg",@"pr2.jpg",@"pr3.jpg",@"l3.jpg", nil];
    adminstatusarry = [NSMutableArray arrayWithObjects:@"green.png",@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png",nil];
    adminrolearray = [NSMutableArray arrayWithObjects:@"Department Coordinator",@"Program Administrator",@"Program Administrator",@"Program Administrator",@"Head of Department Administration",@"Program Manager", nil];
    adminemailarray = [NSMutableArray arrayWithObjects:@"Carla.ben@cl.ac.uk",@"Johnson.green@cl.ac.uk", @"Zara.white@cl.ac.uk",@"Kevin.gabon@cl.ac.uk",@"Higgin.james@cl.ac.uk",@"Nicola.boisete@cl.ac.uk", nil];
    adminphone = [NSMutableArray arrayWithObjects:@"020-7010-4516",@"020-7010-5145",@"020-7010-4245",@"020-7010-3245",@"020-7010-2124",@"020-7010-1235", nil];
    
    academicnamearray  = [NSMutableArray arrayWithObjects:@"Dr Franklin Lon",@"Professor Maria",@"Dr Walker Gibbs",@"Dr Richard Coles",@"Martin Archer", nil];
    academicchatimagearray = [NSMutableArray arrayWithObjects:@"pr4.jpg",@"pr5.jpg",@"pr6.jpg", @"pr7.jpg",@"pr8.jpg", nil];
    academicstatusarray = [NSMutableArray arrayWithObjects:@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png", nil];
    
    
    recentlynamearray  = [NSMutableArray arrayWithObjects:@"Ms Nicola Boisete",@"Dr Franklin Lon", nil];
    recentlychatimagearray = [NSMutableArray arrayWithObjects:@"l1.jpg",@"pr4.jpg", nil];
    recentstatusarry = [NSMutableArray arrayWithObjects:@"green.png", @"redround.png", nil];
    recentlyemailarray = [NSMutableArray arrayWithObjects:@"Nicola.boisete@cl.ac.uk",@"Franklin.lon@cl.ac.uk", nil];
    recentlyrolearray = [NSMutableArray arrayWithObjects:@"Program Manager",@"Professor & Department Head", nil];
     recentphone = [NSMutableArray arrayWithObjects:@"020-7010-1235", @"020-7010-7250",nil];
//    adminfull = [[NSMutableArray alloc] init];
//    [adminfull addObjectsFromArray:adminnamearray];
//      [adminfull addObjectsFromArray:adminchatimagearray];
//      [adminfull addObjectsFromArray:adminstatusarry];
//    
//    academicfull = [[NSMutableArray alloc] init];
//    [academicfull addObjectsFromArray:academicnamearray];
//    [academicfull addObjectsFromArray:academicchatimagearray];
//    [academicfull addObjectsFromArray:academicstatusarray];
    
  
    admin = NO;
   academic = NO;
    recent = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)back
{
    Design_3_Final_ViewController_iPad *home = [[Design_3_Final_ViewController_iPad alloc] initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    [self presentViewController:home animated:NO completion:nil];
}
-(IBAction)facetime
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
}
-(IBAction)showmainmenu
{
    if(parentview.frame.origin.x == 0)
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
    [UIView animateWithDuration:0.25 animations:^{[parentview setFrame:CGRectMake(menuscrollview.frame.size.width, parentview.frame.origin.y, parentview.frame.size.width, parentview.frame.size.height)];}];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25 animations:^{[parentview setFrame:CGRectMake(0, parentview.frame.origin.y, parentview.frame.size.width, parentview.frame.size.height)];}];
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
 //   NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
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
    ///newticket.modalPresentationStyle = UIModalPresentationFormSheet;
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self hidemenu];
    [self presentViewController:newticket animated:YES completion:nil];
}
-(IBAction)learningcenter
{
    WebviewViewController *webview = [[WebviewViewController alloc]initWithNibName:@"WebviewViewController" bundle:nil];
    [self presentViewController:webview animated:NO completion:nil];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( tableView == admintable)
    {
    
            return [adminnamearray count];
                        return [adminchatimagearray count];
                        return [adminstatusarry count];
    }
    
    if( tableView== academictable)
    {
                  // return [academicfull count];
            return [academicnamearray count];
            return [academicchatimagearray count];
            return [academicstatusarray count];
    }
    
    if( tableView== recentable)
    {
     // return [academicfull count];
            return [recentlynamearray count];
            return [recentlychatimagearray count];
            return [recentstatusarry count];
    }

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( tableView==  admintable)
    {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    newscustomcell *celladmin = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (celladmin == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"mycontactstable" owner:self options:nil];
        celladmin = [nib objectAtIndex:0];
    }
        
        //   celladmin.textLabel.text = [adminfull objectAtIndex:indexPath.row];
            
            celladmin.chatimage.image = [UIImage imageNamed:[adminchatimagearray objectAtIndex:indexPath.row]];
            celladmin.namelbl.text = [adminnamearray objectAtIndex:indexPath.row];
           celladmin.chaticon.image = [UIImage imageNamed:[adminstatusarry objectAtIndex:indexPath.row]];    return celladmin;
    }
    
    if(tableView== academictable)
    {
        static NSString *simpleTableIdentifier1 = @"SimpleTableCell1";
        newscustomcell *cellaca = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier1];
        if (cellaca == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"mycontactstable" owner:self options:nil];
            cellaca = [nib objectAtIndex:0];
        }
     
            //cellaca.textLabel.text = [academicfull objectAtIndex:indexPath.row];
            cellaca.chatimage.image = [UIImage imageNamed:[academicchatimagearray objectAtIndex:indexPath.row]];
            cellaca.namelbl.text = [academicnamearray objectAtIndex:indexPath.row];
            cellaca.chaticon.image = [UIImage imageNamed:[academicstatusarray objectAtIndex:indexPath.row]];

            
       
        return cellaca;
    }
    
    if(tableView== recentable)
    {
        static NSString *simpleTableIdentifier2 = @"SimpleTableCell2";
        newscustomcell *cellrecent = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier2];
        if (cellrecent == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"mycontactstable" owner:self options:nil];
            cellrecent = [nib objectAtIndex:0];
        }
      
            //cellaca.textLabel.text = [academicfull objectAtIndex:indexPath.row];
            cellrecent.chatimage.image = [UIImage imageNamed:[recentlychatimagearray objectAtIndex:indexPath.row]];
        
            cellrecent.namelbl.text = [recentlynamearray objectAtIndex:indexPath.row];
            cellrecent.chaticon.image = [UIImage imageNamed:[recentstatusarry objectAtIndex:indexPath.row]];
            
        return cellrecent;
    }

    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == admintable)
    {
        newscustomcell *ad = (newscustomcell *)[admintable cellForRowAtIndexPath:indexPath];
         [fromvalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        // admintable.hidden = YES;
      //  [admintable reloadData];
    }
    if(tableView == academictable)
    {
       newscustomcell *ad = (newscustomcell *)[academictable cellForRowAtIndexPath:indexPath];
       [tovalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        admintable.hidden = YES;
    }
    if(tableView == recentable)
    {
        newscustomcell *ad = (newscustomcell *)[admintable cellForRowAtIndexPath:indexPath];
        [recentvalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        admintable.hidden = YES;
        academictable.hidden = YES;
    }
    if (tableView == admintable)
    {
        if (!admin)
        {
            if (indexPath.row == 0)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 1)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = YES;
                chatbtn.enabled = YES;
                [facebtn setBackgroundImage:[UIImage imageNamed:@"conference.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 2)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 3)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 4)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 5)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
        }
    }
    if (tableView == academictable)
    {
        if (!academic)
        {
            if (indexPath.row == 0)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 1)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 2)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 3)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 4)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
        }
    }
    if (tableView == recentable)
    {
        if (!recent)
        {
            if (indexPath.row == 0)
            {
                emailbutton.enabled = YES;
                callbtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 1)
            {
                emailbutton.enabled = YES;
                callbtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }

        }
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == admintable)
    {
            return 60;
    }
    if(tableView == academictable)
    {
        return 60;
    }
    if(tableView == recentable)
    {
        return 60;
    }
    
    return 0;
}
-(IBAction)emailaction
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
-(IBAction)adminselect
{
    admintable.hidden = NO;
    academictable.hidden = YES;
    recentable.hidden = YES;


}
-(IBAction)academicselect
{
      admintable.hidden = YES;
    academictable.hidden = NO;
      recentable.hidden = YES;
}
-(IBAction)recentselect
{
    academictable.hidden = YES;
admintable.hidden = YES;
    recentable.hidden = NO;
}
-(IBAction)conference
{
    NSURL *url = [NSURL URLWithString:@"facetime://sent584@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
}
@end
