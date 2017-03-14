//
//  TYNavigationViewController.m
//  TYMovie
//
//  Created by 余锦海 on 17/3/12.
//  Copyright © 2017年 余锦海. All rights reserved.
//

#import "TYNavigationViewController.h"

@interface TYNavigationViewController ()

@end

@implementation TYNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].tintColor=[UIColor whiteColor];
    [UINavigationBar appearance].barTintColor=[UIColor ty_lightBlackColor];
    [UINavigationBar appearance].titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    

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
