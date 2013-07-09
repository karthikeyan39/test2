//
//  AppDelegate.m
//  Proretention1.1
//
//  Created by sandip sayaji kote on 02/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "NewLoginViewController.h"
//#import "videoplayer.h"
@implementation AppDelegate
@synthesize navigationController;
@synthesize submitquery;
@synthesize alert;
@synthesize activealarm;
@synthesize stafforstudent;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NewLoginViewController *newlogin;
   
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
        newlogin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
    }
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:newlogin];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
//                                         pathForResource:@"prorentention" ofType:@"mp4"]];
//    
//    MPMoviePlayerViewController *playercontroller = [[MPMoviePlayerViewController alloc]
//                                                     initWithContentURL:url];
//    
//    [self presentMoviePlayerViewControllerAnimated:playercontroller];
//    
//    playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
//    
//    [playercontroller.moviePlayer play];
//    
//    playercontroller = nil;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setBool:NO forKey:@"notFirst3"];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"startvideo"];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
