//
//  TYChatViewController.h
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KNOTIFICATIONNAME_DELETEALLMESSAGE @"RemoveAllMessages"

@interface TYChatViewController : EaseMessageViewController<EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource>

- (void)showMenuViewController:(UIView *)showInView
                  andIndexPath:(NSIndexPath *)indexPath
                   messageType:(EMMessageBodyType)messageType;
@end
