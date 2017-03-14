//
//  AppDelegate+TYEaseMob.h
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (TYEaseMob)
- (void)easemobApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig;

- (void)easemobApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
@end
