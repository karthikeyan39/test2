//
//  Design_3_Final_ViewController_iPad.m
//  Proretention1.1
//
//  Created by sandip sayaji kote on 05/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//
#import "AppDelegate.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "Appointment_ViewController_ipad.h"
#import "ExpandableNavigation.h"
#import "CKCalendarView.h"
#import "AppointmentsViewController.h"
#import "JHTickerView.h"
#import "customcellclass.h"
#import "NewsViewController.h"
#import "newscustomcell.h"
#import "EventsViewController.h"
#import "NewLoginViewController.h"
#import "Campus.h"
#import "WebviewViewController.h"
#import "SupportViewController.h"
#import "MarketViewController.h"
#import "CareerViewController.h"
#import "ChatViewController.h"
#import "FAQSearchViewController.h"

@interface Design_3_Final_ViewController_iPad ()<CKCalendarDelegate>
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSArray *disabledDates;
@property(nonatomic, strong)NSDate *selecteddate;
@property(nonatomic, strong)NSString *datestr;

@end

@implementation Design_3_Final_ViewController_iPad

@synthesize horizMenu = _horizMenu;
@synthesize items = _items;
@synthesize selectionItemLabel;
@synthesize Username,userPhoto;
@synthesize HomeButton;

@synthesize NavigationBar;

@synthesize button1;
@synthesize button2;
//@synthesize button3;
//@synthesize button4;
//@synthesize button5;
@synthesize main;
@synthesize alertbutton;
@synthesize  pressbutton;
@synthesize navigation;
@synthesize myView,myView2,Detail_Image_ipad;
@synthesize ViewdisableImg;


@synthesize aButton1,aButton2,aButton3,aButton4,aButton5;
@synthesize ProfileView,Profiletable,querytable;

@synthesize selecteddate = _selecteddate;
@synthesize datestr;
@synthesize popoverController;
@synthesize chatbutton;
@synthesize actionSheet;
//..............................................//
@synthesize View1,View2,View3,View4,tableview2,tableview3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [self initializeCalendar];
    eventtilearray = [[NSMutableArray alloc]init];
    myeventsdatearray = [[NSMutableArray alloc]init];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Commit");
    recent = YES;
    academicbutton.alpha = 0.5;
    adminbutton.alpha = 0.5;
    recentbutton.alpha = 1;
//    AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    if (app.activealarm)
//    {
////        UIAlertView *alerts = [[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"" otherButtonTitles:@"", nil];
////        [alerts show];
//         [self alertaction:alertbutton];
//    }
    newsfeed.layer.borderWidth= 2;
    newsfeed.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    newsfeed.layer.cornerRadius = 8;
    mainview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
    test1 = [[NSMutableArray alloc]init];
    testtitlearray = [[NSMutableArray alloc]init];
    testdatearray = [[NSMutableArray alloc]init];
    EKEventStore *evstore = [[EKEventStore alloc] init];
    [self findOrCreateEvent:evstore];
//    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetMethod:)userInfo:nil repeats:NO];
    parentnews.layer.borderWidth= 2;
    parentnews.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    parentnews.layer.cornerRadius = 8;
    parentapp.layer.borderWidth= 2;
    parentapp.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    parentapp.layer.cornerRadius = 8;

    parentevents.layer.borderWidth= 2;
    parentevents.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    locatorview.layer.borderWidth= 2;
    locatorview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    locatorview.layer.cornerRadius = 8;
    mycommunityview.layer.borderWidth= 2;
    mycommunityview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    mycommunityview.layer.cornerRadius = 8;
    
//    mycontactstableview.layer.borderWidth= 2;
//    mycontactstableview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    mycontactstableview.layer.cornerRadius = 8;

//    mainview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newappbg.png"]];

    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if (! [defaults boolForKey:@"notFirst1"])
    {
        [self performSelector:@selector(delay1) withObject:nil afterDelay:0.4];          
        [defaults setBool:YES forKey:@"notFirst1"];
    }
    else
    {
        btn1.hidden = NO;
        btn2.hidden = NO;
        btn3.hidden = NO;
        btn4.hidden = NO;
        btn5.hidden = NO;
        btn6.hidden = NO;
    }
    menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newmainbgs.png"]];
    mainview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar2 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar3 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar4 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar5 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
//    newsfeed.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newappbg.png"]];
//    
//    eventstable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newappbg.png"]];
    Profiletable.dataSource = self;
    Profiletable.delegate = self;

    [self.ProfileView addSubview:Profiletable];

    tableview2.layer.borderWidth = 2;
    tableview2.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    tableview3.layer.borderWidth = 2;
    tableview3.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    querytable.layer.borderWidth = 2;
    querytable.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    View4.scrollEnabled = YES;
    View1.layer.borderWidth = 2;
    View1.layer.borderColor = [[UIColor blackColor] CGColor];
    View2.layer.borderWidth = 2;
    View2.layer.borderColor = [[UIColor blackColor] CGColor];
    View2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"feed1.png"]];
    View3.layer.borderWidth = 2;
    View3.layer.borderColor = [[UIColor blackColor] CGColor];
   // View3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"query3.png"]];
    View4.layer.borderWidth = 2;
    View4.layer.borderColor = [[UIColor blackColor] CGColor];

    //queryaction
    
    querytable.delegate = self;
    querytable.dataSource = self;
    View4.contentSize = CGSizeMake( 0,800);
    // Do any additional setup after loading the view from its nib.
    newsfeed.delegate = self;
    newsfeed.dataSource = self;
    parentwebview.hidden = YES;
  //  newsarray = [[NSMutableArray alloc]init];
    newsarray = [[NSMutableArray alloc ] initWithObjects:@" Next generation of designers showcase their work",@"Fine artist celebrates success after rekindling her love of art",@"Lifetime achievement award for visiting professor",@"Hundreds of guests wowed by Jubilee performance",@"North London art students’ work goes on public display", nil];
    selectedValueIndex = 0;
    eventstable.delegate = self;
    eventstable.dataSource = self;
    imagearray = [NSArray arrayWithObjects:@"newsimages1.jpg",@"newsimages2.jpg",@"nonews.png",@"newsimages3.jpg", @"newsimages4.jpg",  nil];
    newevents = [NSArray arrayWithObjects:@"Inaugural lecture: Professor Nick",@"Corporate Real Tennis Event",@" Inaugural lecture: Professor Simi Boyce",@" Staff Research Showcase",@" Determinants of innovation in Knowledge Intensive Business Services",nil];
    neweventsdate = [NSArray arrayWithObjects:@"Thursday 6 June 2013 Time: 4.30-7pm",@"Friday 21 June 2013 Time: 3 - 6.30 pm",@"Thursday 27 June 2013 Time:4.30 - 7 pm", @"Thursday 20 June 2013 Time 10.30 am - 6 pm",@"29th May Time 4.30 - 6.30 pm",nil];
     detailedarray = [[NSArray alloc]initWithObjects:@"Upcoming designers from our University will show off their work at the Old Truman Brewery on London’s famous Brick Lane from 8-10 June 2013.More than 500 final-year artists and designers in disciplines including photography, fashion, animation, product design, interior architecture, fine art and illustration will display their final year projects at the trendy east London venue.The four-day event titled “Laboratory” will see over 5000 visitors come through the door to discover the latest talent in art and design.John will be exhibiting his football inspired illustrations that have been shortlisted and highly commended for the Macmillan Children’s Book Illustratio",@"Fine artist Kelly Moore will see her second solo exhibition open this weekend in Glasgow after rekindling her love of art only five years ago when her daughter began studying the subject.After running a successful physiotherapy practice in London for 19 years and being at the peak of her career, Kelly relinquished the comfort and stability of the familiar pattern of steady work and  found her artistic ‘calling’ reawakened by her daughter.Five years ago, with support of her family, Kelly set about a complete career change and decided to study for both an undergraduate and postgraduate degree in Fine Art at Middlesex University and the emerging artist is now gaining a large following.University student Kelly Moore who grew up in Glasgow said:  “'It was when my teenage daughter Alex started to take life drawing classes that I felt inspired to start to draw again.  And now she has also recently achieved a degree in illustration from ABC University.”Her exhibition titled Still Sounds Scotland Street 2013 will run from Saturday 1 June - 11 August 2013 at the Scotland Street School Museum.  Kelly’s mixed media installation includes textile prints, photographs, video and sound, and offers a unique insight into the lives of the former pupils of Scotland Street School, local residents and Clydeside shipyard workers.It examines the period the school was open, from the early 1900's to the late seventies. It is one of the latest exhibitions by Scottish artist Margaret Moore, exploring history and heritage in the context of an increasingly globalised world.",@"Professor James, Visiting Professor at the University’s Institute for Work Based Learning, will receive a Lifetime Achievement Award at the British Psychological Society’s Annual Conference, to be held in April 2010.The British Psychological Society Awards were established in 2006, to recognise distinctive and exemplary contributions to psychological knowledge. The Lifetime Achievement Award is presented in recognition of outstanding personal achievements and significant contributions to the advancement of psychological knowledge. Professor Lane has been credited with bringing about ‘the professionalisation of counselling psychology’.As Research Director of the International Centre for the Study of Coaching (ICSC) at Middlesex, Professor Lane has made significant contributions to leading-edge research in education, coaching and management issues. He also set up structures for specialised awards in psychotherapy for the European Federation of Psychologists Associations, which were recently adopted by 34 countries.",@"University's Quadrangle was transformed into a top class concert venue last night, with hundreds of guests attending two performances arranged to celebrate the Queen's Jubilee.Performers including world renowned soprano Dame Emma Kirkby wowed the audience in Henry Purcell's 'Dido and Aeneas', joined by The Baroque Collective, led by Julia Bishop, the Singers and the Dance Ensemble. The dances were performed with original choreography by Louise Kelsey.The BBC singers then combined with the University's choir for the second work, Carl Orff's 'Carmina Burana'. This was directed by Adrian Peacock from BBC Music. The One Voice Children’s Choir from Barnet Music Service, whose members are drawn from primary and secondary schools across the Borough of Barnet, also took part.", @"Some of London’s best up and coming artists will be showcasing work which tackles issues like women’s rights in Afghanistan and art as a form of protest in Britain, at an exhibition to be launched in Hendon.For the first time the university students will be able to showcase their work in the £80m Grove building, University’s state-of-the-art centre for creative courses.The work of the Fine Art students from across north London aims to challenge established views, presenting a simulating and inventive response to the world. Final year Fine Art and Critical Theory student Harriet Dopson said: “It will be a really exciting show, there is no formal brief so all the work is self led which produces some outstanding results. Myself and the other students on the course have used an exciting range of media to produce their work as we respond and question the world around us.The students will also be running a workshop giving the public an opportunity to take part in and discuss the exhibition.Admission is free.",nil];
    datearray = [[NSArray alloc]initWithObjects:@"3 Seconds ago",@"5 Minutes ago",@"2 Hours 30 Minutes ago",@"1 Day ago",@"3 Days ago", nil];
    
    communitynamearray = [[NSArray alloc]initWithObjects:@"Person1",@"Person2",@"Person3",@"Person4",@"Person5",@"Person6",nil];
    communitydepartmentarray = [[NSArray alloc]initWithObjects:@"Department1",@"Department2",@"Department3",@"Department4",@"Department5",@"Department6", nil];
    communityscroll.contentSize = CGSizeMake(0, 1200);
    communityscroll.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    communityscroll.layer.borderWidth = 2;
    communityscroll.layer.cornerRadius = 8;
    
    mytimetableview.contentSize = CGSizeMake(0, 700);
    mytimetableview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    mytimetableview.layer.borderWidth = 2;
    mytimetableview.layer.cornerRadius = 8;
    
    mycontactstableview.dataSource = self;
    mycontactstableview.delegate = self;
    
    adminnamearray = [NSArray arrayWithObjects:@"Ms Carla Ben",@"Mr Johnson Green",@"Ms Zara White",@"Mr Kevin Gabon", @"Mr Higgin James",@"Ms Nicola Boisete", nil];
    adminchatimagearray = [NSArray arrayWithObjects:@"l1.jpg",@"pr1.jpg",@"l2.jpg",@"pr2.jpg",@"pr3.jpg",@"l3.jpg", nil];
    adminrolearray = [NSArray arrayWithObjects:@"Department Coordinator",@"Program Administrator",@"Program Administrator",@"Program Administrator",@"Head of Department Administration",@"Program Manager", nil];
    adminemailarray = [NSArray arrayWithObjects:@"Carla.ben@cl.ac.uk",@"Johnson.green@cl.ac.uk", @"Zara.white@cl.ac.uk",@"Kevin.gabon@cl.ac.uk",@"Higgin.james@cl.ac.uk",@"Nicola.boisete@cl.ac.uk", nil];
    adminphone = [NSArray arrayWithObjects:@"020-7010-4516",@"020-7010-5145",@"020-7010-4245",@"020-7010-3245",@"020-7010-2124",@"020-7010-1235", nil];
    adminstatusarry = [NSArray arrayWithObjects:@"green.png",@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png",nil];
    
    academicnamearray  = [NSArray arrayWithObjects:@"Dr Franklin Lon",@"Professor Maria",@"Dr Walker Gibbs",@"Dr Richard Coles",@"Martin Archer", nil];
    academicchatimagearray = [NSArray arrayWithObjects:@"pr4.jpg",@"l2.jpg",@"pr6.jpg", @"pr7.jpg",@"pr8.jpg", nil];
    academicrolearray = [NSArray arrayWithObjects:@"Professor & Department Head",@"Professor",@"Senior Lecturer",@"Lecturer",@"Student Representative", nil];
    academicemailarray = [NSArray arrayWithObjects:@"Franklin.lon@cl.ac.uk",@"maria@cl.ac.uk",@"Walker.gibbs@cl.ac.uk",@"Richard.coles@cl.ac.uk",@"Martin.arch@cl.ac.uk", nil];
    academicphone = [NSArray arrayWithObjects:@"020-7010-7250",@"020-7010-7241",@"020-7010-7002",@"020-7010-7023",@"020-7010-2412", nil];
    academicstatusarray = [NSArray arrayWithObjects:@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png", nil];
    
    
    recentlynamearray  = [NSArray arrayWithObjects:@"Ms Nicola Boisete",@"Dr Franklin Lon", nil];
    recentlychatimagearray = [NSArray arrayWithObjects:@"l3.jpg",@"pr4.jpg", nil];
    recentlyemailarray = [NSArray arrayWithObjects:@"Nicola.boisete@cl.ac.uk",@"Franklin.lon@cl.ac.uk", nil];
    recentlyrolearray = [NSArray arrayWithObjects:@"Program Manager",@"Professor & Department Head", nil];
    recentstatusarry = [NSArray arrayWithObjects:@"green.png", @"redround.png", nil];
    recentphone = [NSArray arrayWithObjects:@"020-7010-1235", @"020-7010-7250",nil];
    
    namearray = [[NSMutableArray alloc]initWithObjects:@"Ms Carla Ben",@"Mr Johnson Green",@"Ms Zara White",@"Mr Kevin Gabon", @"Mr Higgin James",@"Ms Nicola Boisete",@"Dr Franklin Lon",@"Professor Maria",@"Dr Walker Gibbs",@"Dr Richard Coles",@"Martin Archer",nil];
    chatimagearray = [[NSMutableArray alloc]initWithObjects:@"Person1.JPG",@"person2.JPG",@"person3.JPG",@"person4.jpg",@"Person1.JPG",@"person2.JPG",@"person3.JPG",@"person4.jpg",@"Person1.JPG", @"person2.JPG",@"person3.JPG",nil];
    departmentarray = [[NSMutableArray alloc]initWithObjects:@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Academic Staff",@"Academic Staff",@"Academic Staff",@"Academic Staff",@"Academic Staff", nil];
    rolearray = [[NSMutableArray alloc]initWithObjects:@"Department Coordinator",@"Program Administrator",@"Program Administrator",@"Program Administrator",@"Head of Department Administration",@"Program Manager",@"Professor & Department Head",@"Professor",@"Senior Lecturer",@"Lecturer",@"Student Representative", nil];
    emailarray = [[NSMutableArray alloc]initWithObjects:@"Carla.ben@cl.ac.uk",@"Johnson.green@cl.ac.uk", @"Zara.white@cl.ac.uk",@"Kevin.gabon@cl.ac.uk",@"Higgin.james@cl.ac.uk",@"Nicola.boisete@cl.ac.uk",@"Franklin.lon@cl.ac.uk",@"maria@cl.ac.uk",@"Walker.gibbs@cl.ac.uk",@"Richard.coles@cl.ac.uk",@"Martin.arch@cl.ac.uk",nil];
    phonenumberarray = [[NSMutableArray alloc]initWithObjects:@"020-7010-4516",@"020-7010-5145",@"020-7010-4245",@"020-7010-3245",@"020-7010-2124",@"020-7010-1235",@"020-7010-7250",@"020-7010-7241",@"020-7010-7002",@"020-7010-7023",@"020-7010-2412", nil];
}

-(void)targetMethod:(NSTimer *)t
{
    [UIView animateWithDuration:0.1
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         mainview.frame = CGRectMake(0, 128, 1024, 600);
                     }
                     completion:^(BOOL finished){
                     }];
    [self.view addSubview:mainview];
}
-(void)initializeCalendar
{
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.dataSource = self;
    calendar.delegate = self;
  //  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openAppointments:)];
    self.dateFormatter = [[NSDateFormatter alloc] init];
  //  [calendar addGestureRecognizer:gestureRecognizer];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    //gestureRecognizer.numberOfTapsRequired =2;
//    if (gestureRecognizer.numberOfTapsRequired > 1)
//    {
//            [self ]
//    }
    calendar.onlyShowCurrentMonth = NO;
    calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    calendar.frame = CGRectMake(0, 0, 220, 220);
    [self.appointmentButton addSubview:calendar];
}

-(void)delay1
{
    btn1.hidden = NO;
    lbl1.hidden = NO;
   [self performSelector:@selector(delay2) withObject:nil afterDelay:0.3];
}

-(void)delay2
{
    btn2.hidden = NO;
    lbl2.hidden = NO;
   [self performSelector:@selector(delay3) withObject:nil afterDelay:0.3];
}
-(void)delay3
{
    btn3.hidden = NO;
    lbl3.hidden = NO;
    [self performSelector:@selector(delay4) withObject:nil afterDelay:0.3];
}
-(void)delay4
{
    btn4.hidden = NO;
    lbl4.hidden = NO;
    [self performSelector:@selector(delay5) withObject:nil afterDelay:0.3];
}
-(void)delay5
{
    btn5.hidden = NO;
    lbl5.hidden = NO;
   [self performSelector:@selector(delay6) withObject:nil afterDelay:0.3];
}
-(void)delay6
{
    btn6.hidden = NO;
    lbl6.hidden = NO;
    [self performSelector:@selector(delay7) withObject:nil afterDelay:0.3];
}
-(void)delay7
{
    btn7.hidden = NO;
    [self performSelector:@selector(delay8) withObject:nil afterDelay:0.3];
}
-(void)delay8
{
    btn8.hidden = NO;
    [self performSelector:@selector(delay9) withObject:nil afterDelay:0.3];
}
-(void)delay9
{
    btn9.hidden = NO;
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.horizMenu setSelectedIndex:5 animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
   self.button2 = nil;
    self.button3 = nil;
    self.button4 = nil;
    self.button5 = nil;
    self.main = nil;
    self.navigation = nil;
    self.selectionItemLabel = nil;
    myprofileview = nil;
    myqueryview = nil;
    myfaqview = nil;
    newticket = nil;
}
-(void)test
{
    AppointmentsViewController *appointmentController = [[AppointmentsViewController alloc]init];
    [self.navigationController pushViewController:appointmentController animated:YES];
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
    alertbutton.hidden = YES;
    AudioServicesRemoveSystemSoundCompletion(SoundID);
    AudioServicesDisposeSystemSoundID(SoundID);
    [alarm stopAnimating];
}

-(IBAction)myprofile
{
    myprofileview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
//    AppDelegate *apps = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    apps.alert ++;
//    [[NSUserDefaults standardUserDefaults] setInteger:apps.alert forKey:@"activealarm"];
//    NSLog(@"$$$$$$$$$$ %d",apps.alert);
    [self presentViewController:myprofileview animated:NO completion:nil];
    
}
-(IBAction)myquery
{
    myqueryview = [[MyQueryViewController alloc]initWithNibName:@"MyQueryViewController" bundle:nil];
    //myqueryview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:myqueryview animated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)myfaq
{    
//    myfaqview = [[MyFAQViewController alloc]initWithNibName:@"MyFAQViewController" bundle:nil];
//    //myfaqview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:myfaqview animated:NO completion:nil];
//    //[self dismissViewControllerAnimated:YES completion:nil];
    FAQSearchViewController *fa = [[FAQSearchViewController alloc]initWithNibName:@"FAQSearchViewController" bundle:nil];
    [self presentViewController:fa animated:NO completion:nil];
}
-(IBAction)creatlog
{
     newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
    //newticket.modalPresentationStyle = UIModalPresentationFormSheet ;
    newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self hidemenu];
    [self presentViewController:newticket animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//.........................................................................................
#pragma mark HorizMenu Data Source
- (UIImage*) selectedItemImageForMenu:(MKHorizMenu*) tabMenu
{
    return [[UIImage imageNamed:@"ButtonSelected"] stretchableImageWithLeftCapWidth:16 topCapHeight:0];
}

- (UIColor*) backgroundColorForMenu:(MKHorizMenu *)tabView
{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"MenuBar"]];
}

- (int) numberOfItemsForMenu:(MKHorizMenu *)tabView
{
    return [self.items count];
}

- (NSString*) horizMenu:(MKHorizMenu *)horizMenu titleForItemAtIndex:(NSUInteger)index
{
    return [self.items objectAtIndex:index];
}

-(void) horizMenu:(MKHorizMenu *)horizMenu itemSelectedAtIndex:(NSUInteger)index
{
    self.selectionItemLabel.text = [self.items objectAtIndex:index];
}

//.........................................................................................

- (IBAction) touchMenuItem:(id)sender {
    
    check=1;
    UIButton *instanceButton = (UIButton*)sender;
    if(instanceButton.tag==0)
    {
       
        EKEventStore *store = [[EKEventStore alloc] init];
        
        if([store respondsToSelector:@selector(requestAccessToEntityType:completion:)])
        {
            [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            if (granted){
                dispatch_async(dispatch_get_main_queue(), ^{ [self createEventAndPresentViewController:store];
                    });
                }
            }];
        }
        else
        {

            [self createEventAndPresentViewController:store];
        }
}
    if(instanceButton.tag==1)
    {
        newticket = [[NewTicketViewController alloc]initWithNibName:@"NewTicketViewController" bundle:nil];
        newticket.modalPresentationStyle = UIModalPresentationFormSheet;
        newticket.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:newticket animated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];

    }    
    if( self.navigation.expanded ) {
        button1.hidden=YES;
        button2.hidden=YES;
        
        [self.navigation collapse];
        ViewdisableImg.hidden=YES;
//        ViewdisableImg.userInteractionEnabled=NO;
    }
}
-(IBAction)menuButton:(id)sender
{
    if(check==1)
    {
        check=0;
        ViewdisableImg.hidden=NO;
        button1.hidden=NO;
        button2.hidden=NO;
        [self.view bringSubviewToFront:ViewdisableImg];
        
        [self.view bringSubviewToFront:button1];
        [self.view bringSubviewToFront:button2];
        [self.view bringSubviewToFront:main];
    }
    else
    {
        check=1;
        ViewdisableImg.hidden=YES;
        button1.hidden=YES;
        button2.hidden=YES;
    }
}

-(IBAction)Home:(id)sender
{
    UIImage * buttonImage = [UIImage imageNamed:@"MyProfile.png"];
    [aButton1 setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    UIImage * buttonImage1 = [UIImage imageNamed:@"Myfeedback.png"];
    [aButton2 setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
    
    UIImage * buttonImage2 = [UIImage imageNamed:@"MyQuery.png"];
    [aButton3 setBackgroundImage:buttonImage2 forState:UIControlStateNormal];
    
    UIImage * buttonImage4 = [UIImage imageNamed:@"MyFAQ.png"];
    [aButton4 setBackgroundImage:buttonImage4 forState:UIControlStateNormal];

        View1.hidden=YES;
        View2.hidden=YES;
        View3.hidden=YES;
        ProfileView.hidden=YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)BackButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)CreateTicket_ipad:(id)sender
{
//    newTicket_window *tick=[[newTicket_window alloc]init];
//    tick.modalTransitionStyle=UIModalTransitionStylePartialCurl;
//    [self presentViewController:tick animated:YES completion:nil];
}

- (IBAction)CreateAppointment_ipad:(id)sender
{
    Appointment_ViewController_ipad *createAppointment=[[Appointment_ViewController_ipad alloc]init];
    createAppointment.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    [self presentViewController:createAppointment animated:YES completion:nil];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    datestr = [NSString stringWithFormat:@"%@",[self.dateFormatter stringFromDate:date]];
    self.selecteddate = [self.dateFormatter dateFromString:datestr];
    NSCalendar *calendars = [NSCalendar currentCalendar];
    NSDateComponents *enddayComponents = [[NSDateComponents alloc] init];
    enddayComponents.day = 1;
    
    NSDate *startdate1 = [self.dateFormatter dateFromString:datestr];
    NSDate *enddate1 = [calendars dateByAddingComponents:enddayComponents toDate:startdate1 options:0];
    
    [eventstable reloadData];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Add Event" message:@"Do You want add an event?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [alert show];
    if (startdate1 != nil)
    {
        [self loadItemsFromDate:startdate1 toDate:enddate1];
    }
   // [self loadItemsFromDate:startdate1 toDate:enddate1];
}

- (void)loadItemsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    EKEventStore *store = [[EKEventStore alloc] init];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:fromDate endDate:toDate calendars:nil];
    NSArray *events = [store eventsMatchingPredicate:predicate];
    
    
        NSDateFormatter *form = [[NSDateFormatter alloc]init];
        [form setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
    if ([events count] == 0)
    {
        [testtitlearray removeAllObjects];
        [testdatearray removeAllObjects];
        NSString *emptystr = [NSString stringWithFormat:@"No events for the selected date"];
        NSString *todaydate = [NSString stringWithFormat:@""];
        [testtitlearray addObject:emptystr];
        [testdatearray addObject:todaydate];
         [eventstable reloadData];
    }
    else
    {
        [testtitlearray removeAllObjects];
        [testdatearray removeAllObjects];
        for (EKEvent * object in events)
        {
//            [testtitlearray removeAllObjects];
//            [testdatearray removeAllObjects];
           [eventstable reloadData];
            eventstr = [NSString stringWithFormat:@"%@",object.title];
            eventsdate = [form stringFromDate:object.startDate];
            [testtitlearray addObject:eventstr];
            [testdatearray addObject:eventsdate];
             [eventstable reloadData];
            
            NSLog(@"%@",testtitlearray);
          }
    }
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
    NSString *title = @"";
    EKEvent *event = [self findEventWithTitle:title inEventStore:store];
    if (event)
        return event;
    event = [EKEvent eventWithEventStore:store];
    event.title = title;
    event.notes = @"";
    event.location = @"";
    event.calendar = [store defaultCalendarForNewEvents];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = 8;
    event.startDate = [calendar dateByAddingComponents:components
                                                toDate:self.selecteddate
                                               options:0];
    components.hour = 1;
    event.endDate = [calendar dateByAddingComponents:components
                                              toDate:event.startDate
                                             options:0];
    
    return event;
}


- (EKEvent *)findEventWithTitle:(NSString *)title inEventStore:(EKEventStore *)store
{
    
    //NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    [dateform setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
//    NSDateComponents *enddatecomponent = [[NSDateComponents alloc]init];
//    enddatecomponent.day = 1;
//    [testtitlearray removeAllObjects];
//    [testdatearray removeAllObjects];
    NSDate *startdate = [NSDate date];
    NSDate *enddate = [NSDate dateWithTimeIntervalSinceNow:86400];
    
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startdate endDate:enddate calendars:nil];
    
    // Fetch all events that match the predicate
    
    NSArray *events = [store eventsMatchingPredicate:predicate];
    
    NSLog(@"total items %d",[events count]);
    if ([events count] == 0)
    {
        [testtitlearray removeAllObjects];
        [testdatearray removeAllObjects];
        NSString *emptystr = [NSString stringWithFormat:@"No events for today"];
        NSString *todaydate = [NSString stringWithFormat:@""];
        [testtitlearray addObject:emptystr];
        [testdatearray addObject:todaydate];
        [eventstable reloadData];
    }
    else
    {
    for (EKEvent * object in events)
    {
        eventstring = [NSString stringWithFormat:@"%@",object.title];
        eventdate = [dateform stringFromDate:object.startDate];
        [test1 addObject:eventstring];
        [testtitlearray addObject:eventstring];
        [testdatearray addObject:eventdate];
        [eventtilearray addObject:eventstring];
        [myeventsdatearray addObject:eventdate];
        NSLog(@"^^ %@",test1);
        NSLog(@"&&&&&&&  %@%@",testtitlearray,testdatearray);
        [eventstable reloadData];
    }
    }
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

/*
 
 int btnHeight = 115;
 int btnWidth = 150;
 UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 60, 1000 , 120)];
 //scrollview.frame = CGRectMake(0, 0, 500, 500);
 //scrollview.frame = [[UIScreen mainScreen]bounds ];
 scrollview.contentSize = CGSizeMake( 10 *btnWidth, btnHeight);
 scrollview.userInteractionEnabled = YES;
 
 scrollview.scrollEnabled = YES;
 
 scrollview.backgroundColor = [UIColor grayColor];
 
 for( int i = 0; i < 4 ; i++ )
 {
 UIButton* aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 aButton.frame = CGRectMake(200+i * btnWidth * 1.1, 2,btnWidth  , btnHeight);
 [aButton setTag:i];
 if(i==0)
 {
 
 [aButton setTitle:@"Query" forState:UIControlStateNormal];
 
 }
 if (i==1) {
 [aButton setTitle:@"Profile" forState:UIControlStateNormal];
 
 }
 if (i==2) {
 [aButton setTitle:@"Feedback" forState:UIControlStateNormal];
 
 }
 if (i==3) {
 [aButton setTitle:@"FAQ" forState:UIControlStateNormal];
 
 }
 if (i==4) {
 [aButton setTitle:@"..." forState:UIControlStateNormal];
 
 }
 
 // [aButton setTitle:@"Student Records" forState:UIControlStateNormal];
 [aButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
 
 [scrollview addSubview:aButton];
 [self.view addSubview:scrollview];
 }

 */

-(IBAction)openAppointments:(id)sender
{
    AppointmentsViewController *appointmentController = [[AppointmentsViewController alloc]init];
   [self.navigationController pushViewController:appointmentController animated:YES];
}

#pragma mark Calendar-Data-Source
#pragma mark
-(CGSize)sizeOfCellIncalendar:(CKCalendarView *)calendar{
     
    return CGSizeMake(50, 35);
}

#pragma mark Calendar-Delegate
#pragma mark

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1)
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
}
-(IBAction)createapp
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

-(BOOL)isAppointmentsAvailableInDate:(NSDate *)date inCalendarView:(CKCalendarView *)calendar
{
    
   // NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:date];
//    NSInteger day = [components day];
//    if (day%3)
//    {
//        return NO;
//    }
    return YES;
}

- (BOOL)dateIsDisabled:(NSDate *)date
{
    for (NSDate *disabledDate in self.disabledDates)
    {
        if ([disabledDate isEqualToDate:date])
        {
            return YES;
        }
    }
    return NO;
}

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date
{
    // TODO: play with the coloring if we want to...
    if ([self dateIsDisabled:date])
    {
        dateItem.backgroundColor = [UIColor whiteColor];
        dateItem.textColor = [UIColor grayColor];
    }
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date
{
    return ![self dateIsDisabled:date];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == Profiletable)
    {
    return 1;
    }
    
    if( tableView == querytable)
    {
        return 1;
    }
    if (tableView == mycontactstableview)
    {
        return 1;
    }
    return  1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if (tableView == eventstable)
    {
        return [testtitlearray count];
        return [testdatearray count];
    }
    if(tableView == Profiletable)
    {
        return 1;
    }
    
    if( tableView == querytable)
    {
        return [queryarray count];
    }
    
   if( tableView == newsfeed)
   {
        return [newsarray count];
       return [imagearray count];
    }
    if (tableView == mycontactstableview)
    {
        if (admin)
        {
            return [adminnamearray count];
            return [adminchatimagearray count];
            return [adminemailarray count];
            return [adminphone count];
            return [adminrolearray count];
            return [adminstatusarry count];
        }
        if (academic)
        {
            return [academicnamearray count];
            return [academicchatimagearray count];
            return [academicemailarray count];
            return [academicphone count];
            return [academicrolearray count];
            return [academicstatusarray count];
        }
        if (recent)
        {
            return [recentlynamearray count];
            return [recentlychatimagearray count];
            return [recentlyemailarray count];
            return [recentphone count];
            return [recentlyrolearray count];
            return [recentstatusarry count];
        }
//
//        return [namearray count];
//        return [chatimagearray count];
//        return [departmentarray count];
//        return [rolearray count];
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == Profiletable)
    {
        static NSString *CellIdentifier = @"Cell";
        customcellclass *cell =(customcellclass *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if( cell == nil)
        {
            nib = [[NSBundle mainBundle] loadNibNamed:@"customcell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
       }
        return cell;
    }
    if(tableView == querytable)
    {
    static NSString *CellIdentifierq = @"Cellq";
    
    UITableViewCell *cellq = [tableView dequeueReusableCellWithIdentifier:CellIdentifierq];
    
    if (cellq == nil)
    {
        
        cellq = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierq] ;
        
    }
    dicValue = [queryarray objectAtIndex:indexPath.row];
        UILabel *lblID = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        lblID.text = [dicValue objectForKey:@"Status"];
        lblID.backgroundColor = [UIColor clearColor];
        lblID.textAlignment = NSTextAlignmentCenter;
        [cellq.contentView addSubview:lblID];
        
        UILabel *lblIDBrd = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 1, 44)];
        lblIDBrd.backgroundColor = [UIColor redColor];
        [cellq.contentView addSubview:lblIDBrd];
        
        UILabel *lblname = [[UILabel alloc] initWithFrame:CGRectMake(101, 0, 70, 30)];
        lblname.text = [dicValue objectForKey:@"TicketNo"];
        lblname.textAlignment = NSTextAlignmentCenter;
        lblname.backgroundColor = [UIColor clearColor];
        [cellq.contentView addSubview:lblname];
        
        UILabel *lblnameBrd1 = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 1, 44)];
        lblnameBrd1.backgroundColor = [UIColor redColor];
        [cellq.contentView addSubview:lblnameBrd1];
        
        UILabel *lblname1 = [[UILabel alloc] initWithFrame:CGRectMake(161, 0, 100, 30)];
        lblname1.text = [dicValue objectForKey:@"Subject"];
        lblname1.textAlignment = NSTextAlignmentCenter;
        lblname1.backgroundColor = [UIColor clearColor];
        [cellq.contentView addSubview:lblname1];
        
        UILabel *lblnameBrd2 = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 1, 44)];
        lblnameBrd2.backgroundColor = [UIColor redColor];
        [cellq.contentView addSubview:lblnameBrd2];
        
        UILabel *lblname2 = [[UILabel alloc] initWithFrame:CGRectMake(261, 0, 150, 30)];
        lblname2.text = [dicValue objectForKey:@"CreatedBy"];
        lblname2.textAlignment = NSTextAlignmentCenter;
        lblname2.backgroundColor = [UIColor clearColor];
        [cellq.contentView addSubview:lblname2];
        
        UILabel *lblnameBrd3 = [[UILabel alloc] initWithFrame:CGRectMake(410, 0, 1, 44)];
        lblnameBrd3.backgroundColor = [UIColor redColor];
        [cellq.contentView addSubview:lblnameBrd3];
        
        UILabel *lblname3 = [[UILabel alloc] initWithFrame:CGRectMake(411, 0, 100, 30)];
        lblname3.text = [dicValue objectForKey:@"CreatedOn"];
        lblname3.textAlignment = NSTextAlignmentCenter;
        lblname3.backgroundColor = [UIColor clearColor];
        [cellq.contentView addSubview:lblname3];
        
        UILabel *lblnameBrd4 = [[UILabel alloc] initWithFrame:CGRectMake(510, 0, 1, 44)];
        lblnameBrd4.backgroundColor = [UIColor redColor];
        [cellq.contentView addSubview:lblnameBrd4];
        
        UILabel *lblname4 = [[UILabel alloc] initWithFrame:CGRectMake(511, 0, 110, 30)];
        lblname4.text = [dicValue objectForKey:@"LastupdatedOn"];
        lblname4.textAlignment = NSTextAlignmentCenter;
        lblname4.backgroundColor = [UIColor clearColor];
        [cellq.contentView addSubview:lblname4];
        
    return cellq;
    }
    
        
    if (tableView == newsfeed)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        
        newscustomcell *cellnews = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cellnews == nil)
        {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"newscustomcell" owner:self options:nil];
            cellnews = [nibs objectAtIndex:0];
        }
        cellnews.selectionStyle = UITableViewCellSelectionStyleGray;
        cellnews.headinglabel.text = [newsarray objectAtIndex:indexPath.row];
        cellnews.newsimage.image = [UIImage imageNamed:[imagearray objectAtIndex:indexPath.row]];
        cellnews.contentlabel.text = [detailedarray objectAtIndex:indexPath.row];
        cellnews.datelabel.text = [datearray objectAtIndex:indexPath.row];
        return cellnews;
    }
    if (tableView == eventstable)
    {
        static NSString *CellIdentifiere = @"Celle";
        UITableViewCell *celle = [tableView dequeueReusableCellWithIdentifier:CellIdentifiere];
        if (celle == nil)
        {
            celle = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifiere];
        }
        //celle.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newappbg.png"]];
        celle.imageView.image = [UIImage imageNamed:@"calendar.png"];
        celle.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        celle.textLabel.text = [testtitlearray objectAtIndex:indexPath.row];
        celle.detailTextLabel.text = [testdatearray objectAtIndex:indexPath.row];
        return celle;
    }
    
    if (tableView == mycontactstableview)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        newscustomcell *cellcontacts = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cellcontacts == nil)
        {
            NSArray *nib1 = [[NSBundle mainBundle] loadNibNamed:@"mycontactstable" owner:self options:nil];
            cellcontacts = [nib1 objectAtIndex:0];
      }
      if (admin)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[adminchatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [adminnamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:0];
            cellcontacts.rolelbl.text = [adminrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[adminstatusarry objectAtIndex:indexPath.row]];

        }
        if (academic)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[academicchatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [academicnamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:6];
            cellcontacts.rolelbl.text = [academicrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[academicstatusarray objectAtIndex:indexPath.row]];
        }
        if (recent)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[recentlychatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [recentlynamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:indexPath.row];
            cellcontacts.rolelbl.text = [adminrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[recentstatusarry objectAtIndex:indexPath.row]];
        }
        return cellcontacts;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == Profiletable)
    {
       
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"video1" ofType:@"mp4"]];
            MPMoviePlayerViewController *playercontroller = [[MPMoviePlayerViewController alloc]
                                                             initWithContentURL:url];
            [self presentMoviePlayerViewControllerAnimated:playercontroller];
            playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
            [playercontroller.moviePlayer play];
            playercontroller = nil;
    }
    
    if( tableView == querytable)
    {
        queryname.text =  [dicValue objectForKey:@"TicketNo"];
        querydes.text = [dicValue objectForKey:@"Subject"];
    }
//    if (tableView == newsfeed)
//    {
//        if( indexPath.row ==0)
//        {
//            parentwebview.hidden = NO;
//            [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.boston.com/news/education/2013/05/23/education-department-giving-newtown-million/RUebqk3JM7yd9j5AeGr0yO/story.html"]]];
//             [newswebview addSubview:activityind];
//            [parentwebview addSubview:newswebview];
//           
//        }
//        if( indexPath.row ==1)
//        {
//            parentwebview.hidden = NO;
//            [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://abcnews.go.com/US/wireStory/ri-education-board-approves-arming-university-cops-19245884"]]];
//            [newswebview addSubview:activityind];
//            [parentwebview addSubview:newswebview];
//            
//        }
//        if( indexPath.row ==2)
//        {
//            parentwebview.hidden = NO;
//            [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baltimoresun.com/news/maryland/education/bs-md-ci-school-audit-folo-20130523,0,869181.story"]]];
//              [newswebview addSubview:activityind];
//            [parentwebview addSubview:newswebview];
//            
//        }
//    }
    if (tableView == newsfeed)
    {
//        UITableViewCell *getcell = [tableView cellForRowAtIndexPath:indexPath];
//        NSString *celltext;
//        celltext = getcell.textLabel.text;
//        if (indexPath.section == 0)
//        {
//           // isShowingNewsList = !isShowingNewsList;
//        [newsfeed reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
//            if( [celltext isEqualToString:@"Education department giving Newtown $1.3 million"])
//            {
//                parentwebview.hidden = NO;
//              [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.boston.com/news/education/2013/05/23/education-department-giving-newtown-million/RUebqk3JM7yd9j5AeGr0yO/story.html"]]];
//                
//                [newswebview addSubview:activityind];
//                [parentwebview addSubview:newswebview];
//                
//            }
//            if( [celltext isEqualToString:@"RI Education board approves arming University cops"])
//            {
//                parentwebview.hidden = NO;
//                [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://abcnews.go.com/US/wireStory/ri-education-board-approves-arming-university-cops-19245884"]]];
//                [newswebview addSubview:activityind];
//                [parentwebview addSubview:newswebview];
//                
//            }
//            if([celltext isEqualToString:@"Harris calls for expanded audit of education spending"])
//            {
//                parentwebview.hidden = NO;
//                [newswebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baltimoresun.com/news/maryland/education/bs-md-ci-school-audit-folo-20130523,0,869181.story"]]];
//                [newswebview addSubview:activityind];
//                [parentwebview addSubview:newswebview];
//                
//            }
//
//        }
//        if (indexPath.section == 1)
//        {
//            
//        
//        //[newsfeed reloadData];
//        isShowingannouncementList = !isShowingannouncementList;
//        [newsfeed reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
//        }
//        if (indexPath.section == 2)
//        {
//            
//            
//            //[newsfeed reloadData];
//            isShowingEventList = !isShowingEventList;
//            [newsfeed reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationAutomatic];
//        }
//
        NewsViewController *newsview = [[NewsViewController alloc]initWithNibName:@"NewsViewController" bundle:nil];
        [self presentViewController:newsview animated:NO completion:nil];
    }
    if (tableView == eventstable)
    {
        EventsViewController *eventsview = [[EventsViewController alloc]initWithNibName:@"EventsViewController" bundle:nil];
        [self presentViewController:eventsview animated:NO completion:nil];
    }
    if (tableView == mycontactstableview)
    {
        ChatViewController *chatview = [[ChatViewController alloc]initWithNibName:@"ChatViewController" bundle:nil];
       
        if (admin)
        {
            if( indexPath.row == 0)
            {
                chatview.online = TRUE;
            }
            if( indexPath.row == 1)
            {
                chatview.online = TRUE;
            }
            if( indexPath.row == 2)
            {
                chatview.online = TRUE;
            }
            if( indexPath.row == 3)
            {
                chatview.offline = TRUE;
            }
            if( indexPath.row == 4)
            {
                chatview.offline = TRUE;
            }
            if( indexPath.row == 5)
            {
                chatview.offline = TRUE;
            }
            chatview.staffnamestr = [adminnamearray objectAtIndex:indexPath.row];
            chatview.departmentstr = [departmentarray objectAtIndex:0];
            chatview.rolestr = [adminrolearray objectAtIndex:indexPath.row];
            chatview.mailidstr = [adminemailarray objectAtIndex:indexPath.row];
            chatview.mobilenumberstr = [adminphone objectAtIndex:indexPath.row];
            chatview.imagestr = [adminchatimagearray objectAtIndex:indexPath.row];
        }
        if (academic)
        {
            if( indexPath.row == 0)
            {
                chatview.online = TRUE;
            }
            if( indexPath.row == 1)
            {
                chatview.online = TRUE;
            }
            if( indexPath.row == 2)
            {
                chatview.offline = TRUE;
            }
            if( indexPath.row == 3)
            {
                chatview.offline = TRUE;
            }
            if( indexPath.row == 4)
            {
                chatview.offline = TRUE;
            }

            chatview.staffnamestr = [academicnamearray objectAtIndex:indexPath.row];
            chatview.departmentstr = [departmentarray objectAtIndex:6];
            chatview.rolestr = [academicrolearray objectAtIndex:indexPath.row];
            chatview.mailidstr = [academicemailarray objectAtIndex:indexPath.row];
            chatview.mobilenumberstr = [academicphone objectAtIndex:indexPath.row];
            chatview.imagestr = [academicchatimagearray objectAtIndex:indexPath.row];
        }
        if (recent)
        {
            if( indexPath.row == 0)
            {
                chatview.online = TRUE;
                chatview.departmentstr = [departmentarray objectAtIndex:0];
            }
            if( indexPath.row == 1)
            {
                chatview.offline = TRUE;
                 chatview.departmentstr = [departmentarray objectAtIndex:6];
            }

            chatview.staffnamestr = [recentlynamearray objectAtIndex:indexPath.row];
            chatview.rolestr = [recentlyrolearray objectAtIndex:indexPath.row];
            chatview.mailidstr = [recentlyemailarray objectAtIndex:indexPath.row];
            chatview.mobilenumberstr = [recentphone objectAtIndex:indexPath.row];
            chatview.imagestr = [recentlychatimagearray objectAtIndex:indexPath.row];
        }
        [self presentViewController:chatview animated:NO completion:nil];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == Profiletable)
    {
        if(indexPath.section == 0)
        {
        return 700;
        }
    }    
    if( tableView == newsfeed)
    {
        return 120;
    }
    
    if( tableView == eventstable)
    {
        return 80;
    }
    if (tableView == mycontactstableview)
    {
        return 50;
    }
    return 50;
}
-(IBAction)closewebview
{
    learningview.hidden = YES;
    parentwebview.hidden = YES;
    [myweb reload];
}
-(IBAction)closelearningview
{
    learningview.hidden = YES;
}

-(IBAction)gotolearningview
{
    parentwebview.hidden = YES;
    learningview.hidden = NO;
       [myweb reload];
}

-(IBAction)profileactionsheet
{
    actionSheet =[[UIActionSheet alloc]initWithTitle:@"Aaron Davidson" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:@"", nil];
    [actionSheet showFromRect:CGRectMake(964, -10, 50, 75) inView:self.view animated:YES];
    UIButton *btn = [[actionSheet subviews] objectAtIndex:1];
    btn.showsTouchWhenHighlighted = YES;
//    UIButton *btns1 =[[actionSheet subviews]objectAtIndex:2];
    //btns1.showsTouchWhenHighlighted = YES;
    UIButton *btns2 =[[actionSheet subviews]objectAtIndex:2];
    btns2.showsTouchWhenHighlighted = YES;
    [btn setBackgroundImage:[UIImage imageNamed:@"action1.png"] forState:UIControlStateNormal];
   // [btns1 setBackgroundImage:[UIImage imageNamed:@"action2.png"] forState:UIControlStateNormal];
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
        if (buttonIndex == 1)
        {
            
        NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:NO forKey:@"runvideo"];
        [self presentViewController:backtologin animated:NO completion:nil];
    }
}
    
}
-(void)tapOut:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.view];
    if (p.y < 0)
    {
        [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }
}

-(void) showFromTabBar:(UITabBar *)view
{
    [self showFromTabBar:view];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOut:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(IBAction)showmainmenu
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
    //menuscrollview.hidden = YES;
}
-(IBAction)mymap
{
    Campus *mymapview = [[Campus alloc]initWithNibName:@"Campus" bundle:nil];
    [self presentViewController:mymapview animated:NO completion:nil];
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

-(IBAction)learningcenter
{
    WebviewViewController *web = [[WebviewViewController alloc] initWithNibName:@"WebviewViewController" bundle:nil];
    [self presentViewController:web animated:NO completion:nil];
}
-(IBAction)universitylearningcenter
{
    parentwebview.hidden = NO;
    [myweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://buzzedu.com/moodle"]]];
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

-(IBAction)chatoption:(id)sender
{
//    if (self.popoverController == nil)
//    {
//        MyContactsViewController *popview = [[MyContactsViewController alloc]initWithNibName:@"MyContactsViewController"bundle:[NSBundle mainBundle]];
//        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:popview];
//        popover.delegate = self;
//        self.popoverController = popover;
//    }
//    CGRect popoverRect = [self.view convertRect:[chatbutton frame] fromView:[chatbutton superview]];
//    popoverRect.origin.x = 875;
//    popoverRect.origin.y = 0;
//    //popoverRect.size.width = MIN(10, 50);
//    [self.popoverController presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
////    //[self.navigationController popToRootViewControllerAnimated:YES];
    
}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [[event allTouches] anyObject];
//    if(touch.view.tag == 2)
//        NSLog(@"Touched");
//        ChatViewController *chatview = [[ChatViewController alloc]initWithNibName:@"ChatViewController" bundle:nil];
//        [self presentViewController:chatview animated:NO completion:nil];
//    
//}
-(IBAction)adminaction
{
    admin = YES;
    academic = NO;
    recent = NO;
    [mycontactstableview reloadData];
    adminbutton.alpha = 1;
    academicbutton.alpha = 0.5;
    recentbutton.alpha = 0.5;
}
-(IBAction)academicaction
{
    admin = NO;
    academic = YES;
    recent = NO;
    [mycontactstableview reloadData];
    adminbutton.alpha = 0.5;
    academicbutton.alpha = 1;
    recentbutton.alpha = 0.5;
}
-(IBAction)recentaction
{
    admin = NO;
    academic = NO;
    recent = YES;
    [mycontactstableview reloadData];
    academicbutton.alpha = 0.5;
    adminbutton.alpha = 0.5;
    recentbutton.alpha = 1;
}
-(IBAction)emailinbox
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:"]];
}
@end
