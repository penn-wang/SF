//
//  SFNewViewController.m
//  SF
//
//  Created by penn on 15/10/21.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFNewViewController.h"

@interface SFNewViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;

@end

@implementation SFNewViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftNavItemCancel];
    [self rightNavItemWithName:@"保存"];
    self.textView = [SFUICreator SFCommonTextView:self frame:CGRectMake(10, self.navOffset+10, self.screenWidth-20, 100)];
    self.textView.backgroundColor = [UIColor lightGrayColor];
    self.textView.text = @"保存";
    [self.view addSubview:self.textView];
}

- (void)didClickOnLeftNavItem {
    if([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didClickOnRigthNavItem {
    
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
