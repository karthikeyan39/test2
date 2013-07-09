//
//  Campus.m
//  Proretention1.1
//
//  Created by Admin on 21/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "Campus.h"
#import "MyprofileViewController.h"
#import "NewLoginViewController.h"
#import "AppDelegate.h"
#import "StaffViewController.h"
#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 1.5
@interface Campus (UtilityMethods)
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;@end

@implementation Campus
@synthesize imageScrollView,imageView,details, detailsScrollView, alertbutton, pressbutton,fromselection,toselection;
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
    array = [NSMutableArray arrayWithObjects:@"Academic Registry",
             
             @"Business School",
             
             @"Department of Education",
             
             @"Financial Services",
             
             @"Learning Resource Center",
             
             @" School of Health & Education",
             
             @"School of Law",
             
             @"School of Media",
             
             @"School of Science & Technology",
             
             @"Sheppard Library",
             
             @"Student Marketing & Recruitment",
             
             @"Student Service Building",
             
             @"Student Union Building",
             
             @"Unihelp", nil];
    
    array1 = [NSMutableArray arrayWithObjects:@"Academic Registry",
              
              @"Business School",
              
              @"Department of Education",
              
              @"Financial Services",
              
              @"Learning Resource Center",
              
              @" School of Health & Education",
              
              @"School of Law",
              
              @"School of Media",
              
              @"School of Science & Technology",
              
              @"Sheppard Library",
              
              @"Student Marketing & Recruitment",
              
              @"Student Service Building",
              
              @"Student Union Building",
              
              @"Unihelp", nil];
    showing = NO;
    showing1 = NO;

    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
   mapani.image = [UIImage imageNamed:@"maps22.png"];
    fromselection.layer.borderWidth = 2;
    fromselection.layer.cornerRadius = 12;
    fromselection.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    getdirection.layer.borderWidth = 2;
    getdirection.layer.cornerRadius = 8;
    getdirection.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    fromvalue.layer.borderWidth = 2;
    fromvalue.layer.cornerRadius = 8;
    fromvalue.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    tovalue.layer.borderWidth = 2;
    tovalue.layer.cornerRadius = 8;
    tovalue.layer.borderColor = [[UIColor lightGrayColor] CGColor];

    toselection.layer.borderWidth = 2;
    toselection.layer.cornerRadius = 12;
    toselection.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    fromarray  = [NSMutableArray arrayWithObjects:@"", nil];
    imageView.image = [UIImage imageNamed:@"map1.png"];
    details.image = [UIImage imageNamed:@"map00.png"];
    [imageView setTag:ZOOM_VIEW_TAG];
    [details setTag:ZOOM_VIEW_TAG];
    // add gesture recognizers to the image view
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    
    [doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    
    [imageView addGestureRecognizer:singleTap];
    [imageView addGestureRecognizer:doubleTap];
    [imageView addGestureRecognizer:twoFingerTap];
    
    [details addGestureRecognizer:singleTap];
    [details addGestureRecognizer:doubleTap];
    [details addGestureRecognizer:twoFingerTap];

    // calculate minimum scale to perfectly fit image width, and begin at that scale
    float minimumScale = [imageScrollView frame].size.width  / [imageView frame].size.width;
    [imageScrollView setMinimumZoomScale:minimumScale];
    [imageScrollView setZoomScale:minimumScale];
    
    // Do any additional setup after loading the view from its nib.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
  
}
-(IBAction)location
{
    locationview.hidden = NO;
}
-(IBAction)goaction
{
    lbl1.hidden = NO;
        lbl2.hidden = NO;
        lbl3.hidden = NO;
        lbl4.hidden = NO;
    
    mapani.hidden= NO;
    locationview.hidden = YES;
    //[fromtable reloadData];
  //  [totable reloadData];
    mapani.animationImages = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"maps1.png"],[UIImage imageNamed:@"maps2.png"],[UIImage imageNamed:@"maps3.png"],[UIImage imageNamed:@"maps4.png"],[UIImage imageNamed:@"maps5.png"],[UIImage imageNamed:@"maps6.png"],[UIImage imageNamed:@"maps7.png"],[UIImage imageNamed:@"maps8.png"],[UIImage imageNamed:@"maps9.png"],[UIImage imageNamed:@"maps10.png"],[UIImage imageNamed:@"maps11.png"],[UIImage imageNamed:@"maps12.png"],[UIImage imageNamed:@"maps13.png"],[UIImage imageNamed:@"maps14.png"],[UIImage imageNamed:@"maps15.png"],[UIImage imageNamed:@"maps16.png"],[UIImage imageNamed:@"maps17.png"],[UIImage imageNamed:@"maps18.png"],[UIImage imageNamed:@"maps19.png"],[UIImage imageNamed:@"maps20.png"],[UIImage imageNamed:@"maps21.png"],[UIImage imageNamed:@"maps22.png"],nil];
    [mapani setAnimationRepeatCount:1];
    
    mapani.animationDuration = 5;
    
    [mapani startAnimating];
    mapani.image = [UIImage imageNamed:@"maps22.png"];

}
/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark TapDetectingImageViewDelegate methods

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    // single tap does nothing for now
}
- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"Double Tapping");
    float newScale = [imageScrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
    
   
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer
{
    // two-finger tap zooms out
    float newScale = [imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    zoomRect.size.height = [imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [imageScrollView frame].size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
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
-(IBAction)firstmap
{
   
    imageView.image = [UIImage imageNamed:@"map1.png"];
    details.image = [UIImage imageNamed:@"map00.png"];
    mapani.hidden = YES;
     imageView.hidden =NO;
}
-(IBAction)secondmap
{
    imageView.image = [UIImage imageNamed:@"map2.png"];
    details.image = [UIImage imageNamed:@"map00.png"];
    mapani.hidden = YES;
     imageView.hidden =NO;
}
-(IBAction)thirdmap
{
    imageView.image = [UIImage imageNamed:@"map3.png"];
    details.image = [UIImage imageNamed:@"map00.png"];
    mapani.hidden = YES;
     imageView.hidden =NO;
}
-(IBAction)fourthmap
{
    imageView.image = [UIImage imageNamed:@"map4.png"];
    details.image = [UIImage imageNamed:@"map00.png"];
    mapani.hidden = YES;
     imageView.hidden =NO;
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
  //  NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
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
                NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
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
                MyprofileViewController *profileactionview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
                [self presentViewController:profileactionview animated:NO completion:nil];
            }
            if (buttonIndex == 1)
            {
                NewLoginViewController *backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
                [self presentViewController:backtologin animated:NO completion:nil];
            }
        }
        
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( tableView == fromtable)
    {
//        if(showing)
//        {
            return [ array count];
//        }
//        else
//        {
//            return 1;
//        }
    }
    
    if( tableView == totable)
   {
//        if(showing1)
//        {
            return [ array1 count];
//        }
//        else
//        {
//            return 1;
//        }
    }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if( tableView == fromtable)
    {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        
        // Configure the cell...
//        if( showing)
//        {
            cell.textLabel.text = [array objectAtIndex:indexPath.row];
       // }
//        else
//        {
//            cell.textLabel.text = [array objectAtIndex:0];
//            cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
//        }
        
        return cell;
    }
    
    if( tableView == totable)
    {
        static NSString *CellIdentifier1 = @"Cell1";
        
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        if (cell1 == nil) {
            
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
            
        }
        
        // Configure the cell...
//        if( showing1)
//        {
            cell1.textLabel.text = [array1 objectAtIndex:indexPath.row];
     //   }
//        else
//        {
//            cell1.textLabel.text = [array1 objectAtIndex:0];
//            cell1.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
//        }
        
        return cell1;
    }
    return 0;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    getcell = [tableView cellForRowAtIndexPath:indexPath];
    celltext = getcell.textLabel.text;
    if(tableView == fromtable)
    {
      //  [ fromvalue setTitle:celltext forState:UIControlStateNormal];
       // [array1 removeObject:celltext];
     //   [totable reloadData];
     //   fromtable.hidden = YES;
       // totable.hidden = YES;
    }
    if(tableView == totable)
    {
      //  [ tovalue setTitle:celltext forState:UIControlStateNormal];
        
          //  fromtable.hidden = YES;
      //  totable.hidden = YES;
    }
}
-(IBAction)frombtn
{
    fromtable.hidden = NO;
}
-(IBAction)tobtn
{
    totable.hidden = NO;
}
@end
