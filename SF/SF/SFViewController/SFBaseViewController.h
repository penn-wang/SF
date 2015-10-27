//
//  SFBaseViewController.h
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBaseViewController : UIViewController

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat navOffset;
@property (nonatomic, assign) CGFloat statusBarOffset;

- (void)popToViewControllerWithName:(NSString *)vcName;

- (void)rightNavItemWithName:(NSString *)name;

- (void)rightNavItemSet;
- (void)leftNavItemBack;
- (void)leftNavItemCancel;
@end
