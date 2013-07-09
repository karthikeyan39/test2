//
//  AppointmentsViewController.h
//  Proretention1.1
//
//  Created by Radhakrishnan Selvaraj on 19/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>
@class CKCalendarView;
@protocol CKCalendarDelegate;
@protocol CKCalendarDataSource;
@interface AppointmentsViewController : UIViewController<CKCalendarDataSource,CKCalendarDelegate>

@end
