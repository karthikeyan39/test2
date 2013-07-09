//
//  AppDelegate.h
//  Proretention1.1
//
//  Created by sandip sayaji kote on 02/04/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BOOL *submitquery;
    BOOL *activealarm;
     int *alert;
}
@property (nonatomic, readwrite) int *alert;
@property (nonatomic, assign) BOOL *submitquery;
@property (nonatomic, assign) BOOL *stafforstudent;
@property (nonatomic, assign) BOOL *activealarm;
@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,strong)UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *viewController;

@end
