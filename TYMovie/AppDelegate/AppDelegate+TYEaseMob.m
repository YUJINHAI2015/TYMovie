//
//  AppDelegate+TYEaseMob.m
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "AppDelegate+TYEaseMob.h"
#import "TYChatHelper.h"
#import "TYNavigationViewController.h"
#import "TYApplyViewController.h"
#import "TYLoginViewController.h"
@implementation AppDelegate (TYEaseMob)
- (void)easemobApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig
{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNOTIFICATION_LOGINCHANGE
                                               object:nil];
    // 环信后台注册
    [[EaseSDKHelper shareHelper] hyphenateApplication:application
                        didFinishLaunchingWithOptions:launchOptions
                                               appkey:appkey
                                         apnsCertName:apnsCertName
                                          otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES],@"easeSandBox":[NSNumber numberWithBool:NO]}];
    
    BOOL isAutoLogin = [EMClient sharedClient].isAutoLogin;
    if (isAutoLogin){
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    }
}

- (void)easemobApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [[EaseSDKHelper shareHelper] hyphenateApplication:application didReceiveRemoteNotification:userInfo];
}
#pragma mark - App Delegate

// 将得到的deviceToken传给SDK
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[EMClient sharedClient] bindDeviceToken:deviceToken];
    });
}

// 注册deviceToken失败，此处失败，与环信SDK无关，一般是您的环境配置或者证书配置有误
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"apns.failToRegisterApns", Fail to register apns)
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
}
#pragma mark - login changed

- (void)loginStateChange:(NSNotification *)notification
{
<<<<<<< HEAD
    TYNavigationViewController *navigationController = nil;
    navigationController.navigationBar.accessibilityIdentifier = @"navigationbar";
=======
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7

    BOOL loginSuccess = [notification.object boolValue];
    if (loginSuccess) {//登陆成功加载主窗口控制器
        //加载申请通知的数据
<<<<<<< HEAD
//        [[TYApplyViewController shareController] loadDataSourceFromLocalDB];
        if (self.mainController == nil) {
            self.mainController = [[TYMianViewController alloc] init];
            navigationController = [[TYNavigationViewController alloc] initWithRootViewController:self.mainController];
        }else{
            navigationController  = (TYNavigationViewController *)self.mainController.navigationController;
        }
        navigationController.navigationBar.accessibilityIdentifier = @"navigationbar";

        self.window.rootViewController = navigationController;

        [TYChatHelper shareHelper].mainVC = self.mainController; // 初始化mainVC
        [[TYChatHelper shareHelper] asyncGroupFromServer];
=======
        [[TYApplyViewController shareController] loadDataSourceFromLocalDB];
        if (self.mainController == nil) {
            self.mainController = [[TYMianViewController alloc] init];
        }

        self.window.rootViewController = self.mainController;

        [TYChatHelper shareHelper].mainVC = self.mainController; // 初始化mainVC
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
        [[TYChatHelper shareHelper] asyncConversationFromDB];
        [[TYChatHelper shareHelper] asyncPushOptions];
    }
    else{//登陆失败加载登陆页面控制器
        if (self.mainController) {
            [self.mainController.navigationController popToRootViewControllerAnimated:NO];
        }
        self.mainController = nil;
        [TYChatHelper shareHelper].mainVC = nil;
        
        TYLoginViewController *loginController = InitVCFromStoryBoard(@"TYLoginStoryboard");
        self.window.rootViewController = loginController;
    }
<<<<<<< HEAD
=======
    
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
}

#pragma mark - EMPushManagerDelegateDevice

// 打印收到的apns信息
-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:userInfo
                                                        options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *str =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"apns.content", @"Apns content")
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end
