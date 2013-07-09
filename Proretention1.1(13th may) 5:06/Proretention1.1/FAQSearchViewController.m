//
//  FAQSearchViewController.m
//  FAQSearch
//
//  Created by Vril Mac on 6/6/13.
//  Copyright (c) 2013 Vril Mac. All rights reserved.
//

#import "FAQSearchViewController.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "MyprofileViewController.h"
#import "MyFAQViewController.h"
#import "MyQueryViewController.h"
#import "NewTicketViewController.h"
#import "NewLoginViewController.h"
#import "SupportViewController.h"
#import "WebviewViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
@interface FAQSearchViewController ()

@end

@implementation FAQSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Fruits", @"Fruits");
        
        DLSregform = [ NSMutableArray arrayWithObjects:@"Where can l find a copy of the Distance Learning Services Unit registration form?",@"I need to register with the DLSU Distance Learning Support Unit.",@"I need to request materials from Learning Resources and have them sent to me as I am a Distant Learner.", nil];
        
        DLSsupport = [[NSMutableArray alloc]initWithObjects:@"How do I find out about the services available to Distance Learners ?",@"What is Distance Learning Support and who can use it?",nil];
        
        idcheck = [NSMutableArray arrayWithObject:@"I am a Distance Learner but need to come onto campus every now and then, I need to know how to obtain a student card."];
        
        sconul = [NSMutableArray arrayWithObject:@"I need a SCONUL Card to access other Universities' Resources near to where I live."];
        
        ceremonies = [NSMutableArray arrayWithObjects:@"When are the Graduation Ceremonies?",@"Can mine and my friends parents sit together at the graduation ceremony?",@"I have a red VIP ticket...Is there parking available for the ceremonies?",@"I forgot to tell you my guest has a disability and it is the week of the ceremonies.  Can you still provide relevant seating for them?",@"Do you provide parking on campus? I/my guest is disabled but does not hold a blue badge, do you have parking for them?",@"I need disabled parking but haven't pre-booked - can I do it the week of the ceremonies?",@"Do you have a map of the Hendon area?",@"How far is the Hendon Campus from Hendon Central station?",@"Can you suggest any hotels in the local area?",@"How do I get to the university from the train station/airport/etc.",@"How long does it take to get to the campus?",@"Do you provide transport from Hendon Central?",@"Can I attend my ceremony if I have a resit/deferral?",@"Are there any cafes/restaurants/pubs in the local area?",@"Are there any special arrangements for children?",@"What is the university address?",@"Is there a cashpoint on campus",@"Do children have to pay for guest tickets? Are they allowed to attend ceremonies?",@"What is the price of a child's ticket?",@"Is there anywhere for guests with children to watch the ceremonies?",@"I have deferred or failed a module.  Can I still attend?",@"Can I attend the ceremonies if I have a debt to the university?",@"I have been accused of academic misconduct.  Can I attend the ceremony?",@"I have just cleared my debt - can I still attend a ceremony?",@"I haven't booked a gown - can I do this on the day?  Will they be available?  How much will they cost?",@"I haven't booked photography - can I do this on the day?  How much will it cost?",@"I need more guest tickets - are these available?",@"I study at a partner college - can I attend a graduation ceremony?",@"Is there disabled toilet access on campus? Where are the other toilets?",@"Do I receive a programme at the ceremonies? I've won a prize- how do I collect it?",@"Is there a reception after the ceremony? What time do I have to be at the ceremony and what do I do when I arrive?",@"Where will my guests sit? Where will I sit?",@"Can I video/photograph the ceremony?",@"Can I buy a DVD of my ceremony?  ",@"Either I or my guest has a disability.  Do I have to let you know?",@"Can I sit next to my friend?",@"All my friends have received an email about the graduation ceremonies and I haven't - why?",@"I can't book in for graduation ceremonies on-line.  Why?",@"I can't attend the graduation ceremony I have been assigned to?  Can I go to a different one?",@"I don't need any guest tickets for graduation- do I still need to register?",@"When is the deadline to book into Graduation ceremonies? I haven't booked into a graduation ceremony by the deadline - what can I do now?",@"I can't find my programme/what I am studying on the Graduation Ceremony Dates and Times list. When is my graduation ceremony?",@"Where are the graduation ceremonies held?",@"I am going to Summer School? Can I attend the graduation ceremonies?",@"I study at the Dubai/Mauritius campus.  Can I attend the UK graduation ceremony?",@"I am in London but want to attend a graduation ceremony in Dubai/Mauritius - is this possible?",@"I've changed my name - what do I need to do if I am graduating?",@"Is there a dress code for graduation ceremonies?",@"Can I see someone in person to speak to about graduation?",@"How do you make a payment for tickets?_x000D_I can't make payment by credit/debit card for my guest tickets for graduation.",@"Why do you charge for guest tickets for graduation ceremonies and what is the price for children's tickets?",@"Why do you charge for guest tickets for graduation ceremonies and what is the price for children's tickets?",@"I am graduating, do I need a ticket for the graduation ceremony? Where do I collect my tickets?",@"What do I do if I have more guests and graduation tickets are not available? Can I bring guests if they don't have a ticket?",@"I/my guest can no longer attend the graduation ceremony.  Can I get a refund on my guest tickets?",@"I or my guest needs a letter for a visa to attend my graduation.  Can you provide one for me? Do you need my guests name for a visa?",@"What documents do I need for my visa for my graduation?",@"How much does it cost to order a graduation gown? How do I order the gown?",@"Do I have to wear a gown? What type of gown will I need to wear?",@"Do I have to wear a gown? What type of gown will I need to wear?",@"I've lost my reference number for my gown.  Will I still be able to collect it?",@"I can no longer attend my ceremony.  Can I get a refund on my gown?",@"How do I fix the hood to my gown? Do I have to wear a hat/mortar board?",@"How do I book photography? Can I just have photographs taken and not attend the ceremony?",@"Do I have to use your photographers?  How much do photos cost?_x000D_Can I take my own photos?",@"I can no longer attend my ceremony.  Can I get a refund on the photography I have paid for?",@"Can I have my photograph taken with the honorary graduate?",@"What happens during the ceremony? Can I bring food or drink into the ceremony?",@"What do I do if I can't shake hands with the Dean of the School?", nil];
        
        certificates = [NSMutableArray arrayWithObjects:@"When and where do I get my certificate?",@"I have been expelled.  Am I still entitled to a transcript and certificate?",@"How can I get a transcript?_x000D__x000D_How can I get a Diploma Supplement?",@"I have completed my programme, but the University has not sent my certificate",@"I would like my certificate to be sent to a different address",@"How do I apply for a replacement certificate?",@"When will I receive my certificate?",@"Can I change my name on the certificate?",@"I am an exchange student and require a transcript of the modules completed at Middlesex University.",@"I need a letter to confirm my qualification",@"Can I change my name on the certificate?",@"Is there a charge for a replacement certificate?",@"The University has posted my certificate but I have not received it, what can I do?",@"I have not received my certificate, what is the tracking number?",@"I have been expelled from the University.  Am I entitled to a certificate or transcript / diploma supplement?",@"I would like my certificate to be sent to a different address",@"When can l expect to receive my certificate from Middlesex?", nil];
        
        alumini = [NSMutableArray arrayWithObject:@"I have just graduated and want to register as Alumni"];
        
        diploma = [NSMutableArray arrayWithObject:@"How can I get a Diploma Supplement (transcript)?"];
        
        ills = [NSMutableArray arrayWithObjects:@"Is there a charge for Inter Library loan requests?",@"How can l request books and articles that are not in the Middlesex Collection?",@"How can l request a book from another institution",@"Why do I have to pay for my journal article?",@"How do I get an Inter-Library Loan?",@"I have logged into myUniHub and clicked on the link in myLibrary portlet but when I do my search, the journal article could not be found.", nil];
        
        container = [[NSMutableArray alloc] init];
        [container addObjectsFromArray:DLSregform];
        [container addObjectsFromArray:DLSsupport];
        [container addObjectsFromArray:idcheck];
        [container addObjectsFromArray:sconul];
        [container addObjectsFromArray:ceremonies];
        [container addObjectsFromArray:certificates];
        [container addObjectsFromArray:alumini];
        [container addObjectsFromArray:diploma];
        [container addObjectsFromArray:ills];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [mainview addSubview:searchtable];
     menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
     [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
   // faqmainview.frame = CGRectMake(0, 190, 1024, 240);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil
//                                    repeats:NO];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newappbg1.png"]];
    //faqmainview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]];
    //answer.layer.backgroundColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]] CGColor];
     //[parentview setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]]];
//    UIView *backView = [[UIView alloc] init];
//    [backView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.png"]]];
//    [ [UISearchBar appearance]setBackgroundImage:[UIImage imageNamed:@"appbg.png"]];
    //[searchtable setBackgroundView:backView];
    searchtable.separatorStyle = NO;
    isSearching = NO;
    filteredList = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    animation.animationImages = [NSArray arrayWithObjects:
                                 
                                 [UIImage imageNamed:@"t1.png"],
                                 
                                 [UIImage imageNamed:@"t2.png"],[UIImage imageNamed:@"t3.png"],[UIImage imageNamed:@"t4.png"],[UIImage imageNamed:@"t5.png"],[UIImage imageNamed:@"t6.png"],[UIImage imageNamed:@"t7.png"],[UIImage imageNamed:@"t8.png"],[UIImage imageNamed:@"t9.png"],[UIImage imageNamed:@"t10.png"],nil];
    [animation setAnimationRepeatCount:0];
    
    animation.animationDuration = 1;
    
   [animation startAnimating];
//    [faqmainview addSubview:animation];
//    [faqmainview addSubview:searchtable]; 
    check = 1;
    
    [self.view setFrame:CGRectMake(20,0,self.view.frame.size.width,self.view.frame.size.height)];
    
//    faqanimation.animationImages = [NSArray arrayWithObjects:
//                                     [UIImage imageNamed:@"f1.png"],[UIImage imageNamed:@"f2.png"],[UIImage imageNamed:@"f3.png"],[UIImage imageNamed:@"f4.png"],[UIImage imageNamed:@"f5.png"],[UIImage imageNamed:@"f6.png"],[UIImage imageNamed:@"f7.png"],[UIImage imageNamed:@"f8.png"],[UIImage imageNamed:@"f9.png"],[UIImage imageNamed:@"f10.png"],[UIImage imageNamed:@"f11.png"],[UIImage imageNamed:@"f12.png"],[UIImage imageNamed:@"f13.png"],nil];
//    [faqanimation setAnimationRepeatCount:0];
//    
//    faqanimation.animationDuration = 1;
//    
//    [faqanimation startAnimating];
//    
//    logoanimation.animationImages = [NSArray arrayWithObjects:
//                                     [UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l2.png"],[UIImage imageNamed:@"l3.png"],[UIImage imageNamed:@"l4.png"],[UIImage imageNamed:@"l5.png"],[UIImage imageNamed:@"l6.png"],[UIImage imageNamed:@"l7.png"],[UIImage imageNamed:@"l8.png"],[UIImage imageNamed:@"l9.png"],[UIImage imageNamed:@"l10.png"],[UIImage imageNamed:@"l11.png"],[UIImage imageNamed:@"l12.png"],[UIImage imageNamed:@"l13.png"],[UIImage imageNamed:@"l14.png"],[UIImage imageNamed:@"l15.png"],[UIImage imageNamed:@"l16.png"],[UIImage imageNamed:@"l17.png"],[UIImage imageNamed:@"l18.png"],[UIImage imageNamed:@"l19.png"],[UIImage imageNamed:@"l20.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l21.png"],[UIImage imageNamed:@"l22.png"],[UIImage imageNamed:@"l23.png"],[UIImage imageNamed:@"l24.png"],[UIImage imageNamed:@"l25.png"],[UIImage imageNamed:@"l26.png"],[UIImage imageNamed:@"l27.png"],[UIImage imageNamed:@"l28.png"],[UIImage imageNamed:@"l29.png"],[UIImage imageNamed:@"l30.png"],[UIImage imageNamed:@"l31.png"],[UIImage imageNamed:@"l32.png"],[UIImage imageNamed:@"l33.png"],[UIImage imageNamed:@"l34.png"],[UIImage imageNamed:@"l35.png"],[UIImage imageNamed:@"l36.png"],[UIImage imageNamed:@"l37.png"],[UIImage imageNamed:@"l38.png"],[UIImage imageNamed:@"l39.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],[UIImage imageNamed:@"l1.png"],nil];
//    [logoanimation setAnimationRepeatCount:0];
//    
//    logoanimation.animationDuration = 5;
//    
//    [logoanimation startAnimating];
//    
    
    
//    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
//    
//    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
//    
//    searchDisplayController.delegate = self;
//    searchDisplayController.searchResultsDataSource = self;
    // Do any additional setup after loading the view from its nib.
}

-(void)targetMethod:(NSTimer *)t
{
    [UIView animateWithDuration:0.25
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         faqmainview.frame = CGRectMake(0, 314, 1024, 240);
                     }
                     completion:^(BOOL finished){
                     }];
    [self.view addSubview:faqmainview];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//         [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
//}
- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    [self.view setFrame:CGRectMake(-200,0,self.view.frame.size.width,self.view.frame.size.height)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(20,0,self.view.frame.size.width,self.view.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    NSLog(@"searching");
    //When the user taps the search bar, this means that the controller will begin searching.
    isSearching = YES;
    searchstart = TRUE;
   answer.hidden = YES;
    searchtable.hidden = NO;
    lbl.hidden = YES;
    parentview.hidden = YES;
      self.searchDisplayController.searchBar.showsCancelButton = YES;
    
    UIButton *cancelButton = nil;
    
    for (UIView *subView in self.searchDisplayController.searchBar.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UIButton")]) {
            
            cancelButton = (UIButton*)subView;
            
        }
        
    }
    
   // [cancelButton setTitle:@"" forState:UIControlStateNormal];
    CGRect buttonFrame = cancelButton.frame;
    buttonFrame.size.height = 1;
    buttonFrame.size.width = 1;
    [cancelButton setFrame:buttonFrame];
    cancelButton.hidden = YES;
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"appbg.png"] forState:UIControlStateNormal];
      [self performSelector:@selector(removeOverlay) withObject:nil afterDelay:.01f];
}

- (void)removeOverlay
{
    [[self.view.subviews lastObject] removeFromSuperview];
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    //When the user taps the Cancel Button, or anywhere aside from the view.
    isSearching = NO;
    searchstart = FALSE;
    searchtable.hidden = YES;
    
    
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
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // DO ur operations
//    myfaq = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
//    [self presentViewController:myfaq animated:YES completion:nil];
    //[self.navigationController pushViewController:myfaq animated:YES];
    //  NSLog(@"came");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (isSearching) {
        //If the user is searching, use the list in our filteredList array.
        return [filteredList count];
    } else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.numberOfLines = 3;
    
    NSString *title;
    if (isSearching && [filteredList count]) {
        //If the user is searching, use the list in our filteredList array.
        title = [filteredList objectAtIndex:indexPath.row];
    } else {
        //title = [container objectAtIndex:indexPath.row];
        title = @"";
    }
    if( searchstart)
    {
        cell.textLabel.text = title;
    }
    else {
        cell.textLabel.text = @"";
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *getcell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *celltext;
    celltext = getcell.textLabel.text;
    if([celltext isEqualToString:@"Where can l find a copy of the Distance Learning Services Unit registration form?"])
    {
        NSLog(@"Cell working");
        answer.hidden = NO;
        lbl.hidden = NO;
        parentview.hidden = NO;
        lbl.text = celltext;
        [self.searchDisplayController setActive:NO];
        answer.text = @"The Distance Learning Support aims to provide as close a Learning Resources Service as possible to Middlesex University students who study on campus. This includes access to Middlesex university hardcopy collection of books and journal articles, as well as inter library loan requests via the British Library for material that we do not stock. Go to: http://unihub.mdx.ac.uk/study/library/services/distanceServices for Distance Learners are listed here.  To use the service, you must be fully enrolled with the University and registered with the Learning Resources service.  Please complete the registration form [ https://www.isis.mdx.ac.uk/download/dl_reg_frm.html ].Enter your Network/myUniHub user details to electronically verify yourself and automatically submit your form.[DLSU]";
        
        
    }
    if([celltext isEqualToString:@"I need to register with the DLSU Distance Learning Support Unit."])
    {
        lbl.hidden = NO;
        parentview.hidden = NO;
        lbl.text = celltext;
        answer.hidden = NO;
        [self.searchDisplayController setActive:NO];
        answer.text = @" Distance Learning Support aims to provide as close a Learning Resources Service as possible to Middlesex University students who study on campus. This includes access to Middlesex university hardcopy collection of books and journal articles, as well as inter library loan requests via the British Library for material that we do not stock. Go to: http://unihub.mdx.ac.uk/study/library/services/distance Services for Distance Learners are listed here.  To use the service, you must be fully enrolled with the University and registered with the Learning Resources service.  Please complete the registration form [ https://www.isis.mdx.ac.uk/download/dl_reg_frm.html ]. Enter your Network/myUniHub user details to electronically verify yourself and automatically submit your form. [DLSU]";
        
        
    }
    if([celltext isEqualToString:@"When are the Graduation Ceremonies?"])
    {
        answer.hidden = NO;
        lbl.hidden = NO;
        parentview.hidden = NO;
        lbl.text = celltext;
           [self.searchDisplayController setActive:NO];
        answer.text = @"An invitation will posted to your home address at the start of April. If you have a debt to the University you will not be able to attend a ceremony in the year you graduate but will be able to attend the following year when the debt has cleared. For full details go to: http://unihub.mdx.ac.uk/mdx/graduation/index.aspx  [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
    }
    if([celltext isEqualToString:@"Can mine and my friends parents sit together at the graduation ceremony?"])
    {
        answer.hidden = NO;
        answer.hidden = NO;
        lbl.hidden = NO;
        parentview.hidden = NO;
        lbl.text = celltext;
           [self.searchDisplayController setActive:NO];
        answer.text = @"Only students guests with disabilities have allocated seating, all other seating is unallocated so as long as they go into the marquee together they will be sitting together   [GRAD] Keywords: Graduation, Ceremonies, Ceremony";
    }
    if([celltext isEqualToString:@"When and where do I get my certificate?"])
    {
        answer.hidden = NO;
        answer.hidden = NO;
        lbl.hidden = NO;
        parentview.hidden = NO;
        lbl.text = celltext;
           [self.searchDisplayController setActive:NO];
        answer.text = @"Certificates are posted out up to four months after the date you are awarded your degree - not from when you attend a ceremony.  If you have queries about your certificate please contact Shirland McKoy on s.mckoy@mdx.ac.uk or 0208 411 639 [GRAD] Keywords: Graduation, Ceremonies, Ceremony, Certificate";
    }
}

-(IBAction)homeaction
{
    Design_3_Final_ViewController_iPad *homeview = [[Design_3_Final_ViewController_iPad alloc]initWithNibName:@"Design_3_Final_ViewController_iPad" bundle:nil];
    [self presentViewController:homeview animated:NO completion:nil];
}
-(IBAction)myprofile
{
    MyprofileViewController *myprofileview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
    [self presentViewController:myprofileview animated:NO completion:nil];
}
-(IBAction)myquery
{
    MyQueryViewController *myqueryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    [self presentViewController:myqueryview animated:NO completion:nil];
}
-(IBAction)creatlog
{
    NewTicketViewController *newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
   // newticket.modalPresentationStyle = UIModalPresentationFormSheet;
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:newticket animated:NO completion:nil];
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
-(IBAction)directsearch
{
    MyFAQViewController *faq = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
    [self presentViewController:faq animated:NO completion:nil];
}
-(void)viewDidUnload
{
   
}
-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
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
}-(IBAction)showmainmenu
{
    if(mainview.frame.origin.x == 0)
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
                         [mainview setFrame:CGRectMake(menuscrollview.frame.size.width, mainview.frame.origin.y, mainview.frame.size.width, mainview.frame.size.height)];
                     }];
    menuscrollview.hidden = NO;
}
-(void)hidemenu
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [mainview setFrame:CGRectMake(0, mainview.frame.origin.y, mainview.frame.size.width, mainview.frame.size.height)];
                     }];
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
