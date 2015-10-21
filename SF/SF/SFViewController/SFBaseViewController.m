//
//  SFBaseViewController.m
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFBaseViewController ()

@end

@implementation SFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.contentHeight = self.screenHeight-64.0f;
}

#pragma -mark -
#pragma -mark -conmon Nav

- (void)rightNavItemSet {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    [button addTarget:self action:@selector(didClickOnRigthNavItem) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = NAV_TITLE_FONT;
    [button setTitle:@"设置" forState:UIControlStateNormal];
    [button setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)didClickOnRigthNavItem {
    //请重写此方法
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
