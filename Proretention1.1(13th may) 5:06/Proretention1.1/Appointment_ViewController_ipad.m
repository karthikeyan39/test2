//
//  Appointment_ViewController_ipad.m
//  Proretention1.1
//
//  Created by sandip sayaji kote on 05/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "Appointment_ViewController_ipad.h"

@interface Appointment_ViewController_ipad ()

@end

@implementation Appointment_ViewController_ipad

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackToMainView_ipad:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
