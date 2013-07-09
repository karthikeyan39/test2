//
//  MyFAQViewController.m
//  sendfiles
//
//  Created by Vril Mac on 5/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MyFAQViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "FAQSearchViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "NewLoginViewController.h"
#import "WebviewViewController.h"
#import "SupportViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
@interface MyFAQViewController ()

@end

@implementation MyFAQViewController

@synthesize catques ;
@synthesize categories;
@synthesize faqanswerview,parentview,showans;

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
    CGRect maincat = categories.frame;
    maincat.origin.x = -700;
    maincat.origin.y = catques.frame.origin.y;
    categories.frame = maincat;
  //   firstview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]];
    //partextview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]];
    [myfaqimageview setImage:[UIImage imageNamed:@"newbg.png"]];
    [myfaqbutton setImage:[UIImage imageNamed:@"newfaq1.png"] forState:UIControlStateNormal];
    categories.delegate = self;
    categories.dataSource = self;
    
    catques.delegate = self;
    catques.dataSource = self;
    
    [firstview addSubview:animation];
    [firstview addSubview:faq];
    animation.animationImages = [NSArray arrayWithObjects:
                                 
                                 [UIImage imageNamed:@"c1.png"],
                                 
                                 [UIImage imageNamed:@"c2.png"],[UIImage imageNamed:@"c3.png"],[UIImage imageNamed:@"c4.png"],[UIImage imageNamed:@"c5.png"],[UIImage imageNamed:@"c6.png"],[UIImage imageNamed:@"c7.png"],[UIImage imageNamed:@"c8.png"],[UIImage imageNamed:@"c9.png"],[UIImage imageNamed:@"c10.png"],nil];
    
    
    
    [animation setAnimationRepeatCount:0];
    
    animation.animationDuration = 2;
    
    [animation startAnimating];

    categoreislist = [[NSMutableArray alloc] initWithObjects:@"DLS (Distance Learning Support) registration form",@"DLS (Distance Learning Support) ",@"ID check & Student card issue",@"Sconul Access Request Form",@"Ceremonies",@"Alumini",@"Certificates",@"Diploma Supplement",@"ILL (Inter Library Loans)", nil];
    
    DLSregform = [ NSMutableArray arrayWithObjects:@"Where can l find a copy of the Distance Learning Services Unit registration form?",@"I need to register with the DLSU Distance Learning Support Unit.",@"I need to request materials from Learning Resources and have them sent to me as I am a Distant Learner.", nil];
    
    DLSsupport = [[NSMutableArray alloc]initWithObjects:@"How do I find out about the services available to Distance Learners ?",@"What is Distance Learning Support and who can use it?",nil];
    
    idcheck = [NSMutableArray arrayWithObject:@"I am a Distance Learner but need to come onto campus every now and then, I need to know how to obtain a student card."];
    
    sconul = [NSMutableArray arrayWithObject:@"I need a SCONUL Card to access other Universities' Resources near to where I live."];
    
    ceremonies = [NSMutableArray arrayWithObjects:@"When are the Graduation Ceremonies?",@"Can mine and my friends parents sit together at the graduation ceremony?",@"I have a red VIP ticket...Is there parking available for the ceremonies?",@"I forgot to tell you my guest has a disability and it is the week of the ceremonies.  Can you still provide relevant seating for them?",@"Do you provide parking on campus? I/my guest is disabled but does not hold a blue badge, do you have parking for them?",@"I need disabled parking but haven't pre-booked - can I do it the week of the ceremonies?",@"Do you have a map of the Hendon area?",@"How far is the Hendon Campus from Hendon Central station?",@"Can you suggest any hotels in the local area?",@"How do I get to the university from the train station/airport/etc.",@"How long does it take to get to the campus?",@"Do you provide transport from Hendon Central?",@"Can I attend my ceremony if I have a resit/deferral?",@"Are there any cafes/restaurants/pubs in the local area?",@"Are there any special arrangements for children?",@"What is the university address?",@"Is there a cashpoint on campus",@"Do children have to pay for guest tickets? Are they allowed to attend ceremonies?",@"What is the price of a child's ticket?",@"Is there anywhere for guests with children to watch the ceremonies?",@"I have deferred or failed a module.  Can I still attend?",@"Can I attend the ceremonies if I have a debt to the university?",@"I have been accused of academic misconduct.  Can I attend the ceremony?",@"I have just cleared my debt - can I still attend a ceremony?",@"I haven't booked a gown - can I do this on the day?  Will they be available?  How much will they cost?",@"I haven't booked photography - can I do this on the day?  How much will it cost?",@"I need more guest tickets - are these available?",@"I study at a partner college - can I attend a graduation ceremony?",@"Is there disabled toilet access on campus? Where are the other toilets?",@"Do I receive a programme at the ceremonies? I've won a prize- how do I collect it?",@"Is there a reception after the ceremony? What time do I have to be at the ceremony and what do I do when I arrive?",@"Where will my guests sit? Where will I sit?",@"Can I video/photograph the ceremony?",@"Can I buy a DVD of my ceremony?  ",@"Either I or my guest has a disability.  Do I have to let you know?",@"Can I sit next to my friend?",@"All my friends have received an email about the graduation ceremonies and I haven't - why?",@"I can't book in for graduation ceremonies on-line.  Why?",@"I can't attend the graduation ceremony I have been assigned to?  Can I go to a different one?",@"I don't need any guest tickets for graduation- do I still need to register?",@"When is the deadline to book into Graduation ceremonies? I haven't booked into a graduation ceremony by the deadline - what can I do now?",@"I can't find my programme/what I am studying on the Graduation Ceremony Dates and Times list. When is my graduation ceremony?",@"Where are the graduation ceremonies held?",@"I am going to Summer School? Can I attend the graduation ceremonies?",@"I study at the Dubai/Mauritius campus.  Can I attend the UK graduation ceremony?",@"I am in London but want to attend a graduation ceremony in Dubai/Mauritius - is this possible?",@"I've changed my name - what do I need to do if I am graduating?",@"Is there a dress code for graduation ceremonies?",@"Can I see someone in person to speak to about graduation?",@"How do you make a payment for tickets?_x000D_I can't make payment by credit/debit card for my guest tickets for graduation.",@"Why do you charge for guest tickets for graduation ceremonies and what is the price for children's tickets?",@"Why do you charge for guest tickets for graduation ceremonies and what is the price for children's tickets?",@"I am graduating, do I need a ticket for the graduation ceremony? Where do I collect my tickets?",@"What do I do if I have more guests and graduation tickets are not available? Can I bring guests if they don't have a ticket?",@"I/my guest can no longer attend the graduation ceremony.  Can I get a refund on my guest tickets?",@"I or my guest needs a letter for a visa to attend my graduation.  Can you provide one for me? Do you need my guests name for a visa?",@"What documents do I need for my visa for my graduation?",@"How much does it cost to order a graduation gown? How do I order the gown?",@"Do I have to wear a gown? What type of gown will I need to wear?",@"Do I have to wear a gown? What type of gown will I need to wear?",@"I've lost my reference number for my gown.  Will I still be able to collect it?",@"I can no longer attend my ceremony.  Can I get a refund on my gown?",@"How do I fix the hood to my gown? Do I have to wear a hat/mortar board?",@"How do I book photography? Can I just have photographs taken and not attend the ceremony?",@"Do I have to use your photographers?  How much do photos cost?_x000D_Can I take my own photos?",@"I can no longer attend my ceremony.  Can I get a refund on the photography I have paid for?",@"Can I have my photograph taken with the honorary graduate?",@"What happens during the ceremony? Can I bring food or drink into the ceremony?",@"What do I do if I can't shake hands with the Dean of the School?", nil];

    certificates = [NSMutableArray arrayWithObjects:@"When and where do I get my certificate?",@"I have been expelled.  Am I still entitled to a transcript and certificate?",@"How can I get a transcript?_x000D__x000D_How can I get a Diploma Supplement?",@"I have completed my programme, but the University has not sent my certificate",@"I would like my certificate to be sent to a different address",@"How do I apply for a replacement certificate?",@"When will I receive my certificate?",@"Can I change my name on the certificate?",@"I am an exchange student and require a transcript of the modules completed at Middlesex University.",@"I need a letter to confirm my qualification",@"Can I change my name on the certificate?",@"Is there a charge for a replacement certificate?",@"The University has posted my certificate but I have not received it, what can I do?",@"I have not received my certificate, what is the tracking number?",@"I have been expelled from the University.  Am I entitled to a certificate or transcript / diploma supplement?",@"I would like my certificate to be sent to a different address",@"When can l expect to receive my certificate from Middlesex?", nil];
    
    alumini = [NSMutableArray arrayWithObject:@"I have just graduated and want to register as Alumni"];
    
    diploma = [NSMutableArray arrayWithObject:@"How can I get a Diploma Supplement (transcript)?"];
    
    ills = [NSMutableArray arrayWithObjects:@"Is there a charge for Inter Library loan requests?",@"How can l request books and articles that are not in the Middlesex Collection?",@"How can l request a book from another institution",@"Why do I have to pay for my journal article?",@"How do I get an Inter-Library Loan?",@"I have logged into myUniHub and clicked on the link in myLibrary portlet but when I do my search, the journal article could not be found.", nil];
    categories.layer.borderWidth = 2;
    categories.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    categories.layer.cornerRadius = 8;
    
    catques.layer.borderWidth = 2;
    catques.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    catques.layer.cornerRadius = 8;
    
    showans.layer.borderWidth = 2;
    showans.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    showans.layer.cornerRadius = 8;
   check = 1;
    menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newmainbgs.png"]];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
}

-(IBAction)homeaction
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
-(IBAction)myquery
{
    MyQueryViewController *myqueryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    //myqueryview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myqueryview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)backtofaq
{
    FAQSearchViewController *myfaq = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
    //myfaq.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:myfaq animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
// Method to replace a given subview with another using a specified transition type, direction, and duration
-(void)replaceSubview:(UIView *)oldView withSubview:(UIView *)newView transition:(NSString *)transition direction:(NSString *)direction duration:(NSTimeInterval)duration
{
    // Set up the animation
    animations = [CATransition animation];
    // Set the type and if appropriate direction of the transition, 
    if (transition == kCATransitionFade)
    {
        [animations setType:kCATransitionFade];
    }
    else
    {
        [animations setType:transition];
        [animations setSubtype:direction];
    }
    // Set the duration and timing function of the transtion -- duration is passed in as a parameter, use ease in/ease out as the timing function
    [animations setDuration:duration];
    [animations setTimingFunction:[CAMediaTimingFunction   functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[oldView layer] addAnimation:animations forKey:@"transitionViewAnimation"];
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


- (void)filterListForSearchText:(NSString *)searchText
{
    [filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
    
    for (NSString *title in container) {
        NSRange nameRange = [title rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if (nameRange.location != NSNotFound) {
            [filteredList addObject:title];
        }
    }
}



- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    //When the user taps the search bar, this means that the controller will begin searching.
    isSearching = YES;
    searchstart = TRUE;
   // showans.hidden = YES;
    self.searchDisplayController.searchBar.showsCancelButton = YES;
    
    UIButton *cancelButton = nil;
    
    for (UIView *subView in self.searchDisplayController.searchBar.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UIButton")]) {
            
            cancelButton = (UIButton*)subView;
            
        }
        
    }
    
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    //When the user taps the Cancel Button, or anywhere aside from the view.
  //  isSearching = NO;
    //searchstart = FALSE;
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterListForSearchText:searchString]; // The method we made in step 7
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterListForSearchText:[self.searchDisplayController.searchBar text]]; // The method we made in step 7
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if(tableView == categories)
    {
    return [categoreislist count];
    }
    
    if(tableView == catques)
    {
        if( dlsreg)
        {
            return [DLSregform count];
        }
    }
    if(tableView == catques)
    {
        if( dlssup)
        {
            return [ DLSsupport count];
        }
    
    }
    if(tableView == catques)
    {
        if( cere)
        {
            return [ ceremonies count];
        }
        
    }
    if(tableView == catques)
    {
        if( cert)
        {
            return [ certificates count];
        }
        
    }
    
    if(tableView == catques)
    {
        if( inter)
        {
            return [ ills count];
        }
        
    }
//    if (isSearching)
//    {
//        //If the user is searching, use the list in our filteredList array.
//        return [filteredList count];
//    }
//    else
//    {
//        return [container count];
//    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
   if( tableView == categories)
    {
       
        static NSString *CellIdentifiercategories = @"Cell";
    
        UITableViewCell *categorycell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiercategories];
    
        if (categorycell == nil)
        {
            categorycell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifiercategories];
        }
        
        UISwipeGestureRecognizer *gestureR = [[UISwipeGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(handleSwipeFrom:)];
        [gestureR setDirection:UISwipeGestureRecognizerDirectionLeft];//|UISwipeGestureRecognizerDirectionRight)];
                categorycell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [categorycell addGestureRecognizer:gestureR];
        categorycell.textLabel.font = [UIFont fontWithName:@"Arial" size:16];
        [ categorycell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
        categorycell.textLabel.text = [categoreislist objectAtIndex:indexPath.row];
        categorycell.textLabel.numberOfLines = 3;
        return categorycell;
    }
    
    if( tableView == catques)
    {
       
        static NSString *CellIdentifiercatques = @"Cell1";
        
        UITableViewCell *catquescell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiercatques];
        
        if (catquescell == nil) {
            
            catquescell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifiercatques];
            
        }
        catquescell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        catquescell.textLabel.font = [UIFont fontWithName:@"Arial" size:16];
        catquescell.textLabel.numberOfLines = 4;
        [ catquescell setSelectionStyle:UITableViewCellSelectionStyleGray];
        // Configure the cell...
      
       
        if( dlsreg)
        {
            catquescell.textLabel.text = [DLSregform objectAtIndex:indexPath.row];

            return catquescell;
        }
        if( dlssup)
        {
            catquescell.textLabel.text = [DLSsupport objectAtIndex:indexPath.row];
            return catquescell;
        }
        if( idchk)
        {
            catquescell.textLabel.text = [idcheck objectAtIndex:0];
            return catquescell;
        }
        if( sco)
        {
            catquescell.textLabel.text = [sconul objectAtIndex:0];
            return catquescell;
        }
        if( cere)
        {
            catquescell.textLabel.text = [ceremonies objectAtIndex:indexPath.row];
            return catquescell;
        }
        
        if( alu)
        {
            catquescell.textLabel.text = [alumini objectAtIndex:0];
            return catquescell;
        }
        if( cert)
        {
            catquescell.textLabel.text = [certificates objectAtIndex:indexPath.row];
            return catquescell;
        }
        if( dip)
        {
            catquescell.textLabel.text = [diploma objectAtIndex:0];
            return catquescell;
        }
        if( inter)
        {
            catquescell.textLabel.text = [ills objectAtIndex:indexPath.row];
            return catquescell;
        }
        
        else
        {
            catquescell.textLabel.text = @"click a category";
        }
        
        return catquescell;
    
    }
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    if( tableView == categories)
    {
        UITableViewCell *getcell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *celltext;
        celltext = getcell.textLabel.text;
        if([celltext isEqualToString:@"DLS (Distance Learning Support) registration form"])
        {
            //categories.frame = CGRectMake(-164, 0, 329, 447);
            //catques.frame = CGRectMake(164, 0, 472, 447);
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:154/255.0f green:53/255.0f blue:255/255.0f alpha:0.7]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            catques.backgroundColor = [UIColor colorWithRed:154/255.0f green:53/255.0f blue:255/255.0f alpha:1];
            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            dlsreg = TRUE;
            dlssup = FALSE;
            idchk = FALSE;
            sco = FALSE;
            cere  = FALSE;
            cert = FALSE;
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"DLS (Distance Learning Support) "])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:0/255.0f green:175/255.0f blue:82/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:0/255.0f green:175/255.0f blue:82/255.0f alpha:0.5]];

            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];

            dlssup = TRUE;
            sco = FALSE;
            dlsreg = FALSE;
            idchk = FALSE;
            cere  = FALSE;
            cert = FALSE;
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
           
        }
        
        if([celltext isEqualToString:@"ID check & Student card issue"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:50/255.0f green:204/255.0f blue:254/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:50/255.0f green:204/255.0f blue:254/255.0f alpha:1.0f]];
            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];

            idchk = TRUE;
            dlssup = FALSE;
            dlsreg = FALSE;
            sco = FALSE;
            cere  = FALSE;
            cert = FALSE;
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"Sconul Access Request Form"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:228/255.0f green:108/255.0f blue:11/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:228/255.0f green:108/255.0f blue:11/255.0f alpha:1.0f]];
            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];

            sco = TRUE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            cere  = FALSE;
            cert = FALSE;
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
        
        }
        if([celltext isEqualToString:@"Ceremonies"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:63/255.0f green:240/255.0f blue:14/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            catques.backgroundColor = [UIColor colorWithRed:147/255.0f green:210/255.0f blue:80/255.0f alpha:1];

            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            
            cere = TRUE;
            sco = FALSE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            
            cert = FALSE;
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"Alumini"])
        {
            [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:0/255.0f green:237/255.0f blue:193/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:0/255.0f green:237/255.0f blue:193/255.0f alpha:1.0f]];

            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            
            alu = TRUE;
            cere = FALSE;
            sco = FALSE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            cere  = FALSE;
            cert = FALSE;
            
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"Certificates"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:150/255.0f green:55/255.0f blue:53/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:150/255.0f green:55/255.0f blue:53/255.0f alpha:1.0f]];

            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            
            cert = TRUE;
            alu = FALSE;
            cere = FALSE;
            sco = FALSE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            cere  = FALSE;
            
            alu = FALSE;
            dip = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"Diploma Supplement"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:228/255.0f green:108/255.0f blue:11/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:228/255.0f green:108/255.0f blue:11/255.0f alpha:1.0f]];

            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            
            dip = TRUE;
            cert = FALSE;
            alu = FALSE;
            cere = FALSE;
            sco = FALSE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            inter = FALSE;
            [ catques reloadData];
            
        }
        
        if([celltext isEqualToString:@"ILL (Inter Library Loans)"])
        {
             [self hidecategoryquestion];
//            UIView *bgColorView = [[UIView alloc] init];
//            [bgColorView setBackgroundColor:[UIColor colorWithRed:0/255.0f green:237/255.0f blue:193/255.0f alpha:1.0f]];
//            [getcell setSelectedBackgroundView:bgColorView];
//            [catques setBackgroundColor:[UIColor colorWithRed:0/255.0f green:237/255.0f blue:193/255.0f alpha:1.0f]];
            catques.hidden = NO;
            showans.hidden = YES;
            [self replaceSubview:catques
                     withSubview:catques
                      transition:kCATransitionPush
                       direction:kCATransitionFromLeft
                        duration:0.8];
            
            inter = TRUE;
            dip = FALSE;
            cert = FALSE;
            alu = FALSE;
            cere = FALSE;
            sco = FALSE;
            idchk = FALSE;
            dlssup = FALSE;
            dlsreg = FALSE;
            
            [ catques reloadData];
            
        }
        
        

        
    }
    
    if( tableView == catques)
    {
        if( dlsreg)
        {
        if( indexPath.row == 0)
        {
           //categories.frame = CGRectMake(-280, 0, 329, 447);
           //catques.frame = CGRectMake(0, 0, 445, 447);
            [self hidecategory];
            showans.frame = CGRectMake(-250, 4, 575, 638);
            showans.hidden = NO;
            
            [self replaceSubview:showans
                     withSubview:showans
                      transition:kCATransitionPush
                       direction:kCATransitionFromBottom
                        duration:0.8];
            showans.text = @"The Distance Learning Support aims to provide as close a Learning Resources Service as possible to Middlesex University students who study on campus. This includes access to Middlesex university hardcopy collection of books and journal articles, as well as inter library loan requests via the British Library for material that we do not stock.  Go to: http://unihub.mdx.ac.uk/study/library/services/distance Services for Distance Learners are listed here.  To use the service, you must be fully enrolled with the University and registered with the Learning Resources service.  Please complete the registration form [ https://www.isis.mdx.ac.uk/download/dl_reg_frm.html ]. Enter your Network/myUniHub user details to electronically verify yourself and automatically submit your form. [DLSU]";
        }
        
        if( indexPath.row == 2)
        {
            [self hidecategory];
            showans.frame = CGRectMake(-255, 0, 580, 505);

            showans.hidden = NO;
            [self replaceSubview:showans
                     withSubview:showans
                      transition:kCATransitionPush
                       direction:kCATransitionFromBottom
                        duration:0.8];
            showans.text = @"Go to: http://unihub.mdx.ac.uk/study/library/services/distance  Services for Distance Learners are listed here.  To request items, you must be fully enrolled with the University and registered with the Learning Resources service. Once you are registered as a Distance Learner you are able to place requests on books and these will be posted to you._Please complete the relevant form below, enter your Network/myUniHub user details to electronically verify and automatically submit your form. Book Request Form [ https://www.isis.mdx.ac.uk/download/dl_reqfrm2.html ]  Journal Article Request Form [ https://www.isis.mdx.ac.uk/download/dl_reqfrm1.html ] Book Chapter Request Form [ https://www.isis.mdx.ac.uk/download/dl_reqfrm3.html ] [DLSU]";
        }
        
        if( indexPath.row == 1)
        {
            [self hidecategory];
            showans.frame = CGRectMake(-255, 0, 580, 505);

            showans.hidden = NO;
            [self replaceSubview:showans
                     withSubview:showans
                      transition:kCATransitionPush
                       direction:kCATransitionFromBottom
                        duration:0.8];
           showans.text = @" Distance Learning Support aims to provide as close a Learning Resources Service as possible to Middlesex University students who study on campus. This includes access to Middlesex university hardcopy collection of books and journal articles, as well as inter library loan requests via the British Library for material that we do not stock.  Go to: http://unihub.mdx.ac.uk/study/library/services/distance Services for Distance Learners are listed here.  To use the service, you must be fully enrolled with the University and registered with the Learning Resources service.  Please complete the registration form [ https://www.isis.mdx.ac.uk/download/dl_reg_frm.html ]. Enter your Network/myUniHub user details to electronically verify yourself and automatically submit your form. [DLSU]";
        }
        }
        
        if( idchk)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);

                showans.hidden = NO;
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.text = @"If you would like to come onto any campus you will need a student card to gain entry.  Student cards are issued at your induction. For further information please open a ticket via UniHelp Online [ http://unihub.mdx.ac.uk/unihelp ] [DLSU]";
            }
        }
        
        if( sco)
        {
            if( indexPath.row == 0)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);

                showans.hidden = NO;
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.text = @"You must be fully enrolled with Middllesex University. Please complete the Middlesex University SCONUL Access Request Form [ https://www.isis.mdx.ac.uk/download/sconul_frm1.html ] Enter your Network/myUniHub user details to electronically verify and automatically submit your form. [DLSU]";
            }
        }
        if( dlssup)
        {
            if( indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"We provide library materials, support and advice to students that are not able to visit a Middlesex University campus on a regular basis or not at all. Our service includes: Postal delivery of books from within the Middlesex University collection. Electronic or postal delivery of photocopies of journal articles and chapters of books as allowed within British copyright law. Ongoing support to students in their search for and use of materials. Facilitating the use of other university libraries. General help and guidance on all Middlesex University systems. Go to: http://unihub.mdx.ac.uk/study/library/services/distance/index.aspx for full details. [DLSU]";
            }
            if( indexPath.row == 1)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The Distance Learning Support aims to provide as close a Learning Resources Service as possible to Middlesex University students who study on campus. This includes access to Middlesex university hardcopy collection of books and journal articles, as well as inter library loan requests via the British Library for material that we do not stock.   http://unihub.mdx.ac.uk/study/library/services/distance  **Who can use the service** Work based learning, MProf or DProf candidate students. Students on courses validated as distance learning by the university Taught post-graduates in the writing up period between June 1 and the completion date. PhD students. Students at partner institutions with whom agreement has been reached. To use the service, you must be fully enrolled with the University and register with Distance Learning Support. If you have not already done so, please complete the registration form [ https://www.isis.mdx.ac.uk/download/dl_reg_frm.html ] [DLSU]";
            }
        }
        if( cere)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"An invitation will posted to your home address at the start of April. If you have a debt to the University you will not be able to attend a ceremony in the year you graduate but will be able to attend the following year when the debt has cleared. For full details go to: http://unihub.mdx.ac.uk/mdx/graduation/index.aspx  [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            
            if(indexPath.row ==1)
            {
               [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Only students guests with disabilities have allocated seating, all other seating is unallocated so as long as they go into the marquee together they will be sitting together   [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==2)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"VIPs have red tickets and parking has been arranged for them through Carole Bird 020 8411 5606 [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking";
            }
            if(indexPath.row ==3)
            {
               [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"We will try our best however it can not be guaranteed. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Disability ";
            }
            
            if(indexPath.row ==4)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"We do not provide parking on campus unless you or your guest is a blue badge holder.There is plenty of parking available at Brent Cross which is about a 15 minute bus ride away.  There are some small car parks in the local area however most of the streets in the local area are residents parking only.  Please email graduation@mdx.ac.uk for a parking map  Parking is extremely limited and staff are not guaranteed parking therefore we are only able to offer it to blue badge holders.  We suggest you drop your guest off at the front of the campus and then go and find a parking space in the local area. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Disability ";
            }
            
            if(indexPath.row ==5)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"If you have a blue badge we will try our best to provide parking. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Disabled, Disability, Blue Badge ";
            }
            
            if(indexPath.row ==6)
            {
              [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"Yes - please email graduation@mdx.ac.uk and we can forward this on to you [GRAD] Keywords: Map, Ceremony, Graduation";
            }
            
            if(indexPath.row ==7)
            {
              [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"It is about a 15 minute walk however we do provide a shuttle bus service between Hendon Central and the campus [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Directions, Map ";
            }
            
            if(indexPath.row ==8)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Hendon Hall Hotel is the closed at www.handpicked.co.uk [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Hotel, Stay";
            }
            
            if(indexPath.row ==9)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"We have a full factsheet - please email graduation@mdx.ac.uk and we can forward this onto you. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Directions";
            }
            
            if(indexPath.row ==10)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It depends on where you are coming from.  You can check on www.tfl.gov.uk if you are coming by public transport or email graduation@mdx.ac.uk for more informaton. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Directions";
            }
            
            if(indexPath.row ==11)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, we provide a shuttle bus to the campus [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Transport";
            }
            
            if(indexPath.row ==12)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, you can still attend your ceremony if you have a resit/deferral and are a finalist student.  Please check the graduation page [ http://unihub.mdx.ac.uk/mdx/graduation/index.aspx ] for furt information [GRAD] Keywords: Graduation, Ceremonies, Ceremony,  Resit, Deferral";
            }
            
            if(indexPath.row ==13)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"We have a shop and tea/coffee outlets on campus however there are small shops in the local area.  There are also three pubs closed tocampus. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Café, Restaurant, Pubs, Food";
            }
            
            if(indexPath.row ==14)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Children under the age of 5 are not allowed into the ceremonies and alternative arrangements must be made for them.  All children aged 6 and over must have their own seat in the ceremony marquee.  All children under the age of 12 must be accompanied by an adult.  Ticket price is the same as an adult.   Students may bring along children for the photographs.  We have an overflow area in the lecture theatre where anyone without tickets will directed to [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Children";
            }
            
            if(indexPath.row ==15)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Middlesex University, The Burroughs, Hendon, London, NW4 4BT [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Parking, Address";
            }
            
            if(indexPath.row ==16)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, we have a cashpoint on campus and there are also banks in the surrounding area [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Cashpoint, ATM";
            }
            
            if(indexPath.row ==17)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Children are welcome to attend the ceremonies however children under the age of 5 are not allowed into the ceremonies marquee.  Children over the age of five must have a ticket which costs £25 if you would like them to go into the ceremony marquee.  We do show the ceremonies in our lecture theatres which are free of charge and may be best for those guests with children. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Children, Guest tickets";
            }
            
            if(indexPath.row ==18)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The price is £25 - there are no discounts on tickets. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Child, Ticket, Price";
            }
            
            if(indexPath.row ==19)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Guests with children can watch from our lecture theatres.  A ticket is not needed and is free of charge [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Guests, Children";
            }
            
            if(indexPath.row ==20)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It is up to you if you would like to attend.  If you choose to attend your ceremony will be the same as everyone else's.  If you choose not to attend then you must ask for a refund two weeks before the ceremony.  If you defer or fail a module you will be invited again to the 2014 ceremonies as you will be a 2014 graduate. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Deferred, Failed, Attend";
            }
            
            if(indexPath.row ==21)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"No - you must clear your debt before you can book into a ceremony. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Debt, Hold";
            }
            
            if(indexPath.row ==22)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"No - you cannot attend the ceremony and must apply for a refund on-line [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Academic Misconduct";
            }
            
            if(indexPath.row ==23)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - however we can not guarantee it will be the ceremony you were originally allocated to [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Debt";
            }
            
            if(indexPath.row ==24)
            {
                [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - you can do this on the day however there will be a surcharge of about £5.  The gownhire company will only accept cash on the day and it may be a gown that a student has already worn.[GRAD] Keywords: Graduation, Ceremonies, Ceremony, Gown, Cost, Price";
            }
            if(indexPath.row ==25)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, you can book your photographs on the day.  Photographs are between £25 and £145 depending on what you require [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Photo, Photogragh, Cost, Price";
            }
            
            if(indexPath.row ==26)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It is unlikely that we will have guest tickets available on the day of your ceremony. However, if we do these will be available to purchase from the help desk in registration.  If tickets are not available your guests will be able to watch from the lecture theatre and a ticket is not needed.  These guests will not be entitled to the refreshments on offer but will be able to use the cash bar. [GRAD] ";
            }
            
            if(indexPath.row ==27)
            {
                [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - please contact the graduation office on 0208 411 6355 or graduation@mdx.ac.uk for further instruction [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Partner College";
            }
            
            if(indexPath.row ==28)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - any of the graduation staff will be able to show you where the nearest toilets are. There are plenty of toilets signposted on campus or any of the graduation staff will be able to show you where the nearest toilets a[GRAD] Keywords: Graduation, Ceremonies, Ceremony, Disabled, Toilets";
            }
            
            if(indexPath.row ==29)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - programmes with the names of each student due to graduate will be available at the ceremonies. The name of the prize will be read out as you cross the stage.  The actual prize will be dealt with by your school - for further information please refer to the graduation office on 0208 411 6355 or graduation@mdx.ac.uk[GRAD] Keywords: Graduation, Ceremonies, Ceremony, Programme, Prize";
            }
            
            if(indexPath.row ==30)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"A reception is held after each ceremony in the Rickett Quad.  Please exchange you drinks voucher or guest ticket for refreshments.  Those guests in the lecture theatre will be able to purchase drinks at the cash bar. Doors open at 8.30am for the 10.20am ceremony, 12noon for the 1.20pm ceremony and 3.00pm for the 4.20pm ceremony.  Please come to registration in the Grove to collect your seating card and guest ticket you have ordered them. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Time, Programme, Itinery";
            }
            
            if(indexPath.row ==31)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Guests with tickets will sit at the back of the ceremonies marquee. Students will sit in allocated seats at the front of the ceremonies marqe [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Guest, Seating, Sit";
            }
            if(indexPath.row ==32)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The ceremonies are filmed by our official photographers, Galaxy, and DVDs can be pre-ordered or bought on the day of your ceremony.  You can film or photograph the ceremonies but tripods can not be used.  If you are using a camera or video please do not leave your seat, obstruct others guests or the movement of graduates during the ceremony. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Video, Photograph";
            }
            
            if(indexPath.row ==33)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"You can purchase a copy of the DVD from Galaxy either on the day of your ceremony or at www.mygraduationfilmcom [GRAD] Keywords: Graduation, Ceremonies, Ceremony,DVD";
            }
            
            if(indexPath.row ==34)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes please - when you register please put as much information in the special requirements box.  We will then contact you to confirm all the detais. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Disability, Guest";
            }
            
            if(indexPath.row ==35)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                           withSubview:showans
                            transition:kCATransitionPush
                             direction:kCATransitionFromBottom
                              duration:0.8];
                showans.hidden = NO;
                showans.text = @"No - students are seated in a very strict order relating to their name and programme of study.  If you do not sit in the the seat assigned to you your name will not be called out to process across the stage. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Friend, Seating";
            }
            
            if(indexPath.row ==36)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It may be that you are not due to graduate this year, you have a debt to the university, you are attending Summer School, your record has not been updated properly ot that your inbox is full. If student says none of the above please put through to the graduation office on 6770 for further information [GR] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==37)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It may be that you are not due to graduate this year, you have a debt to the university, you are attending Summer School or your record has not been updated properly.If student says none of the above please put through to the graduation office 6770 [GRAD] Keywords: Graduation, Ceremonies, Ceremony, booking";
            }
            
            if(indexPath.row ==38)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - when you register on-line there will be a box to fill in for special requirements.  Please write your request in this box and the graduation office will get  in contact to confirm it fo you [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==39)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, you must still register so that you will have a seat in the marquee and a seating card can be prepared so that your name will be read out when you cross the stage [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Guest";
            }
            
            if(indexPath.row ==40)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The deadline is 21st June however seats for students are allocated on a first come first served basis so if your ceremony is full before 21st June you will not be able to book a place.  If the student can't book in because the ceremony is full please refer back to the graduation office on 6770. You can still attend a ceremony however some of the ceremonies maybe full.Please refer student to 6 check [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Booking";
            }
            
            if(indexPath.row ==41)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Please refer the student to the graduation office on 6770. You can check when your ceremony is by accessing the Ceremony Dates and Times tabe on the graduation pages on Unihub at http://unihub.mdx.ac.uk/mdx/graduation/index.a [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row == 42)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Ceremonies are held at the Hendon Campus of the university. [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==43)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Students attending Summer School are not automatically invited to the ceremonies.  You must register and pay for your modules and call the graduation office on 6770 after the closing date of 21st June to see whether there are any space available [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Summer School";
            }
            
            if(indexPath.row ==44)
            {
                [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Students at the Dubai/Mauritius campus are automatically invited to the UK ceremonies. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Dubai, Mauritius";
            }
            
            if(indexPath.row ==45)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"You will need to contact the campuses directly as we do not have involvement in their ceremonies [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Dubai, Mauritius";
            }
            
            if(indexPath.row ==46)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Please email graduation@mdx.ac.uk with your student number and change of name so that amendments can be made.[GRAD] Keywords: Graduation, Ceremonies, Ceremony, Name";
            }
            
            if(indexPath.row ==47)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"There is no dress code though graduation is quite a formal event.  It is a matter of personal choice what you wear to the ceremony though you may find it useful to know that the sleeves of the gown end at the elbow.  Women graduates are advised to have a brooch or safety pin to fix the hood (we do not supply pins).  Men tend to wear a suit or shirt and tie with the hood being fixed to a button on the shirt [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Dress";
            }
            
            if(indexPath.row ==48)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - please transfer to the graduation office on 16770 [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==49)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Payment is made on-line by credit/debit card  Please refer the student to the graduation office 16770 [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            
            if(indexPath.row ==50)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Graduation ceremonies are very expensive to put on and are not covered in the cost of fees.  The university makes a charge to go someway to covering the costs of the ceremonies but does not make any profit from the cost of the tickets.  Children’s tickets are £25.  It is a ticket price - not an adult/child price. [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            if(indexPath.row ==51)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Graduation ceremonies are very expensive to put on and are not covered in the cost of fees.  The university makes a charge to go someway to covering the costs of the ceremonies but does not make any profit from the cost of the tickets.  Children’s tickets are £25.  It is a ticket price - not an adult/child price. For further information please refer to the graduation office on 16770.  [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            if(indexPath.row ==52)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"No, students do not need a ticket however you must register your attendance so that you have a seat in the ceremonies marquee. Tickets are collected from registration on the day of your ceremony.  You must bring your confirmation email and photo id to collect your tickets. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Ticket, Collect";
            }
            if(indexPath.row ==53)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Those guests can watch from the lecture theater where the ceremonies are shown on a video feed.  These guests would not be entitled to the refreshments at the reception but would be able to make use of the pay bar.  No - we only have space in the ceremonies marquee for those guests with a ticket.  Other guests can make use of the lecture theaters where the ceremonies are shown on a video feed.  These guests would not be entitled to the refreshments at the reception but would be able to make use of the pay bar . [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Ticket";
            }
            
            if(indexPath.row ==54)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Refunds can be requested up to two weeks until the ceremonies start.  After this date refunds will only be given if the student is ill and provides medical evidence of this by 31st July.  This must either be posted by registered post or emailed to the graduation office. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Refund";
            }
            
            if(indexPath.row ==55)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes, please send an email with your name, student number and address to graduation@mdx.ac.uk and we can do this for you.  One copy will be sent in the post and a copy emailed to your email address. No - we do not name guests in the letters as it is you that we are inviting.  You will need to provide evidence of who your guests are. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Guest, Visa";
            }
            
            if(indexPath.row ==56)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It is best to contact the embassy in the country where you will be applying for the visa.  They will be able to give you a list of the documents that you will need [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Visa";
            }
            
            if(indexPath.row ==57)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"It depends on your award but between £35 and £55.  It will cost more if you do it on the day of your ceremony.  You can order a gown online at www.gownhire.co.uk or by calling 01223 861854.  You can register for the ceremony, guest tickets, gown and photographs at the same time. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Gown";
            }
            if(indexPath.row ==58)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The type of gown depends on your award.  When you telephone or go on-line you will need to know your award and you will be given the correct gown - full dress regulations can be found at http://unihub.mdx.ac.uk/mdx/graduation/index.aspx [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Gown";
            }
            if(indexPath.row ==59)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The type of gown depends on your award.  When you telephone or go on-line you will need to know your award and you will be given the correct gown - full dress regulations can be found at http://unihub.mdx.ac.uk/mdx/graduation/index.aspx aspx    If unsure put through to the Graduation Office on 16355 [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Gown";
            }
            if(indexPath.row ==60)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Yes - Ede and Ravenscroft have a list of everyone who has booked a gown. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Collect, Gown, Reference Number";
            }
            if(indexPath.row ==61)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Please contact Ede and Ravenscroft on 01228 861854 for assistance [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Refund";
            }
           if(indexPath.row ==62)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The hood has a small loop which will fit over a button on a shirt or blouse.  If you are not wearing one of these you will need a brooch or pin to secure the hood.  The hood should lay at the edge of your shoulder and not be wrapped around your arms like a shawl. Standard dress is gown, hood and mortar board.  If you are Sikh and wear a turban you do not need to wear the mortarboard. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Gown, Hat, Mortarboard, Hood";
            }
            if(indexPath.row ==63)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Photography can be booked online at www.gownhire.co.uk  It is best to book in advance however you can also book on the day. Yes- please just turn up and go straight to get your gown and then to photography. [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
            }
            if(indexPath.row ==64)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Ede and Ravenscroft are our official photographers and are available for professional photographs.  Between £25 and £145 depending on what you would like. You are welcome to take your own photos as well. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Photograph, Photo, Cost";
            }
            if(indexPath.row ==65)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Please contact Ede and Ravenscroft on 01223 861854 for assistance.  [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Refund";
            }
            if(indexPath.row ==66)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"No - they have a schedule for the day which does not include photographs with graduates . [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Photogragh, Honorary, Graduate";
            }
            if(indexPath.row ==67)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"There will be speeches by the Honorary graduate, the Chancellor and Vice-Chancellor.  Graduates with then proceed to cross the stage and be presented for their awards.  You will be given a scroll as you cross the stage and will shake hands with the Dean of the School (further information please see http://unihub.mdx.ac.uk/mdx/graduation/index.aspx. Plastic bottles only and please take your rubbish with you. [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Food, Drink";
            }
            if(indexPath.row ==68)
            {
                [self hidecategory];
               showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"When you cross the stage please put your left hand onto your right shoulder across your chest and the Dean will know you can not shake hands [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Shake, Dean";
            }

    }
        if(alu)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Once you have graduated from Middlesex University you automatically become part of our global alumni community. To activtate your online account new users should go to: https://alumni.mdx.ac.uk/login and click the  New User Registration link and complete the form to register.   More details can be found at: http://alumni.mdx.ac.uk/home or call 020 8411 4973 or 020 841111 [GRAD]  Graduation,  Alumni";
            }
        }
        if(cert)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Certificates are posted out up to four months after the date you are awarded your degree - not from when you attend a ceremony.  If you have queries about your certificate please contact Shirland McKoy on s.mckoy@mdx.ac.uk or 0208 411 639 [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Certificate";
            }
            if(indexPath.row ==1)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Expelled students are awarded exit qualifications if they have sufficient credit, therefore receive a transcript and certificate. [GRAD] Keywords: Certificate, Expelled";
                
            }
            
            if(indexPath.row ==2)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"There is a £10 charge for diploma supplements for those students that completed their studies after  1993 and £5 for any additional copies ordered at the same time. There is a £25 charge for students who completed their studies before 1993. Advise student to pay at the Cash Office for a duplicate Transcript or Diploma Supplement and bring back to the UniHelp desk proof of receipt. If in doubt or the multiple copy is for an educational institution refer to Acting Assistant Registrar U.Reed@mdx.ac.uk 020 8411 6024. Take student ID - If not the student card the ID must be photographic evidence such as a passport, driving license. Full name (the name you used when you studied here) Your date of birth, The course details , the years that they attended at Middlesex. Confirm that the student will collect documents or provide written confirmation of an authorised alternative.  UniHelp Counter MISISCORE>SWRDSIG . Print out a replacement on hologram paper. Inform student via call back service documents are ready for collection. Pick up and collection can only be made with proof of ID or written confirmation by student of another named person. Open a helpdesk ticket and assign to UniHelp UHD tech area. If in doubt or the multiple copy is for an educational institution refer to Acting Assistant Registrar U.Reed@mdx.ac.uk 020 8411 6024 or escalate to ARAO tech area  [ARA] Keywords: Diploma Supplement";
            }
            
            if(indexPath.row ==3)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The University does not send the certificate in the following circumstances: oThere is an outstanding debt on the students account oThere is no permanent address for the student in our records Take student ID   View SWISTUR > SOAHOLD to see if there are any financial holds. View SPAIDEN to check for PR (Permanent Home) address details To resolve an outstanding debt, refer the caller to Credit Control on 020 8411 6400 option 3 or if unavailable or out of hours Escalate to FS (Financial Services Tech) If  current student and has access to myUniHub the student can update their address in MyAdmin & Finances tab > MyPersonal Record  If Learner Outcome Record status is QC:  To amend address details Escalate ticket to Academic Registry Assessment ARA Tech [ARA] Keyword: Certificate";
            }
            
            if(indexPath.row ==4)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"If a student wants to set an alternate address for the qualification certificate to be sent once they have graduated and have no access to myUniHub to update this in myAdmin & Finances > myPersonal Record, or If unable to add an address, this will have to be done by Student Records - Academic Registry. View SWISTUR > SGASTDN > Curricula tab to identify the appropriate Student Office tech area, take the details of the address and escalate to ARRE tech.  Keywords: Certificate, Address";
            }
            
            if(indexPath.row ==5)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"If the application is made within 1 year of the postage date, and all the information supplied to the University was correct at the time of posting, then you will not be charged for the replacement certificate.  If the caller was Conferred within the last year or would like further information, put them through to Maria Oskis on 020 8411 4822 or if unavailable or out of hours Escalate ticket to Academic Registry Assessment ARA Tech. For all other applications, there will be a charge of £45.00 per certificate for a replacement certificate. http://unihub.mdx.ac.uk/study/assess/certificates/index.aspx  To purchase a Replacement Certificate go to: http://www.onlinestore.mdx.ac.uk/ click on Product Catalogue > Registry > Replacement Certificate [ARA] Keywords: Certificate, Replacement";
            }
            
            if(indexPath.row ==6)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Certificates are issued within 4 months of the date the qualification is awarded. Unless students indicate a specific address (in SPAIDEN this will be listed as a CT - Qualification Certificate address), they are posted to the student's permanent home address registered on MISIS.  It is the student's responsibility to ensure that the University has the most up-to-date address for them.  Certificates will not be issued to students with outstanding debt to the University. http://unihub.mdx.ac.uk/study/assess/certificates/index.aspx  If the Learner Outcome Record status is QC, this means that the certificate has been produced, but this may only have been sent very recently. Note that the University does not send the certificate in the following circumstances: There is an outstanding debt on the students account. There is no permanent address for the student in our records. If the caller has already waited more than 4 months escalate to Academic Registry Assessment 6393 or if unavailable or out of hours Escalate to ARA Tech. If AW they will have received the transcript / Diploma Supplement [ARA] Keywords: Certificate";
            }
            
            if(indexPath.row ==7)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The certificate carries the full legal name of the student as recorded on University systems. If the student has changed their name whilst studying, the University will consider changing the name on the system, providing they are able to supply official original documentation to support the request. To change their name advise the student to bring your official and original documentation to the UniHelp desk in the Sheppard Library. The University is unable to carry out a name change for any graduate who has officially changed their name after graduating from the University. If student wants to discuss this Escalate to Academic Registry Assessment Certificates 6393 or if unavailable or out of hours Escalate to Academic Registry Assessment ARA [ARA] Keywords: Certificate, Name";
            }
            
            if(indexPath.row ==8)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"As you have not completed your degree here at Middlesex we are unable to supply you with an official transcript but we can supply a a MISIS print out which shows your grades for the relevant modules and have it approved with a Middlesex University stamp   Please contact Unihelp [ http://unihub.mdx.ac.uk/unihelp ]. For further information on Student Exchange http://unihub.mdx.ac.uk/study/employ/exchange/faq/inx [ARA] Keywords : Certificate, Exchange Student";
            }
            
            if(indexPath.row ==9)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Please email assessmentreg@mdx.ac.uk with the following information: •	Full name •	Student Number (if known)  •	DOB  •	Qualification Title (e.g. BSc Business Information Systems) •	Address to which the verification should be sent  [ARA] Keywords: Qualification";
                
            }
            
            if(indexPath.row ==10)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The certificate carries the full legal name of the student as recorded on University systems. If you have changed your name whilst studying, the University will consider changing the name on the system, providing you are able to supply official original documentation to support the request.   To change your name bring your official and original documentation to the UniHelp desk in the Sheppard Library. The University is unable to carry out a name change for any graduate who has officially changed their name after graduating from the University. [ARA] Keywords: Certificate, Name";
            }
            
            if(indexPath.row ==11)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"If the application is made within 1 year of the postage date, and all the information supplied to the University was correct at the time of posting, then you will not be charged for the replacement certificate.    For all other applications, there will be a charge of £45.00 per certificate for a replacement certificate.    http://unihub.mdx.ac.uk/study/assess/certificates/index.aspx  To purchase a Replacement Certificate go to: http://www.onlinestore.mdx.ac.uk/  click on Product Catalogue > Registry > Replacement Certificates [ARA] Keywords: Certificate, Replacement";
            }
            
            
            if(indexPath.row ==12)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Diploma supplements and letters will be sent within 2 weeks of publication of classifications.  Certificates are sent out within three months of qualifying.  You may request a replacement certificate, but you must allow a period of three calendar months before making an application for a replacement certificate.  This will allow sufficient time for certificates that have gone astray in the post to be returned to our offices.  *Replacement Diploma Supplement (Transcripts)* There is a £10 charge for diploma supplements for those students that completed their studies after 1993 and £5 for any additional copies ordered at the same time. There is a £25 charge for students who completed their studies before 1993.   You should pay at the Cash Office for a duplicate Transcript or Diploma Supplement and bring the receipt back to the Unihelp desk.  *Replacement Certificates* To obtain a replacement certificate, you need to complete an application for a replacement certificate form.  There is a £45 charge for a replacement certificate. See http://unihub.mdx.ac.uk/study/assess/certificates/index.aspx for full information on applying for replacement documentation  To purchase a Replacement Certificate go to: http://www.onlinestore.mdx.ac.uk/   click on Product Catalogue > Registry > Replacement Certificates [ARA] Keywords: Certificate";
            }
            
            
            if(indexPath.row ==13)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Your award certificates are posted directly to your address listed as your permanent address. All certificates are posted using the UK Royal Mail 2nd class postal service and so cannot be tracked. [ARKeywords: Certificate, Tracking number";
            }
            
            
            if(indexPath.row ==14)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Expelled students are awarded exit qualifications if they have sufficient credit, therefore receive a transcript and certificate.  These will be sent to the registered permanent address we have recorded, or a correspondence address if recorded[ARA] Keywords: Expelled, Certificate, Diploma Supplement";
            }
            
            
            
            if(indexPath.row ==15)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"To set an alternate address for the qualification certificate to be sent to, login to myUniHub to update this in myAdmin & Finances > myPersonal Record. If you do not have access to myUniHub, contact Unihelp [ http://unihub.mdx.ac.uk/unihelp [A Keywords: Certificate, address";
            }
            
            
            
            if(indexPath.row ==16)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Your award certificates are posted directly to your address on University systems, that you have indicated to be your permanent address.   Please note that you will not receive your certificate at the graduation ceremony.    Certificates will be sent to graduates within five months of the award being made.  For certificate enquiries please contact Shirland McKoy on s.mckoy@mdx.ac.uk or telephone 0208 411 6393.  http://unihub.mdx.ac.uk/mdx/graduation/schedule/index.aspx [ARA] Keyword: Certificate";
            }
        }
        if( dip)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Diploma supplements and letters will be sent within 2 weeks of publication of classifications. All students who graduate from Middlesex University will automatically receive a Diploma Supplement or Transcript on completion of their studies, which can be used to officially verify module results and final classifications.  *The initial Diploma Supplement is free of charge.  *  They will not be issued to students with certain holds on their account or with an outstanding debt to the University.  They are sent out within two weeks of the students qualification details being confirmed on MISIS, to a students Permanent Home address listed on their personal Record.  Extra copies of diploma supplements may be ordered. There is a £10 charge for diploma supplements for those students that completed their studies after 1993 and £5 for any additional copies ordered at the same time. There is a £25 charge for students who completed their studies before 1993.  (Nursing Transcript to work abroad for Midwifery and Nursing students cost £35 and are available from Student Office at Archway) For all other diploma supplements pay at the Cash Office (or ring Finance on 0208 411 6400) for a duplicate Transcript or Diploma Supplement and bring the receipt back to the Unihelp desk.  You can also email us the receipt number with your instructions for delivery or collection.  Our email address is unihelp@live.mdx.ac.uk for ordering transcripts [ARA] Keyword: Diploma Supplement";
            }
        }
        
        if( inter)
        {
            if(indexPath.row == 0)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"An administrative charge of £3.00 will be made for all inter-library requests whatever the nature of the material.                                                                                              A charge of £2 will be made for photocopies obtained from other campuses.                                      The charge will be due on receipt of the request form. A further charge of £4.50 will be made for renewals. Please take care of inter-library loan materials and ensure that they are returned or renewed on time. The cost for lost or damaged items is currently £147.20.9 more maybe charged if the item is very expensive to replace) http://unihub.mdx.ac.uk/study/library/resources/ill/#charges For full details go to: http://unihub.mdx.ac.uk/study/library/resourc  [ILL] Keywords: Charge";
                
            }
            
            if(indexPath.row == 1)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];

                showans.hidden = NO;
                showans.text = @"The inter-library loan service provides material required for coursework, research or other Middlesex University business which is not held by the University’s campus libraries.                                                                                                                                  The service is available to all students, research staff, academic and administrative staff who are registered with the library.                                                                                                          Requests should be made by completing the online inter-library loan form [ http://unihub.mdx.ac.uk/study/library/resources/ill/ ]                                                                                  Library staff will request the item from an appropriate library. You will be informed via your student email address if there are any delays or more information is required. In some cases you will be offered the option to cancel your request.                                                                        If you have requested a returnable item, you will be informed via your student e-mail address of its arrival. In some cases material will be restricted to use in the library only. [ILL] Keywords: books, request";
                
            }
            if(indexPath.row == 2)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The inter-library loan service provides material required for coursework, research or other Middlesex University business which is not held by the University’s campus libraries.                                                                                                                                         The service is available to all students, research staff, academic and administrative staff who are registered with the library.                                                                                                  Requests should be made by completing an inter-library loan form [ http://unihub.mdx.ac.uk/study/library/resources/i [ILL] Keywords: other institutions, library";
                
            }
            
            if(indexPath.row == 3)
            {
               [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"If it is available electronically you will not be charged although you would have to pay to print it out. If we have to obtain it from the British Library we are charged but you only have to pay a nominal charge of £3 per request which is a fraction of what we pay to the British Library (7.50 for an article, £11.60 for a book) not the full article £8 and electronically £7.                                                                                                                                           [ILL] Keywords: pay, journal";
                
            }
            
            if(indexPath.row == 4)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"The inter-library loan service provides material required for coursework, research or other Middlesex University business which is not held by the University’s campus libraries.                                                                                                                                     The service is available to all students, research staff, academic and administrative staff who are registered with the library.  Requests should be made by completing an inter-library loan form.                                                                                                                                      More information and the online request form can be found at the inter library loans web pages [ http://unihub.mdx.ac.uk/study/library/resources/ill/index.aspx#request [ILL] Keywords: Inter library loan";
                
            }
            
            if(indexPath.row == 5)
            {
                [self hidecategory];
                showans.frame = CGRectMake(-255, 0, 580, 505);
                [self replaceSubview:showans
                         withSubview:showans
                          transition:kCATransitionPush
                           direction:kCATransitionFromBottom
                            duration:0.8];
                showans.hidden = NO;
                showans.text = @"Firstly please make sure you search for the Journal title and follow the links for the article from there.                                                                                                                        If you are still unable to find the Journal and subsequent article, please submit an online ILL request.                                                                                                                                       If the material you require for your studies or research is not held by the University’s campus libraries or electronic resources, the Inter-library loans service is here to help you.                                We liaise with the British Library and other University libraries both in the UK and abroad to obtain the books or articles you require – a small charge applies.                                           The service is available to all students and staff with a current library registration.                       For full instructions please go to: http://unihub.mdx.ac.uk/study/library/resources/ill/inde [ILL] Keywords: journal article";
                
            }
            
        }

    }
}

//(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 70;
//}


- (IBAction) touchMenuItem:(id)sender {
    
    check=1;
    UIButton *instanceButton = (UIButton*)sender;
    if(instanceButton.tag==0)
    {
        
        EKEventStore *store = [[EKEventStore alloc] init];
        
        if([store respondsToSelector:@selector(requestAccessToEntityType:completion:)])
        {
            // iOS 6
            [store requestAccessToEntityType:EKEntityTypeEvent
                                  completion:^(BOOL granted, NSError *error) {
                                      if (granted)
                                      {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              [self createEventAndPresentViewController:store];
                                          });
                                      }
                                  }];
        } else
        {
            // iOS 5
            [self createEventAndPresentViewController:store];
        }
    }
    if(instanceButton.tag==1)
    {
        NewTicketViewController *newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
        //newticket.modalPresentationStyle = UIModalPresentationFormSheet;
        newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:newticket animated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    button1.hidden=YES;
    button2.hidden=YES;
}
-(IBAction)menuButton:(id)sender
{
    //NSLog(@"****************** inside menu *****************");
    if(check==1)
    {
        check=0;
        //ViewdisableImg.hidden=NO;
        button1.hidden=NO;
        button2.hidden=NO;
        //  [self.view bringSubviewToFront:ViewdisableImg];
        
        [self.view bringSubviewToFront:button1];
        [self.view bringSubviewToFront:button2];
        //[self.view bringSubviewToFront:main];
    }
    else
    {
        check=1;
        //  ViewdisableImg.hidden=YES;
        button1.hidden=YES;
        button2.hidden=YES;
    }
    //    ViewdisableImg.userInteractionEnabled = YES;
    
    
}


- (void)createEventAndPresentViewController:(EKEventStore *)store
{
    EKEvent *event = [self findOrCreateEvent:store];
    
    EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
    controller.event = event;
    controller.eventStore = store;
    controller.editViewDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (EKEvent *)findOrCreateEvent:(EKEventStore *)store
{
    NSString *title = @"Add Your Event";
    
    // try to find an event
    
    EKEvent *event = [self findEventWithTitle:title inEventStore:store];
    
    // if found, use it
    
    if (event)
        return event;
    
    // if not, let's create new event
    
    event = [EKEvent eventWithEventStore:store];
    
    event.title = title;
    event.notes = @"My event notes";
    event.location = @"Event Location";
    event.calendar = [store defaultCalendarForNewEvents];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = 8;
    event.startDate = [calendar dateByAddingComponents:components
                                                toDate:[NSDate date]
                                               options:0];
    components.hour = 1;
    event.endDate = [calendar dateByAddingComponents:components
                                              toDate:event.startDate
                                             options:0];
    
    return event;
}


- (EKEvent *)findEventWithTitle:(NSString *)title inEventStore:(EKEventStore *)store

{
    NSDate *startdate = [NSDate date];
    NSDate *enddate = [NSDate distantFuture];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startdate endDate:enddate calendars:nil];
    
    // Fetch all events that match the predicate
    
    NSArray *events = [store eventsMatchingPredicate:predicate];
    for (EKEvent *event in events)
    {
        if ([title isEqualToString:event.title])
        {
            return event;
        }
    }
    return nil;
}
- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)handleSwipe:(UISwipeGestureRecognizer *) recognizer
//{
//    //might need to check if swipe has ended (otherwise not time to handle yet)
//    if (recognizer.state != UIGestureRecognizerStateEnded)
//        return;
//    
//    CGPoint location = [recognizer locationInView:categories]; //not self.view
//    NSIndexPath *selectedIndexPath = [categories indexPathForRowAtPoint:location];
//    
//    if (selectedIndexPath != nil)
//    {
//        //user swiped on a tableview cell
//        NSLog(@"Swiped");
//        swipe = TRUE;
//        catques.hidden = NO;
//    }
//    else
//    {
//        NSLog(@"Not Swiped");
//        //user did not swipe on a tableview cell
//    }
//}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    
//    NSLog(@"%d = %d",recognizer.direction,recognizer.state);
    catques.hidden = NO;
    swipe = TRUE;
}

-(IBAction)cateroy:(id)sender
{
//    categories.frame = CGRectMake(0, 0, 329, 447);
//    catques.frame = CGRectMake(322, 0, 372, 447);
//    catques.hidden = YES;
//    showans.frame = CGRectMake(500, 0, 321, 447);
    if (categories.frame.origin.x == -700)
    {
        [self showcategory];
    }
    else if (categories.frame.origin.x == -2000)
    {
        [self showcategory];
    }
    else
    {
        [self hidecategory];
    }
faqimage.hidden = YES;
aniimage.hidden = YES;
}

-(void)showcategory
{
    [UIView animateWithDuration:1.5
                     animations:^{
                         [categories setFrame:CGRectMake(parentview.frame.origin.x+2, categories.frame.origin.y, catques.frame.size.width, catques.frame.size.height)];
                     }];
    catques.hidden = YES;
    showans.hidden = YES;
}
-(void)hidecategory
{
    [UIView animateWithDuration:1.5
                     animations:^{
                         [categories setFrame:CGRectMake(-700, categories.frame.origin.y, catques.frame.size.width, catques.frame.size.height)];
                     }];
}
-(void)hidecategoryquestion
{
    [UIView animateWithDuration:1.5
                     animations:^{
                         [categories setFrame:CGRectMake(-2001, categories.frame.origin.y, categories.frame.size.width, categories.frame.size.height)];
                     }];
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(hideques:) userInfo:nil repeats:NO];
}
-(void)hideques:(NSTimer *)t
{
    [UIView animateWithDuration:1.5
                     animations:^{
                         [catques setFrame:CGRectMake(2, catques.frame.origin.y, 443, catques.frame.size.height)];
                     }];
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
    [UIView animateWithDuration:0.25
                     animations:^{
                         [parentview setFrame:CGRectMake(menuscrollview.frame.size.width, parentview.frame.origin.y, parentview.frame.size.width, parentview.frame.size.height)];
                     }];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [parentview setFrame:CGRectMake(0, parentview.frame.origin.y, parentview.frame.size.width, parentview.frame.size.height)];
                     }];
}
-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
//    NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
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
