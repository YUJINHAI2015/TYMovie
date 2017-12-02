//
//  TYConversationListViewController.m
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "TYConversationListViewController.h"
#import "TYChatViewController.h"
#import "TYChatHelper.h"
#import "EMSearchBar.h"
#import "EMSearchDisplayController.h"
#import "RealtimeSearchUtil.h"
<<<<<<< HEAD
#import "SCUserProfileEntity.h"
=======
#import "UserProfileManager.h"
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7


@implementation EMConversation (search)

//根据用户昵称,环信机器人名称,群名称进行搜索
- (NSString*)showName
{
    if (self.type == EMConversationTypeChat) {
<<<<<<< HEAD
//        if ([[RobotManager sharedInstance] isRobotWithUsername:self.conversationId]) {
//            return [[RobotManager sharedInstance] getRobotNickWithUsername:self.conversationId];
//        }
//        return [[UserProfileManager sharedInstance] getNickNameWithUsername:self.conversationId];
    } else if (self.type == EMConversationTypeChat) {
        if ([self.ext objectForKey:@"subject"] || [self.ext objectForKey:@"isPublic"]) {
            return [self.ext objectForKey:@"subject"];
        }
=======
        return [[UserProfileManager sharedInstance] getNickNameWithUsername:self.conversationId];
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
    }
    return self.conversationId;
}


@end
@interface TYConversationListViewController ()<EaseConversationListViewControllerDelegate, EaseConversationListViewControllerDataSource,UISearchDisplayDelegate, UISearchBarDelegate>

<<<<<<< HEAD
@property (nonatomic, strong) UIView                *networkStateView;
@property (nonatomic, strong) EMSearchBar           *searchBar;
=======
@property (nonatomic, strong) UIView                    *networkStateView;
@property (nonatomic, strong) EMSearchBar               *searchBar;
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
@property (strong, nonatomic) EMSearchDisplayController *searchController;

@end

@implementation TYConversationListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    // Do any additional setup after loading the view.
=======
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
    self.showRefreshHeader = YES;
    self.delegate = self;
    self.dataSource = self;
    
    [self networkStateView];
    
    [self tableViewDidTriggerHeaderRefresh];
<<<<<<< HEAD
    [self searchController];
    [self removeEmptyConversationsFromDB];
    [self.view addSubview:self.searchBar];
=======
    
    [self removeEmptyConversationsFromDB];
    
    [self searchController];
    
    [self.view addSubview:self.searchBar];
    
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
    self.tableView.frame = CGRectMake(0, self.searchBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.searchBar.frame.size.height);

}
#pragma mark - removeEmptyConversationsFromDB
- (void)removeEmptyConversationsFromDB
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSMutableArray *needRemoveConversations;
    for (EMConversation *conversation in conversations) {
        if (!conversation.latestMessage || (conversation.type == EMConversationTypeChatRoom)) {
            if (!needRemoveConversations) {
                needRemoveConversations = [[NSMutableArray alloc] initWithCapacity:0];
            }
            
            [needRemoveConversations addObject:conversation];
        }
    }
    
    if (needRemoveConversations && needRemoveConversations.count > 0) {
        [[EMClient sharedClient].chatManager deleteConversations:needRemoveConversations isDeleteMessages:YES completion:nil];
<<<<<<< HEAD
        for (EMConversation *conversation in needRemoveConversations) {
            // 删除会话时删除本地头像昵称
            [SCUserProfileEntity removeUserProfileWithUsername:conversation.conversationId];
        }
    }
}

=======
    }
}
#pragma mark - setter
- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[EMSearchBar alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = NSLocalizedString(@"search", @"search");
        _searchBar.backgroundColor = [UIColor colorWithRed:0.747 green:0.756 blue:0.751 alpha:1.000];
    }
    
    return _searchBar;
}
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
#pragma mark - searchController
- (EMSearchDisplayController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[EMSearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
        _searchController.delegate = self;
        _searchController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _searchController.searchResultsTableView.tableFooterView = [[UIView alloc] init];
        
        // setCellDetail
        __weak TYConversationListViewController *weakSelf = self;
        [_searchController setCellForRowAtIndexPathCompletion:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
            NSString *CellIdentifier = [EaseConversationCell cellIdentifierWithModel:nil];
            EaseConversationCell *cell = (EaseConversationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            // Configure the cell...
            if (cell == nil) {
                cell = [[EaseConversationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            id<IConversationModel> model = [weakSelf.searchController.resultsSource objectAtIndex:indexPath.row];
            cell.model = model;
            NSString *detail = [NSString stringWithFormat:@"%@", [weakSelf conversationListViewController:weakSelf latestMessageTitleForConversationModel:model]];
            cell.detailLabel.text = detail;
            cell.timeLabel.text = [weakSelf conversationListViewController:weakSelf latestMessageTimeForConversationModel:model];
            return cell;
        }];
        
        // setCellHeight
        [_searchController setHeightForRowAtIndexPathCompletion:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
            return [EaseConversationCell cellHeightWithModel:nil];
        }];
        // didSelectRow
        [_searchController setDidSelectRowAtIndexPathCompletion:^(UITableView *tableView, NSIndexPath *indexPath) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            [weakSelf.searchController.searchBar endEditing:YES];
            id<IConversationModel> model = [weakSelf.searchController.resultsSource objectAtIndex:indexPath.row];
            EMConversation *conversation = model.conversation;
            TYChatViewController *chatController;
            chatController = [[TYChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
            chatController.title = [conversation showName];
            [weakSelf.navigationController pushViewController:chatController animated:YES];
        }];
    }
    
    return _searchController;
}

<<<<<<< HEAD
#pragma mark - EaseConversationListViewControllerDelegate

- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel
=======

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    __weak typeof(self) weakSelf = self;
    [[RealtimeSearchUtil currentUtil] realtimeSearchWithSource:self.dataArray searchText:(NSString *)searchText collationStringSelector:@selector(title) resultBlock:^(NSArray *results) {
        if (results) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.searchController.resultsSource removeAllObjects];
                [weakSelf.searchController.resultsSource addObjectsFromArray:results];
                [weakSelf.searchController.searchResultsTableView reloadData];
            });
        }
    }];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [[RealtimeSearchUtil currentUtil] realtimeSearchStop];
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}
#pragma mark - EaseConversationListViewControllerDelegate

- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController didSelectConversationModel:(id<IConversationModel>)conversationModel
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
{
    if (conversationModel) {
        EMConversation *conversation = conversationModel.conversation;
        if (conversation) {
            UIViewController *chatController = nil;
            chatController = [[TYChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
            chatController.title = conversationModel.title;
            chatController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:chatController animated:YES];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];
        [self.tableView reloadData];
    }
}

#pragma mark - EaseConversationListViewControllerDataSource

<<<<<<< HEAD
- (id<IConversationModel>)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                                    modelForConversation:(EMConversation *)conversation
{
    EaseConversationModel *model = [[EaseConversationModel alloc] initWithConversation:conversation];
    if (model.conversation.type == EMConversationTypeChat) {
        // 头像和昵称
        //从本地获取
        NSString *nickName = [SCUserProfileEntity getNickNameWithUsername:conversation.conversationId];
        if (nickName) {
            model.title = nickName;
        } else {
            //本地拿不到，先在这从服务器获取昵称，再保存到本地，比如下面这个“服务器—%@”就是从服务器获取了后传进来的
            [SCUserProfileEntity saveUserProfileWithUsername:conversation.conversationId forNickName:[NSString stringWithFormat:@"%@-服务器",model.title] avatarURLPath:nil];
            //保存到本地后，从本地获取
            model.title = [SCUserProfileEntity getNickNameWithUsername:conversation.conversationId];
            nickName = model.title;
        }

        NSString *avatarURLPath = [SCUserProfileEntity getavatarURLPathWithUsername:conversation.conversationId];
        if (avatarURLPath) {
            model.avatarURLPath = avatarURLPath;
        } else {
            [SCUserProfileEntity saveUserProfileWithUsername:conversation.conversationId forNickName:nickName avatarURLPath:@"http://img.qq745.com/uploads/allimg/150304/4-150304134634-50.jpg"];
            model.avatarURLPath = [SCUserProfileEntity getavatarURLPathWithUsername:conversation.conversationId];
=======
- (id<IConversationModel>)conversationListViewController:(EaseConversationListViewController *)conversationListViewController modelForConversation:(EMConversation *)conversation
{
    // 获取到model
    EaseConversationModel *model = [[EaseConversationModel alloc] initWithConversation:conversation];
    if (model.conversation.type == EMConversationTypeChat) {
        // 获取用户列表的信息（用属性列表）
        UserProfileEntity *profileEntity = [[UserProfileManager sharedInstance] getUserProfileByUsername:conversation.conversationId];
        if (profileEntity) {
            model.title = profileEntity.nickname == nil ? profileEntity.username : profileEntity.nickname;
            model.avatarURLPath = profileEntity.imageUrl;
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
        }
    }
    return model;
}

<<<<<<< HEAD

=======
//获取最后一条消息显示的内容
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
- (NSAttributedString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@""];
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];
    if (lastMessage) {
        NSString *latestMessageTitle = @"";
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
            case EMMessageBodyTypeImage:{
                latestMessageTitle = NSLocalizedString(@"message.image1", @"[image]");
            } break;
            case EMMessageBodyTypeText:{
                // 表情映射。
                NSString *didReceiveText = [EaseConvertToCommonEmoticonsHelper
                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                latestMessageTitle = didReceiveText;
                if ([lastMessage.ext objectForKey:MESSAGE_ATTR_IS_BIG_EXPRESSION]) {
                    latestMessageTitle = @"[动画表情]";
                }
            } break;
            case EMMessageBodyTypeVoice:{
                latestMessageTitle = NSLocalizedString(@"message.voice1", @"[voice]");
            } break;
            case EMMessageBodyTypeLocation: {
                latestMessageTitle = NSLocalizedString(@"message.location1", @"[location]");
            } break;
            case EMMessageBodyTypeVideo: {
                latestMessageTitle = NSLocalizedString(@"message.video1", @"[video]");
            } break;
            case EMMessageBodyTypeFile: {
                latestMessageTitle = NSLocalizedString(@"message.file1", @"[file]");
            } break;
            default: {
            } break;
        }
        
        if (lastMessage.direction == EMMessageDirectionReceive) {
            NSString *from = lastMessage.from;
            latestMessageTitle = [NSString stringWithFormat:@"%@: %@", from, latestMessageTitle];
        }
        
        NSDictionary *ext = conversationModel.conversation.ext;
        if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtAllMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atAll", nil), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atAll", nil).length)];
            
        }
        else if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtYouMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atMe", @"[Somebody @ me]"), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atMe", @"[Somebody @ me]").length)];
        }
        else {
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
        }
    }
    
    return attributedStr;
}

<<<<<<< HEAD
=======
// 获取最后一条消息显示的时间
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
- (NSString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];;
    if (lastMessage) {
        latestMessageTime = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }
    return latestMessageTime;
}
<<<<<<< HEAD
#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    __weak typeof(self) weakSelf = self;
    [[RealtimeSearchUtil currentUtil] realtimeSearchWithSource:self.dataArray searchText:(NSString *)searchText collationStringSelector:@selector(title) resultBlock:^(NSArray *results) {
        if (results) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.searchController.resultsSource removeAllObjects];
                [weakSelf.searchController.resultsSource addObjectsFromArray:results];
                [weakSelf.searchController.searchResultsTableView reloadData];
            });
        }
    }];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [[RealtimeSearchUtil currentUtil] realtimeSearchStop];
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

=======
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
-(void)refresh
{
    [self refreshAndSortView];
}

-(void)refreshDataSource
{
    [self tableViewDidTriggerHeaderRefresh];
}

- (void)isConnect:(BOOL)isConnect{
    if (!isConnect) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
    
}

- (void)networkChanged:(EMConnectionState)connectionState
{
    if (connectionState == EMConnectionDisconnected) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
}
#pragma mark - getter
- (UIView *)networkStateView
{
    if (_networkStateView == nil) {
        _networkStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
        _networkStateView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:0.5];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (_networkStateView.frame.size.height - 20) / 2, 20, 20)];
        imageView.image = [UIImage imageNamed:@"messageSendFail"];
        [_networkStateView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 5, 0, _networkStateView.frame.size.width - (CGRectGetMaxX(imageView.frame) + 15), _networkStateView.frame.size.height)];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = [UIColor grayColor];
        label.backgroundColor = [UIColor clearColor];
        label.text = NSLocalizedString(@"network.disconnection", @"Network disconnection");
        [_networkStateView addSubview:label];
    }
    return _networkStateView;
}
<<<<<<< HEAD
#pragma mark - setter
- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[EMSearchBar alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = NSLocalizedString(@"search", @"Search");
        _searchBar.backgroundColor = [UIColor colorWithRed:0.747 green:0.756 blue:0.751 alpha:1.000];
    }
    
    return _searchBar;
}
=======

>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
@end
