//
//  AppDelegate.m
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+TYEaseMob.h"
#import <UserNotifications/UserNotifications.h>

#define EaseMobAppKey @"15088132368mob#huanxintestdemo"

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
<<<<<<< HEAD
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
        
=======
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
    if (NSClassFromString(@"UNUserNotificationCenter")) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    }
    _connectionState = EMConnectionConnected;
    
    NSString *apnsCertName = nil;
#if DEBUG
    apnsCertName = @"developmentCeritification";
#else
    apnsCertName = @"distrubitionCertificate";
#endif
<<<<<<< HEAD
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *appkey = [ud stringForKey:@"identifier_appkey"];
    if (!appkey) {
        appkey = EaseMobAppKey;
        [ud setObject:appkey forKey:@"identifier_appkey"];
    }
    
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions
                      appkey:appkey
=======
    
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions
                      appkey:EaseMobAppKey
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
                apnsCertName:apnsCertName
                 otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
    
    return YES;
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if (_mainController) {
        [_mainController jumpToChatList];
    }
    [self easemobApplication:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    if (_mainController) {
        [_mainController didReceiveLocalNotification:notification];
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    [self easemobApplication:[UIApplication sharedApplication] didReceiveRemoteNotification:userInfo];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    if (_mainController) {
        [_mainController didReceiveUserNotification:response.notification];
    }
    completionHandler();
}
@end
