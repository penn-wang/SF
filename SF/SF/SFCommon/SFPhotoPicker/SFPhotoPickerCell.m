//
//  SFPhotoPickerCell.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoPickerCell.h"
#import "SFClickImageView.h"

static const CGFloat cellPerMargin = 5;
const NSInteger cellImageMaxCount = 4;
static const NSInteger cellImageTag = 100000;

typedef NS_ENUM(NSInteger, SFPhotoPickerCellType) {
    E_Cell_Type_OneImg,
    E_Cell_Type_TwoImg,
    E_Cell_Type_ThreeImg,
    E_Cell_Type_FourImg
};

@interface SFPhotoPickerCell () {
    CGFloat _perLength;
    
    SFClickImageView *_firstImage;
    SFClickImageView *_secondImage;
    SFClickImageView *_thirdImage;
    SFClickImageView *_fourImage;
    
    SFClickImageView *_firstPickerImage;
    SFClickImageView *_secondPickerImage;
    SFClickImageView *_thirdPickerImage;
    SFClickImageView *_fourPickerImage;
    
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
    
    _firstPickerImage = [[SFClickImageView alloc] init];
    _firstPickerImage.image = [UIImage imageNamed:@"photo_picker_no"];
    [_firstPickerImage addTarget:self selector:@selector(didClickOnPicker:)];
    [_firstImage addSubview:_firstPickerImage];
    
    _secondPickerImage = [[SFClickImageView alloc] init];
    _secondPickerImage.image = [UIImage imageNamed:@"photo_picker_no"];
    [_secondPickerImage addTarget:self selector:@selector(didClickOnPicker:)];
    [_secondImage addSubview:_secondPickerImage];
    
    _thirdPickerImage = [[SFClickImageView alloc] init];
    _thirdPickerImage.image = [UIImage imageNamed:@"photo_picker_no"];
    [_thirdPickerImage addTarget:self selector:@selector(didClickOnPicker:)];
    [_thirdImage addSubview:_thirdPickerImage];
    
    _fourPickerImage = [[SFClickImageView alloc] init];
    _fourPickerImage.image = [UIImage imageNamed:@"photo_picker_no"];
    [_fourPickerImage addTarget:self selector:@selector(didClickOnPicker:)];
    [_fourImage addSubview:_fourPickerImage];
    
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
            _firstPickerImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            break;
        case 2:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstPickerImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondPickerImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = nil;
            _fourImage.image = nil;
            break;
        case 3:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstPickerImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondPickerImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = [imageArray objectAtIndex:2];
            _thirdPickerImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _fourImage.image = nil;
            break;
        case 4:
            _firstImage.image = [imageArray objectAtIndex:0];
            _firstPickerImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            _secondImage.image = [imageArray objectAtIndex:1];
            _secondPickerImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            _thirdImage.image = [imageArray objectAtIndex:2];
            _thirdPickerImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            _fourImage.image = [imageArray objectAtIndex:3];
            _fourPickerImage.tag = [[indexArray objectAtIndex:3] integerValue] + cellImageTag;
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
    _firstPickerImage.frame = CGRectMake(_perLength*4/5, _perLength*4/5, _perLength/5, _perLength/5);
    _secondPickerImage.frame = CGRectMake(_perLength*4/5, _perLength*4/5, _perLength/5, _perLength/5);
    _thirdPickerImage.frame = CGRectMake(_perLength*4/5, _perLength*4/5, _perLength/5, _perLength/5);
    _fourPickerImage.frame = CGRectMake(_perLength*4/5, _perLength*4/5, _perLength/5, _perLength/5);
}

- (void)didClickOnPicker:(id)sender {
    SFClickImageView *imageView = (SFClickImageView *)sender;
    imageView.status = !imageView.status;
    if(imageView.status) {
        imageView.image = [UIImage imageNamed:@"photo_picker_yes"];
    } else {
        imageView.image = [UIImage imageNamed:@"photo_picker_no"];
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(didPickImageWithIndex: withStatus:)]) {
        [self.delegate didPickImageWithIndex:(imageView.tag-cellImageTag) withStatus:imageView.status];
    }
}

- (void)clickOnImage:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(didClickOnImageWithIndex:)]) {
        SFClickImageView *image = (SFClickImageView *)sender;
        [self.delegate didClickOnImageWithIndex:(image.tag-cellImageTag)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
