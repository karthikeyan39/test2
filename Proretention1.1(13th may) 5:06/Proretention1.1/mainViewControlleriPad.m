//
//  mainViewControlleriPad.m
//  Proretention1.1
//
//  Created by sandip sayaji kote on 02/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "mainViewControlleriPad.h"
#import "Design_3_Final_ViewController_iPad.h"
#import "Appointment_ViewController_ipad.h"
//#import "newTicket_window.h"


@interface mainViewControlleriPad ()

@end

@implementation mainViewControlleriPad



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
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(insertNewObject:)];
    navController.navigationItem.leftBarButtonItem = addButton;

    
    // Do any additional setup after loading the view from its nib.
}

- (void)insertNewObject:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LogOut_ipad:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.modalTransitionStyle=UIModalPresentationFullScreen;


}

- (IBAction)Startmethod:(id)sender {
//    myfinalSplitUIview_ipad=[[final_SplitViewController_ipad alloc]init];
//    [self presentViewController:myfinalSplitUIview_ipad animated:YES completion:nil];
    
    // ++++++++++++++++++++++   DESIGN 1  +++++++++++++++++++//
    
//    final_ViewController_ipad *vc = [[final_ViewController_ipad alloc] initWithNibName:@"final_ViewController_ipad" bundle:nil];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentModalViewController:navController animated:YES];
   
  
    // ++++++++++++++++++++++   DESIGN 2  +++++++++++++++++++//

//    design2_FinalViewController_iPad *myFinalViewCOntroller_Design2=[[design2_FinalViewController_iPad alloc]init];
//    myFinalViewCOntroller_Design2.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:myFinalViewCOntroller_Design2 animated:YES completion:nil];

    // ++++++++++++++++++++++   DESIGN 3  +++++++++++++++++++//
    
//    Design_3_Final_ViewController_iPad *Design2_view=[[Design_3_Final_ViewController_iPad alloc]init];
    //Design2_view.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
   // [self presentViewController:Design2_view animated:YES completion:nil];
    

}

- (IBAction)CreateTicket_iPad:(id)sender {
//    newTicket_window *tick=[[newTicket_window alloc]init];
//    tick.modalTransitionStyle=UIModalTransitionStylePartialCurl;
//    [self presentViewController:tick animated:YES completion:nil];
    
}

- (IBAction)Create_Appointment_ipad:(id)sender
{
   
    Appointment_ViewController_ipad *createAppointment=[[Appointment_ViewController_ipad alloc]init];
    
    createAppointment.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    
    //createAppointment.modalTransitionStyle=UIViewAnimationOptionTransitionFlipFromTop;
    
    [self presentViewController:createAppointment animated:YES completion:nil];
}
@end
