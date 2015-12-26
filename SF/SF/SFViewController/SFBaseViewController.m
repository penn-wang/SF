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
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.contentHeight = self.screenHeight-64.0f;
    self.navOffset = 64.0f;
    self.statusBarOffset = 20.0f;
    
    [self leftNavItemBack];
}

- (void)popToViewControllerWithName:(NSString *)vcName {
    if (vcName==nil || vcName.length<=0) {
        return;
    }
    if(!self.navigationController) {
        return;
    }
    UIViewController *targetVC;
    for (NSInteger i=0; i<self.navigationController.viewControllers.count; i++) {
        UIViewController *vc = (UIViewController *)[self.navigationController.viewControllers objectAtIndex:i];
        if ([vc isKindOfClass:NSClassFromString(vcName)]) {
            targetVC = vc;
            break;
        }
    }
    if(targetVC) {
        [self.navigationController popToViewController:targetVC animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"class:::%@", NSStringFromClass([self class]));
}

#pragma -mark -
#pragma -mark -conmon Nav

- (void)rightNavItemWithName:(NSString *)name {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    [button addTarget:self action:@selector(didClickOnRigthNavItem) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = NAV_TITLE_FONT;
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)rightNavItemSet {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    [button addTarget:self action:@selector(didClickOnRigthNavItem) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = NAV_TITLE_FONT;
    [button setTitle:@"设置" forState:UIControlStateNormal];
    [button setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)rightNavItemSave {
    
}

- (void)didClickOnRigthNavItem {
    //请重写此方法
}

- (void)leftNavItemBack {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    [button addTarget:self action:@selector(didClickOnLeftNavItem) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = NAV_TITLE_FONT;
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)leftNavItemCancel {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    [button addTarget:self action:@selector(didClickOnLeftNavItem) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = NAV_TITLE_FONT;
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)didClickOnLeftNavItem {
    //如果是模态视图 请重写此方法
    [self.navigationController popViewControllerAnimated:YES];
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
