//
//  EventsViewController.m
//  Proretention1.1
//
//  Created by Admin on 19/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "EventsViewController.h"
#import "CKCalendarView.h"
#import "MyprofileViewController.h"
#import "NewLoginViewController.h"
#import "AppDelegate.h"
#import "StaffViewController.h"

@interface EventsViewController ()<CKCalendarDelegate>
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSArray *disabledDates;
@property(nonatomic, strong)NSDate *selecteddate;
@property(nonatomic, strong)NSString *datestr;
@end

@implementation EventsViewController
@synthesize datestr;
@synthesize alertbutton,pressbutton;
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
    [self initializeCalendar];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
//    eventstable.layer.borderWidth= 2;
//    eventstable.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    eventstable.layer.cornerRadius = 8;
    
    detailedview.layer.borderWidth= 2;
    detailedview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    detailedview.layer.cornerRadius = 8;
    
    eventarray = [[NSMutableArray alloc]init];
    eventdatearray = [[NSMutableArray alloc]init];
    locationarray = [[NSMutableArray alloc]init];
    notesarray = [[NSMutableArray alloc]init];
    enddatearray = [[NSMutableArray alloc]init];
    
    notesview.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    notesview.layer.borderWidth = 2;
    notesview.layer.cornerRadius = 8;
    monthformat = [[NSDateFormatter alloc]init];
    [monthformat setDateFormat:@"MMM  dd"];
    NSDate *todaydate = [NSDate date];
    diarylabel.text = [monthformat stringFromDate:todaydate];
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
    [calendarbutton addSubview:calendar];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)backtohome
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        StaffViewController *staffview = [[StaffViewController alloc]initWithNibName:@"StaffViewController" bundle:nil];
        [self presentViewController:staffview animated:NO completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }

}

-(CGSize)sizeOfCellIncalendar:(CKCalendarView *)calendar{
    
    return CGSizeMake(50, 38);
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    datestr = [NSString stringWithFormat:@"%@",[self.dateFormatter stringFromDate:date]];
    diarylabel.text = [NSString stringWithFormat:@"%@",[monthformat stringFromDate:date]];
    self.selecteddate = [self.dateFormatter dateFromString:datestr];
    NSCalendar *calendars = [NSCalendar currentCalendar];
    NSDateComponents *enddayComponents = [[NSDateComponents alloc] init];
    enddayComponents.day = 1;
    
    NSDate *startdate1 = [self.dateFormatter dateFromString:datestr];
    NSDate *enddate1 = [calendars dateByAddingComponents:enddayComponents toDate:startdate1 options:0];
    if (startdate1 != nil)
    {
        [self loadItemsFromDate:startdate1 toDate:enddate1];
    }
    [eventstable reloadData];
}

- (void)loadItemsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    EKEventStore *store = [[EKEventStore alloc] init];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:fromDate endDate:toDate calendars:nil];
    NSArray *events = [store eventsMatchingPredicate:predicate];
  
    NSDateFormatter *form = [[NSDateFormatter alloc]init];
    [form setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
    [eventarray removeAllObjects];
    [eventdatearray removeAllObjects];
    [enddatearray removeAllObjects];
    [locationarray removeAllObjects];
    [notesarray removeAllObjects];
    if ([events count] == 0)
    {
        titlestring = [NSString stringWithFormat:@"No events for the selected date"];
        eventdatestr = [NSString stringWithFormat:@"No events for the selected date"];
        eventenddate = [NSString stringWithFormat:@"No events for the selected date"];
        eventlocation = [NSString stringWithFormat:@"No events for the selected date"];
        eventnotes = [NSString stringWithFormat:@"No events for the selected date"];
        if ([eventnotes isEqualToString:@"(null)"])
        {
            eventnotes = [NSString stringWithFormat:@"No notes added"];
        }
        if ([eventlocation isEqualToString:@"(null)"])
        {
            eventlocation = [NSString stringWithFormat:@"Location Not Specified"];
        }
        [eventarray addObject:titlestring];
        [eventdatearray addObject:eventdatestr];
        [enddatearray addObject:eventenddate];
        [locationarray addObject:eventlocation];
        [notesarray addObject:eventnotes];
        
        headinglabel.text = [eventarray objectAtIndex:0];
        locationlabel.text = [locationarray objectAtIndex:0];
        startdatelabel.text = [eventdatearray objectAtIndex:0];
        enddatelabel.text = [enddatearray objectAtIndex:0];
        notesview.text = [notesarray objectAtIndex:0];
    }
    else
    {
        for (EKEvent * object in events)
        {
            titlestring = [NSString stringWithFormat:@"%@",object.title];
            eventdatestr = [form stringFromDate:object.startDate];
            eventenddate = [form stringFromDate:object.endDate];
            eventlocation = [NSString stringWithFormat:@"%@",object.location];
            eventnotes = [NSString stringWithFormat:@"%@",object.notes];
            if ([eventnotes isEqualToString:@"(null)"])
            {
                eventnotes = [NSString stringWithFormat:@"No notes added"];
            }
            if ([eventlocation isEqualToString:@"(null)"])
            {
                eventlocation = [NSString stringWithFormat:@"Location Not Specified"];
            }
            [eventarray addObject:titlestring];
            [eventdatearray addObject:eventdatestr];
            [enddatearray addObject:eventenddate];
            [locationarray addObject:eventlocation];
            [notesarray addObject:eventnotes];
            
            headinglabel.text = [eventarray objectAtIndex:0];
            locationlabel.text = [locationarray objectAtIndex:0];
            startdatelabel.text = [eventdatearray objectAtIndex:0];
            enddatelabel.text = [enddatearray objectAtIndex:0];
            notesview.text = [notesarray objectAtIndex:0];
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
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    [dateform setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
    NSDateComponents *enddatecomponent = [[NSDateComponents alloc]init];
    enddatecomponent.day = 1;
    
    NSDate *enddate = [calendar dateByAddingComponents:enddatecomponent toDate:[NSDate date] options:0];
    NSDate *startdate = [NSDate date];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startdate endDate:enddate calendars:nil];
    NSArray *events = [store eventsMatchingPredicate:predicate];
    NSDateFormatter *form1 = [[NSDateFormatter alloc]init];
    [form1 setDateFormat:@"dd-MM-yyyy HH-mm-ss a"];
    [eventarray removeAllObjects];
    [eventdatearray removeAllObjects];
    [enddatearray removeAllObjects];
    [locationarray removeAllObjects];
    [notesarray removeAllObjects];
    if ([events count] == 0)
    {
        titlestring = [NSString stringWithFormat:@"No events for today"];
        eventdatestr = [NSString stringWithFormat:@"No events for today"];
        eventenddate = [NSString stringWithFormat:@"No events for today"];
        eventlocation = [NSString stringWithFormat:@"No events for today"];
        eventnotes = [NSString stringWithFormat:@"No events for today"];
        if ([eventnotes isEqualToString:@"(null)"])
        {
            eventnotes = [NSString stringWithFormat:@"No notes added"];
        }
        if ([eventlocation isEqualToString:@"(null)"])
        {
            eventlocation = [NSString stringWithFormat:@"Location Not Specified"];
        }
        [eventarray addObject:titlestring];
        [eventdatearray addObject:eventdatestr];
        [enddatearray addObject:eventenddate];
        [locationarray addObject:eventlocation];
        [notesarray addObject:eventnotes];
       
        headinglabel.text = [eventarray objectAtIndex:0];
        locationlabel.text = [locationarray objectAtIndex:0];
        startdatelabel.text = [eventdatearray objectAtIndex:0];
        enddatelabel.text = [enddatearray objectAtIndex:0];
        notesview.text = [notesarray objectAtIndex:0];
    }
    else
    {
        for (EKEvent * object in events)
       {
           titlestring = [NSString stringWithFormat:@"%@",object.title];
           eventdatestr = [form1 stringFromDate:object.startDate];
           eventenddate = [form1 stringFromDate:object.endDate];
           eventlocation = [NSString stringWithFormat:@"%@",object.location];
           eventnotes = [NSString stringWithFormat:@"%@",object.notes];
           if ([eventnotes isEqualToString:@"(null)"])
           {
               eventnotes = [NSString stringWithFormat:@"No notes added"];
           }
           if ([eventlocation isEqualToString:@"(null)"])
           {
               eventlocation = [NSString stringWithFormat:@"Location Not Specified"];
           }
           [eventarray addObject:titlestring];
           [eventdatearray addObject:eventdatestr];
           [enddatearray addObject:eventenddate];
           [locationarray addObject:eventlocation];
           [notesarray addObject:eventnotes];
           [eventstable reloadData];
           
           headinglabel.text = [eventarray objectAtIndex:0];
           locationlabel.text = [locationarray objectAtIndex:0];
           startdatelabel.text = [eventdatearray objectAtIndex:0];
           enddatelabel.text = [enddatearray objectAtIndex:0];
           notesview.text = [notesarray objectAtIndex:0];
        }
    }
        return nil;
    
}
- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventarray count];
    return [eventdatearray count];
    return [locationarray count];
    return [notesarray count];
    return [enddatearray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    cell.textLabel.text = [eventarray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [eventdatearray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"calendar.png"];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    headinglabel.text = [eventarray objectAtIndex:indexPath.row];
    locationlabel.text = [locationarray objectAtIndex:indexPath.row];
    startdatelabel.text = [eventdatearray objectAtIndex:indexPath.row];
    enddatelabel.text = [enddatearray objectAtIndex:indexPath.row];
   notesview.text = [notesarray objectAtIndex:indexPath.row];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == eventstable)
    {
        return 80;
    }
    return 0;
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
                backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
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
                profileactionview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
                [self presentViewController:profileactionview animated:NO completion:nil];
            }
            if (buttonIndex == 1)
            {
                backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
                [self presentViewController:backtologin animated:NO completion:nil];
            }
        }
        
    }
}

-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
  //  NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
}

-(void)dealloc
{
    profileactionview = nil;
    backtologin = nil;
}

@end
