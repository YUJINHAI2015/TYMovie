//
//  TYUserListViewController.h
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYUserListViewController : EaseUsersListViewController
//@property (strong, nonatomic) GroupListViewController *groupController;

//好友请求变化时，更新好友请求未处理的个数
- (void)reloadApplyView;

//好友个数变化时，重新获取数据
- (void)reloadDataSource;

//添加好友的操作被触发
- (void)addFriendAction;
@end
