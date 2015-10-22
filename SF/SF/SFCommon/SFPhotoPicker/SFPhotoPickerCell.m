//
//  SFPhotoPickerCell.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoPickerCell.h"
#import "SFClickImageView.h"


static const CGFloat cellPerMargin = 10;
const NSInteger cellImageMaxCount = 4;
static const NSInteger cellImageTag = 100000;

typedef NS_ENUM(NSInteger, SFPhotoPickerCellType) {
    E_Cell_Type_OneImg,
    E_Cell_Type_TwoImg,
    E_Cell_Type_ThreeImg,
    E_Cell_Type_FourImg
};

@interface SFPhotoPickerCell () {
    SFClickImageView *_firstImage;
    SFClickImageView *_secondImage;
    SFClickImageView *_thirdImage;
    SFClickImageView *_fourImage;
    CGFloat _perLength;
    
    SFPhotoPickerCellType _type;
}

@end

@implementation SFPhotoPickerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentViews];
    }
    return self;
}

- (void)initContentViews {
    _firstImage = [[SFClickImageView alloc] init];
    [_firstImage addTarget:self selector:@selector(clickOnImage:)];
    [self.contentView addSubview:_firstImage];
    _secondImage = [[SFClickImageView alloc] init];
    [_secondImage addTarget:self selector:@selector(clickOnImage:)];
    [self.contentView addSubview:_secondImage];
    _thirdImage = [[SFClickImageView alloc] init];
    [_thirdImage addTarget:self selector:@selector(clickOnImage:)];
    [self.contentView addSubview:_thirdImage];
    _fourImage = [[SFClickImageView alloc] init];
    [_fourImage addTarget:self selector:@selector(clickOnImage:)];
    [self.contentView addSubview:_fourImage];
    
    _perLength = ([UIScreen mainScreen].bounds.size.width-cellPerMargin*(cellImageMaxCount+1))/cellImageMaxCount;
}

+ (CGFloat)cellHeight {
    return ([UIScreen mainScreen].bounds.size.width-cellPerMargin*(cellImageMaxCount+1))/cellImageMaxCount + cellPerMargin;
}

-(void)cellContent:(NSArray *)imageArray indexs:(NSArray *)indexArray {
    if(imageArray==nil || imageArray.count<=0 || imageArray.count>cellImageMaxCount) {
        return;
    }
    if(indexArray==nil || indexArray.count<=0 || indexArray.count>cellImageMaxCount) {
        return;
    }
    [self resetImages:imageArray indexs:indexArray];
}

- (void)resetImages:(NSArray *)imageArray indexs:(NSArray *)indexArray {
    switch (imageArray.count) {
        case 1:
            _firstImage.image = [imageArray objectAtIndex:0];
            _secondImage.image = nil;
            _thirdImage.image = nil;
            _fourImage.image = nil;
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            break;
        case 2:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = nil;
            _fourImage.image = nil;
            break;
        case 3:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = [imageArray objectAtIndex:2];
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _fourImage.image = nil;
            break;
        case 4:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = [imageArray objectAtIndex:2];
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _fourImage.image = [imageArray objectAtIndex:3];
            _fourImage.tag = [[indexArray objectAtIndex:3] integerValue] + cellImageTag;
            break;
        default:
            break;
    }
}

- (void)layoutSubviews {
    _firstImage.frame = CGRectMake(cellPerMargin, cellPerMargin/2, _perLength, _perLength);
    _secondImage.frame = CGRectMake(cellPerMargin*2+_perLength, cellPerMargin/2, _perLength, _perLength);
    _thirdImage.frame = CGRectMake(cellPerMargin*3+_perLength*2, cellPerMargin/2, _perLength, _perLength);
    _fourImage.frame = CGRectMake(cellPerMargin*4+_perLength*3, cellPerMargin/2, _perLength, _perLength);
}

- (void)clickOnImage:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(didClickOnCellImageWithIndex:)]) {
        SFClickImageView *image = (SFClickImageView *)sender;
        [self.delegate didClickOnCellImageWithIndex:(image.tag-cellImageTag)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
