/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

//  用来处理UIDemo上Parse相关逻辑

#import <Foundation/Foundation.h>

#define kPARSE_HXUSER @"hxuser"
#define kPARSE_HXUSER_USERNAME @"username"
#define kPARSE_HXUSER_NICKNAME @"nickname"
#define kPARSE_HXUSER_AVATAR @"avatar"

@class MessageModel;
@class UserProfileEntity;

@interface UserProfileManager : NSObject

+ (instancetype)sharedInstance;

- (void)initParse;

- (void)clearParse;

/*
 *  上传个人头像
 */
- (void)uploadUserHeadImageProfileInBackground:(UIImage*)image
                                    completion:(void (^)(BOOL success, NSError *error))completion;

/*
 *  上传个人信息
 */
- (void)updateUserProfileInBackground:(NSDictionary*)param
                                    completion:(void (^)(BOOL success, NSError *error))completion;

/*
 *  获取用户信息 by username
 */
- (void)loadUserProfileInBackground:(NSArray*)usernames
                       saveToLoacal:(BOOL)save
                         completion:(void (^)(BOOL success, NSError *error))completion;

/*
 *  获取用户信息 by buddy
 */
- (void)loadUserProfileInBackgroundWithBuddy:(NSArray*)buddyList
                                saveToLoacal:(BOOL)save
                                  completion:(void (^)(BOOL success, NSError *error))completion;

/*
 *  获取本地用户信息
 */
- (UserProfileEntity*)getUserProfileByUsername:(NSString*)username;

/*
 *  获取当前用户信息
 */
- (UserProfileEntity*)getCurUserProfile;

/*
 *  根据username获取当前用户昵称
 */
- (NSString*)getNickNameWithUsername:(NSString*)username;

@end


@interface UserProfileEntity : NSObject

+ (instancetype)initWithPFObject:(NSDictionary*)object;


@property (nonatomic,strong) NSString *objectId; // 唯一标识 客户端可以获取到
@property (nonatomic,strong) NSString *username; // 用户名称
@property (nonatomic,strong) NSString *nickname; // 用户昵称
@property (nonatomic,strong) NSString *imageUrl; // 用户头像


@end
