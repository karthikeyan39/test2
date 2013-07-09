//
//  StaffViewController.m
//  Proretention1.1
//
//  Created by Admin on 29/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "StaffViewController.h"
#import "CKCalendarView.h"
#import "newscustomcell.h"
#import "NewsViewController.h"
#import "AppDelegate.h"
#import "EventsViewController.h"
#import "Campus.h"
#import "ChatViewController.h"
#import "NewLoginViewController.h"
@interface StaffViewController ()<CKCalendarDelegate>
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSArray *disabledDates;
@property(nonatomic, strong)NSDate *selecteddate;
@property(nonatomic, strong)NSString *datestr;


@end

@implementation StaffViewController
@synthesize datestr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self initializeCalendar];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    headinglabel.text =@"Home";
    mailbutton.hidden = YES;
    backbtn.enabled = NO;
    parentnews.layer.borderWidth= 2;
    parentnews.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    parentnews.layer.cornerRadius = 8;
    parentapp.layer.borderWidth= 2;
    parentapp.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    parentapp.layer.cornerRadius = 8;
    locatorview.layer.borderWidth= 2;
    locatorview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    locatorview.layer.cornerRadius = 8;
    mycommunityview.layer.borderWidth= 2;
    mycommunityview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    mycommunityview.layer.cornerRadius = 8;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"newmainbgs.png"]];
    menuscrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebargray.png"]];
      [webtoolbar setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    tutortext.layer.borderWidth = 2;
    tutortext.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    tutortext.layer.cornerRadius =8;
    tutortext.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textbg.png"]];
    parentview.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
    homeview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg.png"]];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar2 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar3 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar4 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar5 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [livetoolbar setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    newsfeed.dataSource = self;
    newsfeed.delegate = self;
    mycontactstableview.dataSource = self;
    mycontactstableview.delegate = self;
    eventstable.dataSource = self;
    eventstable.delegate = self;
    newsarray = [[NSMutableArray alloc ] initWithObjects:@" Next generation of designers showcase their work",@"Fine artist celebrates success after rekindling her love of art",@"Lifetime achievement award for visiting professor",@"Hundreds of guests wowed by Jubilee performance",@"North London art students’ work goes on public display", nil];
     imagearray = [[NSMutableArray alloc] initWithObjects:@"newsimages1.jpg",@"newsimages2.jpg",@"nonews.png",@"newsimages3.jpg", @"newsimages4.jpg",  nil];
    detailedarray = [[NSMutableArray alloc]initWithObjects:@"Upcoming designers from our University will show off their work at the Old Truman Brewery on London’s famous Brick Lane from 8-10 June 2013.More than 500 final-year artists and designers in disciplines including photography, fashion, animation, product design, interior architecture, fine art and illustration will display their final year projects at the trendy east London venue.The four-day event titled “Laboratory” will see over 5000 visitors come through the door to discover the latest talent in art and design.John will be exhibiting his football inspired illustrations that have been shortlisted and highly commended for the Macmillan Children’s Book Illustratio",@"Fine artist Kelly Moore will see her second solo exhibition open this weekend in Glasgow after rekindling her love of art only five years ago when her daughter began studying the subject.After running a successful physiotherapy practice in London for 19 years and being at the peak of her career, Kelly relinquished the comfort and stability of the familiar pattern of steady work and  found her artistic ‘calling’ reawakened by her daughter.Five years ago, with support of her family, Kelly set about a complete career change and decided to study for both an undergraduate and postgraduate degree in Fine Art at Middlesex University and the emerging artist is now gaining a large following.University student Kelly Moore who grew up in Glasgow said:  “'It was when my teenage daughter Alex started to take life drawing classes that I felt inspired to start to draw again.  And now she has also recently achieved a degree in illustration from ABC University.”Her exhibition titled Still Sounds Scotland Street 2013 will run from Saturday 1 June - 11 August 2013 at the Scotland Street School Museum.  Kelly’s mixed media installation includes textile prints, photographs, video and sound, and offers a unique insight into the lives of the former pupils of Scotland Street School, local residents and Clydeside shipyard workers.It examines the period the school was open, from the early 1900's to the late seventies. It is one of the latest exhibitions by Scottish artist Margaret Moore, exploring history and heritage in the context of an increasingly globalised world.",@"Professor James, Visiting Professor at the University’s Institute for Work Based Learning, will receive a Lifetime Achievement Award at the British Psychological Society’s Annual Conference, to be held in April 2010.The British Psychological Society Awards were established in 2006, to recognise distinctive and exemplary contributions to psychological knowledge. The Lifetime Achievement Award is presented in recognition of outstanding personal achievements and significant contributions to the advancement of psychological knowledge. Professor Lane has been credited with bringing about ‘the professionalisation of counselling psychology’.As Research Director of the International Centre for the Study of Coaching (ICSC) at Middlesex, Professor Lane has made significant contributions to leading-edge research in education, coaching and management issues. He also set up structures for specialised awards in psychotherapy for the European Federation of Psychologists Associations, which were recently adopted by 34 countries.",@"University's Quadrangle was transformed into a top class concert venue last night, with hundreds of guests attending two performances arranged to celebrate the Queen's Jubilee.Performers including world renowned soprano Dame Emma Kirkby wowed the audience in Henry Purcell's 'Dido and Aeneas', joined by The Baroque Collective, led by Julia Bishop, the Singers and the Dance Ensemble. The dances were performed with original choreography by Louise Kelsey.The BBC singers then combined with the University's choir for the second work, Carl Orff's 'Carmina Burana'. This was directed by Adrian Peacock from BBC Music. The One Voice Children’s Choir from Barnet Music Service, whose members are drawn from primary and secondary schools across the Borough of Barnet, also took part.", @"Some of London’s best up and coming artists will be showcasing work which tackles issues like women’s rights in Afghanistan and art as a form of protest in Britain, at an exhibition to be launched in Hendon.For the first time the university students will be able to showcase their work in the £80m Grove building, University’s state-of-the-art centre for creative courses.The work of the Fine Art students from across north London aims to challenge established views, presenting a simulating and inventive response to the world. Final year Fine Art and Critical Theory student Harriet Dopson said: “It will be a really exciting show, there is no formal brief so all the work is self led which produces some outstanding results. Myself and the other students on the course have used an exciting range of media to produce their work as we respond and question the world around us.The students will also be running a workshop giving the public an opportunity to take part in and discuss the exhibition.Admission is free.",nil];
    datearray = [[NSMutableArray alloc]initWithObjects:@"3 Seconds ago",@"5 Minutes ago",@"2 Hours 30 Minutes ago",@"1 Day ago",@"3 Days ago", nil];
    
    adminnamearray = [NSArray arrayWithObjects:@"Ms Carla Ben",@"Mr Johnson Green",@"Ms Zara White",@"Mr Kevin Gabon", @"Mr Higgin James",@"Ms Nicola Boisete", nil];
    adminchatimagearray = [NSArray arrayWithObjects:@"l1.jpg",@"pr1.jpg",@"l2.jpg",@"pr2.jpg",@"pr3.jpg",@"l3.jpg", nil];
    adminrolearray = [NSArray arrayWithObjects:@"Department Coordinator",@"Program Administrator",@"Program Administrator",@"Program Administrator",@"Head of Department Administration",@"Program Manager", nil];
    adminemailarray = [NSArray arrayWithObjects:@"Carla.ben@cl.ac.uk",@"Johnson.green@cl.ac.uk", @"Zara.white@cl.ac.uk",@"Kevin.gabon@cl.ac.uk",@"Higgin.james@cl.ac.uk",@"Nicola.boisete@cl.ac.uk", nil];
    adminphone = [NSArray arrayWithObjects:@"020-7010-4516",@"020-7010-5145",@"020-7010-4245",@"020-7010-3245",@"020-7010-2124",@"020-7010-1235", nil];
    adminstatusarry = [NSArray arrayWithObjects:@"green.png",@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png",nil];
    
    academicnamearray  = [NSArray arrayWithObjects:@"Aaron Davidson",@"Dr Franklin Lon",@"Professor Maria",@"Dr Walker Gibbs",@"Dr Richard Coles",@"Martin Archer", nil];
    academicchatimagearray = [NSArray arrayWithObjects:@"studentprofile.png",@"pr4.jpg",@"pr5.jpg",@"pr6.jpg", @"pr7.jpg",@"pr8.jpg", nil];
    academicrolearray = [NSArray arrayWithObjects:@"Student",@"Professor & Department Head",@"Professor",@"Senior Lecturer",@"Lecturer",@"Student Representative", nil];
    academicemailarray = [NSArray arrayWithObjects:@"aaron@cl.ac.uk",@"Franklin.lon@cl.ac.uk",@"maria@cl.ac.uk",@"Walker.gibbs@cl.ac.uk",@"Richard.coles@cl.ac.uk",@"Martin.arch@cl.ac.uk", nil];
    academicphone = [NSArray arrayWithObjects:@"020-7020-7212",@"020-7010-7250",@"020-7010-7241",@"020-7010-7002",@"020-7010-7023",@"020-7010-2412", nil];
    academicstatusarray = [NSArray arrayWithObjects:@"green.png",@"green.png",@"green.png",@"redround.png", @"redround.png",@"redround.png", nil];
    
    
    recentlynamearray  = [NSArray arrayWithObjects:@"Ms Nicola Boisete",@"Dr Franklin Lon", nil];
    recentlychatimagearray = [NSArray arrayWithObjects:@"l1.jpg",@"pr4.jpg", nil];
    recentlyemailarray = [NSArray arrayWithObjects:@"Nicola.boisete@cl.ac.uk",@"Franklin.lon@cl.ac.uk", nil];
    recentlyrolearray = [NSArray arrayWithObjects:@"Program Manager",@"Professor & Department Head", nil];
    recentstatusarry = [NSArray arrayWithObjects:@"green.png", @"redround.png", nil];
    recentphone = [NSArray arrayWithObjects:@"020-7010-1235", @"020-7010-7250",nil];
    
    departmentarray = [[NSMutableArray alloc]initWithObjects:@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Administrative staff",@"Academic Staff",@"Academic Staff",@"Academic Staff",@"Academic Staff",@"Academic Staff", nil];
    recent = YES;
    academicbutton.alpha = 0.5;
    adminbutton.alpha = 0.5;
    recentbutton.alpha = 1;
    testtitlearray = [[NSMutableArray alloc]init];
    testdatearray = [[NSMutableArray alloc]init];
    [parentview addSubview:homeview];
    [fromvalue setTitle:@"Administrative" forState:UIControlStateNormal];
    [tovalue setTitle:@"Academic" forState:UIControlStateNormal];
    [recentvalue setTitle:@"Recently Contacted" forState:UIControlStateNormal];
}
-(void)initializeCalendar
{
    EKEventStore *evstore = [[EKEventStore alloc] init];
    [self findOrCreateEvent:evstore];
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.dataSource = self;
    calendar.delegate = self;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openAppointments:)];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [calendar addGestureRecognizer:gestureRecognizer];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    gestureRecognizer.numberOfTapsRequired =2;
    calendar.onlyShowCurrentMonth = NO;
    calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    calendar.frame = CGRectMake(0, 0, 220, 220);
    [appointmentButton addSubview:calendar];
}
-(CGSize)sizeOfCellIncalendar:(CKCalendarView *)calendar{
    
    return CGSizeMake(50, 38);
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
    if (startdate1 != nil)
    {
        [self loadItemsFromDate:startdate1 toDate:enddate1];
    }
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
            [eventstable reloadData];
            eventstr = [NSString stringWithFormat:@"%@",object.title];
            eventsdate = [form stringFromDate:object.startDate];
            [testtitlearray addObject:eventstr];
            [testdatearray addObject:eventsdate];
            [eventstable reloadData];
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
    event.startDate = [calendar dateByAddingComponents:components toDate:self.selecteddate options:0];
    components.hour = 1;
    event.endDate = [calendar dateByAddingComponents:components toDate:event.startDate options:0];
    return event;
}
- (EKEvent *)findEventWithTitle:(NSString *)title inEventStore:(EKEventStore *)store
{
    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    [dateform setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
    NSDate *startdate = [NSDate date];
    NSDate *enddate = [NSDate dateWithTimeIntervalSinceNow:86400];
    
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startdate endDate:enddate calendars:nil];
    NSArray *events = [store eventsMatchingPredicate:predicate];
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
            [testtitlearray addObject:eventstring];
            [testdatearray addObject:eventdate];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
-(IBAction)createapp
{
    EKEventStore *store = [[EKEventStore alloc] init];
    
    if([store respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
       [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            if (granted)
            {
                dispatch_async(dispatch_get_main_queue(), ^{[self createEventAndPresentViewController:store];});
                }
        }];
    }
    else
    {
        [self createEventAndPresentViewController:store];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == newsfeed)
    {
        return 1;
    }
    if (tableView == mycontactstableview)
    {
        return 1;
    }
    if (tableView == eventstable)
    {
        return 1;
    }
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == newsfeed)
    {
        return [newsarray count];
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
    }
    if (tableView == eventstable)
    {
        return [testtitlearray count];
        return [testdatearray count];
    }
    if( tableView == admintable)
    {
        return [adminnamearray count];
        return [adminchatimagearray count];
        return [adminstatusarry count];
    }
    
    if( tableView== academictable)
    {
        return [academicnamearray count];
        return [academicchatimagearray count];
        return [academicstatusarray count];
    }
    
    if( tableView== recentable)
    {
        return [recentlynamearray count];
        return [recentlychatimagearray count];
        return [recentstatusarry count];
    }

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == newsfeed)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        
        newscustomcell *cellnews = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cellnews == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"newscustomcell" owner:self options:nil];
            cellnews = [nib objectAtIndex:0];
        }
        cellnews.selectionStyle = UITableViewCellSelectionStyleGray;
        cellnews.headinglabel.text = [newsarray objectAtIndex:indexPath.row];
        cellnews.newsimage.image = [UIImage imageNamed:[imagearray objectAtIndex:indexPath.row]];
        cellnews.contentlabel.text = [detailedarray objectAtIndex:indexPath.row];
        cellnews.datelabel.text = [datearray objectAtIndex:indexPath.row];
        return cellnews;
    }
    if (tableView == mycontactstableview)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        newscustomcell *cellcontacts = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cellcontacts == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"mycontactstable" owner:self options:nil];
            cellcontacts = [nib objectAtIndex:0];
        }
        if (admin)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[adminchatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [adminnamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:0];
            //cellcontacts.rolelbl.text = [adminrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[adminstatusarry objectAtIndex:indexPath.row]];
            
        }
        if (academic)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[academicchatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [academicnamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:6];
           //cellcontacts.rolelbl.text = [academicrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[academicstatusarray objectAtIndex:indexPath.row]];
        }
        if (recent)
        {
            cellcontacts.chatimage.image = [UIImage imageNamed:[recentlychatimagearray objectAtIndex:indexPath.row]];
            cellcontacts.namelbl.text = [recentlynamearray objectAtIndex:indexPath.row];
            cellcontacts.departmentlbl.text = [departmentarray objectAtIndex:0];
            //cellcontacts.rolelbl.text = [recentlyrolearray objectAtIndex:indexPath.row];
            cellcontacts.chaticon.image = [UIImage imageNamed:[recentstatusarry objectAtIndex:indexPath.row]];
        }
        return cellcontacts;
    }
    if (tableView == eventstable)
    {
        static NSString *CellIdentifiere = @"Celle";
        UITableViewCell *celle = [tableView dequeueReusableCellWithIdentifier:CellIdentifiere];
        if (celle == nil)
        {
            celle = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifiere];
        }
        celle.imageView.image = [UIImage imageNamed:@"calendar.png"];
        celle.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        celle.textLabel.text = [testtitlearray objectAtIndex:indexPath.row];
        celle.detailTextLabel.text = [testdatearray objectAtIndex:indexPath.row];
        return celle;
    }
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
    if (tableView == newsfeed)
    {
        NewsViewController *newsview = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
        AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        ap.stafforstudent = TRUE;
        [self presentViewController:newsview animated:NO completion:nil];
    }
    if (tableView == eventstable)
    {
        EventsViewController *newsview = [[EventsViewController alloc] initWithNibName:@"EventsViewController" bundle:nil];
        AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        ap.stafforstudent = TRUE;
        [self presentViewController:newsview animated:NO completion:nil];
    }
    if (tableView == mycontactstableview)
    {
        ChatViewController *chatview = [[ChatViewController alloc]initWithNibName:@"ChatViewController" bundle:nil];
        AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        ap.stafforstudent = TRUE;
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

    if(tableView == admintable)
    {
        newscustomcell *ad = (newscustomcell *)[admintable cellForRowAtIndexPath:indexPath];
        [fromvalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        admintable.hidden = YES;
        
    }
    if(tableView == academictable)
    {
        newscustomcell *ad = (newscustomcell *)[academictable cellForRowAtIndexPath:indexPath];
        [tovalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        academictable.hidden = YES;
    }
    if(tableView == recentable)
    {
        newscustomcell *ad = (newscustomcell *)[admintable cellForRowAtIndexPath:indexPath];
        [recentvalue setTitle:ad.namelbl.text forState:UIControlStateNormal];
        recentable.hidden = YES;
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
                //AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
              //  ap.stafforstudent = TRUE;
            
                emailbutton.enabled = YES;
                facebtn.enabled = YES;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
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
            if (indexPath.row == 1)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = YES;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"callnew.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatnew.png"] forState:UIControlStateNormal];
            }
            if (indexPath.row == 0)
            {
                emailbutton.enabled = YES;
                facebtn.enabled = NO;
                chatbtn.enabled = NO;
                [callbtn setBackgroundImage:[UIImage imageNamed:@"calldisable.png"] forState:UIControlStateNormal];
                [chatbtn setBackgroundImage:[UIImage imageNamed:@"chatdisable.png"] forState:UIControlStateNormal];
            }
            
        }
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == newsfeed)
    {
        return 120;
    }
    if (tableView == mycontactstableview)
    {
        return 50;
    }
    if (tableView == eventstable)
    {
        return 80;
    }
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

    return 40;
}
-(IBAction)mymap
{
    Campus *map = [[Campus alloc]initWithNibName:@"Campus" bundle:nil];
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    ap.stafforstudent = TRUE;
    [self presentViewController:map animated:NO completion:nil];
}
-(IBAction)inbox
{
    headinglabel.text = @"Inbox";
    parentwebview.hidden = NO;
    homeview.hidden = YES;
    [self hidemenu];
   [mywebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9001/Ticket/StaffmyInbox.aspx"]]];
}

-(IBAction)summary
{
    headinglabel.text = @"Summary";
    parentwebview.hidden = NO;
    homeview.hidden = YES;
    learningloungeview.hidden = YES;
    livesupportview.hidden = YES;
    [self hidemenu];
    [mywebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9001/CAF_Screen/Landing.aspx"]]];
}
-(IBAction)businessinteligence
{
    headinglabel.text = @"DashBoard";
    parentwebview.hidden = NO;
    learningloungeview.hidden = YES;
    livesupportview.hidden = YES;
    homeview.hidden = YES;
    [self hidemenu];
    [mywebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9001/Dashboard/Dashboard.aspx"]]];
}
-(IBAction)createticket
{
    headinglabel.text = @"Create Ticket";
    parentwebview.hidden = NO;
    learningloungeview.hidden = YES;
    livesupportview.hidden = YES;
    homeview.hidden = YES;
    [self hidemenu];
    [mywebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://221.134.158.104:9001/Ticket/StaffCreateTicket.aspx"]]];
}
-(IBAction)learninglounge
{
    [self hidemenu];
    headinglabel.text = @"Learning Lounge";
    parentwebview.hidden = YES;
    learningloungeview.hidden = NO;
    homeview.hidden = YES;
  //  learningloungeview.hidden = YES;
    livesupportview.hidden = YES;
}
-(IBAction)livesupport
{
    [self hidemenu];
    headinglabel.text = @"Live Support";
      parentwebview.hidden = YES;
    homeview.hidden = YES;
    learningloungeview.hidden = YES;
    livesupportview.hidden = NO;
}
-(IBAction)unilearning
{
     backbtn.enabled = YES;
    learningwebview.hidden  =NO;
      [learningwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://buzzedu.com/moodle/login/index.php"]]];
}
-(IBAction)otherlearning
{
     backbtn.enabled = YES;
    learningwebview.hidden  =NO;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"listing" ofType:@"html" inDirectory:@"otherstaff"]];
    [learningwebview loadRequest:[NSURLRequest requestWithURL:url]];
}
-(IBAction)tutorlearning
{
     backbtn.enabled = YES;
//    [unilearn setBackgroundImage:[UIImage imageNamed:@"tutor.png"] forState:UIControlStateNormal];
//    tutorbtn.hidden = NO;
//    tutortext.hidden = NO;
//    unilearn.enabled = NO;
//    tutortext.text = @"                                                                                                                                            Virtual Tutor offers a new in-class pedagogy where teachers and students are networked in classrooms (conventional or online) and off-it. Real-time collaboration and feedback is the backbone of Virtual Tutor. Virtual Tutor provides a conduit to the breadth and width of open content including YouTube for Education, Wikipedia, Open Courseware and Gooru (a learning search engine).The content, with all its multimedia richness, is available on the cloud at home for students to preview and revise. Real-time, powerful student analytics from in-class quizzes and assignments, add the final dimension of power to the Virtual Tutor, enabling the teacher to spot slow-learners ahead of time.";
    learningwebview.hidden  =NO;
    [learningwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://harness.cloudapp.net/workbook.aspx"]]];
}
-(IBAction)closewebview
{
    parentwebview.hidden = YES;
    homeview.hidden = NO;
    headinglabel.text = @"Home";
}

-(IBAction)closelearingview
{
    learningloungeview.hidden = YES;
    homeview.hidden = NO;
}
-(IBAction)backtolearningview
{
    learningwebview.hidden = YES;
}
-(IBAction)closetextview
{
   unilearn.enabled = YES;
    [unilearn setBackgroundImage:[UIImage imageNamed:@"unilearning.png"] forState:UIControlStateNormal  ];
    tutorbtn.hidden = YES;
    tutortext.hidden = YES;
    unilearn.enabled = YES;
}
-(IBAction)profileactionsheet
{
    actionSheet =[[UIActionSheet alloc]initWithTitle:@"John Smith" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:nil, nil];
    [actionSheet showFromRect:CGRectMake(954, -10, 50, 75) inView:self.view animated:YES];
   
    UIButton *btns2 =[[actionSheet subviews]objectAtIndex:1];
    btns2.showsTouchWhenHighlighted = YES;
    [btns2 setBackgroundImage:[UIImage imageNamed:@"action3.png"] forState:UIControlStateNormal];
}
-(void)actionSheet:(UIActionSheet *)actionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog( @"buttonIndex%d",buttonIndex);
    if( buttonIndex >=0)
    {
        if (buttonIndex == [ actionSheet destructiveButtonIndex])
        {
            NewLoginViewController *newlog  = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
            [self presentViewController:newlog animated:NO completion:nil];
        }
    }
}
-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
    //NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
}
-(IBAction)adminselect
{
    admintable.hidden = NO;
    academictable.hidden = YES;
    recentable.hidden = YES;
}
-(IBAction)academicselect
{
    academictable.hidden = NO;
    admintable.hidden = YES;
    recentable.hidden = YES;
    
}
-(IBAction)recentselect
{
    recentable.hidden = NO;
    admintable.hidden= YES;
    academictable.hidden= YES;
}
-(IBAction)livesupportback
{
    homeview.hidden = NO;
    livesupportview.hidden = YES;
}
@end
