//
//  SFNavTitleView.h
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SFNavTitleViewDelegate <NSObject>
@optional
- (void)navTitleDidToPage:(NSInteger)page;
@end

@interface SFNavTitleView : UIView

@property (nonatomic, weak) id<SFNavTitleViewDelegate> delegate;
@property (nonatomic, assign) NSInteger curPage; //0 1 2

- (void)toPage:(NSInteger)page;

@end
