//
//  TYChatHelper.h
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYConversationListViewController.h"
#import "TYUserListViewController.h"
#import "TYMianViewController.h"
#import "TYChatViewController.h"

#define kHaveUnreadAtMessage    @"kHaveAtMessage"
#define kAtYouMessage           1
#define kAtAllMessage           2


@interface TYChatHelper : NSObject<EMClientDelegate,EMChatManagerDelegate,EMContactManagerDelegate,EMGroupManagerDelegate,EMChatroomManagerDelegate>

@property (nonatomic, weak) TYUserListViewController *contactViewVC; // 添加联系人

@property (nonatomic, weak) TYConversationListViewController *conversationListVC; // 聊天列表

@property (nonatomic, weak) TYChatViewController *chatVC; // 聊天室

@property (nonatomic, weak) TYMianViewController *mainVC;


+ (instancetype)shareHelper;

- (void)asyncPushOptions;

- (void)asyncGroupFromServer;

- (void)asyncConversationFromDB;

@end
