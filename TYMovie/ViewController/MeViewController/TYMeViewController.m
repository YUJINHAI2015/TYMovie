//
//  TYMeViewController.m
//  TYMovie
//
//  Created by yiLian on 17/3/14.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "TYMeViewController.h"
#import "TYUserProfileViewController.h"
<<<<<<< HEAD
=======
#import "TYApplyViewController.h"
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
@interface TYMeViewController ()
- (IBAction)profileAction:(UIButton *)sender;
- (IBAction)logOutAction:(UIButton *)sender;

@end

@implementation TYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

<<<<<<< HEAD
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

=======
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
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
<<<<<<< HEAD
//                [[ApplyViewController shareController] clear];
=======
                [[TYApplyViewController shareController] clear];
>>>>>>> 26c38f5ee33ba6fea4058e9b8efaecd9ff339fa7
                [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
            }
        });
    });
}
@end
