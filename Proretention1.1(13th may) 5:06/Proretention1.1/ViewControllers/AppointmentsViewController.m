//
//  AppointmentsViewController.m
//  Proretention1.1
//
//  Created by Radhakrishnan Selvaraj on 19/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "AppointmentsViewController.h"
#import "CKCalendarView.h"

@interface AppointmentsViewController ()

@property(nonatomic,strong)CKCalendarView *calendarView;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSArray *disabledDates;
@property(nonatomic, strong) NSDate *selecteddate;
@property(nonatomic, strong)NSString *datestr;
@end

@implementation AppointmentsViewController
@synthesize dateFormatter,calendarView;
@synthesize selecteddate = _selecteddate;
@synthesize datestr;
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
    self.navigationController.navigationBarHidden = NO;
    [self initializeCalendar];
	// Do any additional setup after loading the view.
}


-(void)initializeCalendar
{
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendarView = calendar;
    calendar.dataSource = self;
    calendar.delegate = self;
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
//    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    NSString *loadstr = [def objectForKey:@"savedstring"];
    self.disabledDates = @[
                           [self.dateFormatter dateFromString:@"05/05/2013"],
                           [self.dateFormatter dateFromString:@"06/05/2013"],
                           [self.dateFormatter dateFromString:@"07/05/2013"]
                           ];
    calendar.onlyShowCurrentMonth = NO;
    calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    calendar.frame = CGRectMake(10, 10, 300, 200);
    [self.view addSubview:calendar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Calendar-Data-Source
#pragma mark
-(CGSize)sizeOfCellIncalendar:(CKCalendarView *)calendar{
    
    return CGSizeMake(140, 120);
}

- (void)localeDidChange
{
    [self.calendarView setLocale:[NSLocale currentLocale]];
}
//
- (BOOL)dateIsDisabled:(NSDate *)date
{
    // NSLog(@"%@",self.disabledDates);
    for (NSDate *disabledDate in self.disabledDates)
    {
        //NSLog(@"for loop");
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
        //NSLog(@"Color changed");
        dateItem.backgroundColor = [UIColor whiteColor];
        dateItem.textColor = [UIColor grayColor];
    }
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date
{
    return ![self dateIsDisabled:date];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Add Event" message:@"Do You want add an event?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    datestr = [NSString stringWithFormat:@"%@",[self.dateFormatter stringFromDate:date]];
    self.selecteddate = [self.dateFormatter dateFromString:datestr];
    // NSLog(@" Selected date %@",datestr);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1)
    {
        NSUserDefaults *add1 = [NSUserDefaults standardUserDefaults];
        NSString *savestring = [NSString stringWithString:datestr];
        NSLog(@"data saved  %@",savestring);
        [add1 setObject:savestring forKey:@"savedstring"];
        [add1 synchronize];
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
    else if (buttonIndex == 0)
    {
        NSLog(@"No Need to add an event");
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
    NSString *title = @"Add Your Event";
    
    // try to find an event
    
    EKEvent *event = [self findEventWithTitle:title inEventStore:store];
    
    // if found, use it
    
    if (event)
        return event;
    
    // if not, let's create new event
    
    event = [EKEvent eventWithEventStore:store];
    
    event.title = title;
    event.notes = @"Event notes";
    event.location = @"Event Location";
    event.calendar = [store defaultCalendarForNewEvents];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = 4;
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
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create the start range date components
    NSDateComponents *oneDayAgoComponents = [[NSDateComponents alloc] init];
    oneDayAgoComponents.day = -1;
    NSDate *oneDayAgo = [calendar dateByAddingComponents:oneDayAgoComponents
                                                  toDate:[NSDate date]
                                                 options:0];
    
    // Create the end range date components
    NSDateComponents *oneWeekFromNowComponents = [[NSDateComponents alloc] init];
    oneWeekFromNowComponents.day = 7;
    NSDate *oneWeekFromNow = [calendar dateByAddingComponents:oneWeekFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:oneDayAgo
                                                            endDate:oneWeekFromNow
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
 //   NSLog(@"%@",events);
    
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

@end
