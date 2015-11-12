//
//  SFPhotoPickedView.h
//  SF
//
//  Created by penn on 15/10/27.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SFPhotoPickedViewDelegate <NSObject>
@optional
- (void)shouldAddPhotos;
- (void)shouldShowPhotos:(NSArray *)dataArray index:(NSInteger)aIndex;
@end

@interface SFPhotoPickedView : UIView

@property (nonatomic, strong) id<SFPhotoPickedViewDelegate> delegate;

- (id)initWithOriginY:(CGFloat)originY;
- (void)addPhotoImageViews:(NSArray *)dataArray;


@end
