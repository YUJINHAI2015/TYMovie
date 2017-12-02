//
//  TYTabBarViewController.m
//  TYMovie
//
//  Created by yiLian on 17/3/17.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "TYTabBarViewController.h"
#import "TYNavigationViewController.h"
@interface TYTabBarViewController ()

@end

@implementation TYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}
#pragma mark - private

- (void)setupSubviews
{
    NSMutableArray <UIViewController *>*viewControllers = @[].mutableCopy;
    
    NSArray *tabbarNormalImage = @[@"tabbar_chats",@"tabbar_contacts",@"tabbar_setting",@"tabbar_setting"];
    NSArray *tabBarSeleteImage = @[@"tabbar_chatsHL",@"tabbar_contactsHL",@"tabbar_settingHL",@"tabbar_setting"];
    NSArray *VCClassArray = @[@"TYConversationListViewController",
                              @"TYUserListViewController",
                              @"TYApplicationViewController",
                              @"TYMeViewController"];
    NSArray *titleArray = @[NSLocalizedString(@"title.conversation", @"Conversations"),
                            NSLocalizedString(@"title.addressbook", @"AddressBook"),
                            NSLocalizedString(@"title.trade", @"Trade"),
                            NSLocalizedString(@"title.me", @"Me")];
    
    [tabbarNormalImage enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class class =  NSClassFromString(VCClassArray[idx]);
        UIViewController *vc = [[class alloc] init];
        vc.tabBarItem.accessibilityIdentifier = obj;
        vc.tabBarItem.title =titleArray[idx];
        vc.title = titleArray[idx];
        vc.tabBarItem.image = [UIImage imageNamed:tabbarNormalImage[idx]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:tabBarSeleteImage[idx]];
        TYNavigationViewController *navi = [[TYNavigationViewController alloc] initWithRootViewController:vc];
        [viewControllers addObject:navi];
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor ty_goldColor];
    self.viewControllers = viewControllers;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
