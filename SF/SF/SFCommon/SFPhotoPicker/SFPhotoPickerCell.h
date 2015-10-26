//
//  SFPhotoPickerCell.h
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const NSInteger cellImageMaxCount;

@protocol  SFPhotoPickerCellDelegate <NSObject>
@optional
- (void)didClickOnImageWithIndex:(NSInteger)aIndex;
- (void)didPickImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status;
@end

@interface SFPhotoPickerCell : UITableViewCell

@property (nonatomic, weak) id<SFPhotoPickerCellDelegate> delegate;

-(void)cellContent:(NSArray *)imageArray indexs:(NSArray *)indexArray; //在所有photos的index
+ (CGFloat)cellHeight;



@end
