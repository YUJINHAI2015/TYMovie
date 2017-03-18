//
//  TYMeViewController.m
//  TYMovie
//
//  Created by yiLian on 17/3/14.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "TYMeViewController.h"
#import "TYUserProfileViewController.h"
#import "TYApplyViewController.h"
@interface TYMeViewController ()
- (IBAction)profileAction:(UIButton *)sender;
- (IBAction)logOutAction:(UIButton *)sender;

@end

@implementation TYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)profileAction:(UIButton *)sender {
    TYUserProfileViewController *user = [[TYUserProfileViewController alloc] init];
    [self.navigationController pushViewController:user animated:YES];
}

- (IBAction)logOutAction:(UIButton *)sender {
    [self logoutAction];
}
- (void)logoutAction
{
    __weak TYMeViewController *weakSelf = self;
    [self showHudInView:self.view hint:NSLocalizedString(@"setting.logoutOngoing", @"loging out...")];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = [[EMClient sharedClient] logout:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf hideHud];
            if (error != nil) {
                [weakSelf showHint:error.errorDescription];
            }
            else{
                [[TYApplyViewController shareController] clear];
                [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
            }
        });
    });
}
@end
