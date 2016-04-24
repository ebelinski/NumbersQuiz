//
//  AppDelegate.m
//  NumbersQuiz
//
//  Created by Eugene Belinski on 27/1/15.
//  Copyright (c) 2015 Eugene Belinski. All rights reserved.
//

#import "AppDelegate.h"
#import "QuizViewController.h"
#import "SettingsViewController.h"

NSString * const RangeFrom = @"RangeFrom";
NSString * const RangeTo = @"RangeTo";
NSString * const Language = @"Language";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults objectForKey:RangeFrom] || ![defaults objectForKey:RangeTo]) {
        [defaults setObject:@"1" forKey:RangeFrom];
        [defaults setObject:@"10" forKey:RangeTo];
    }
    
    if (![defaults objectForKey:Language]) {
        [defaults setObject:@"German" forKey:Language];
    }
    
    NSLog(@"Your range: %@-%@", [defaults objectForKey:RangeFrom], [defaults objectForKey:RangeTo]);
    
    QuizViewController *quiz = [[QuizViewController alloc] init];
    UINavigationController *quizNav = [[UINavigationController alloc] initWithRootViewController:quiz];
    
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:settings];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[quizNav, settingsNav];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
