//
//  TYMianViewController.h
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
<<<<<<< HEAD

@interface TYMianViewController : UITabBarController
=======
#import "TYTabBarViewController.h"
@interface TYMianViewController : TYTabBarViewController
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
{
    EMConnectionState _connectionState;
}

- (void)jumpToChatList;

- (void)setupUntreatedApplyCount;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)didReceiveUserNotification:(UNNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;

@end
