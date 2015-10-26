//
//  SFPhotoPickerCell.h
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SFClickImageView;

extern const NSInteger cellImageMaxCount;

@protocol  SFPhotoPickerCellDelegate <NSObject>
@optional
- (void)didClickOnImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status;
- (void)didPickImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status;
@end


@protocol PPCellImageDelegate <NSObject>

@optional
- (void)didClickOnImage:(NSInteger)aTag status:(BOOL)status;
- (void)didClickOnPicker:(NSInteger)aTag status:(BOOL)status;
@end

@interface PPCellImage : UIView

@property (nonatomic, strong) SFClickImageView *imageView;
@property (nonatomic, strong) SFClickImageView *pickerImageView;
@property (nonatomic, assign) bool status;

@property (nonatomic, unsafe_unretained) id<PPCellImageDelegate> delegate;

- (void)layOutViews:(CGRect)frame;

- (void)showImage:(UIImage *)image;
- (void)clear;

@end

@interface SFPhotoPickerCell : UITableViewCell

@property (nonatomic, weak) id<SFPhotoPickerCellDelegate> delegate;

-(void)cellContent:(NSArray *)imageArray indexs:(NSArray *)indexArray; //在所有photos的index
+ (CGFloat)cellHeight;



@end
