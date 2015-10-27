//
//  SFPhotoPickedView.h
//  SF
//
//  Created by penn on 15/10/27.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFPhotoPickedViewData : NSObject

@property (nonatomic, strong) UIImage *bigImage;
@property (nonatomic, strong) UIImage *smallImage;
- (id)initWithBigImage:(UIImage *)bigImage smallImage:(UIImage *)smallImage;

@end

@interface SFPhotoPickedView : UIView

- (id)initWithOriginY:(CGFloat)originY;

- (void)addViews:(NSArray *)dataArray;

- (CGFloat)getHeight;

@end
