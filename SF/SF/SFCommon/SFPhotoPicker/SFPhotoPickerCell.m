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


@implementation SFPhotoCellImageData

- (id)initWithImage:(UIImage *)image status:(BOOL)isPicked {
    if(self = [super init]) {
        self.image = image;
        self.isPicked = isPicked;
    }
    return self;
}
@end

#pragma -mark -
#pragma -mark - PPCellImage
@implementation PPCellImage

- (id)init {
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.status = false;
        [self initContentViews:nil];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.status = false;
        [self initContentViews:nil];
    }
    return self;
}

- (void)layOutViews:(CGRect)frame{
    self.frame = frame;
    self.imageBtn.frame = self.bounds;
    CGFloat margin = 5;
    CGFloat width = self.width/4;
    CGFloat height = self.height/4;
    self.pickerImageView.frame = CGRectMake(self.width-width-margin, self.height-height-margin, width, height);
}

- (void)showImage:(SFPhotoCellImageData *)data {
    [self.imageBtn setBackgroundImage:data.image forState:UIControlStateNormal];
    self.status = data.isPicked;
    if(self.status) {
        self.pickerImageView.image = [UIImage imageNamed:@"photo_picker_yes"];
    } else {
        self.pickerImageView.image = [UIImage imageNamed:@"photo_picker_no"];
    }
}

- (void)clear {
    [self.imageBtn setBackgroundImage:nil forState:UIControlStateNormal];
    self.pickerImageView.image = nil;
}

- (void)initContentViews:(UIImage *)image {
    self.imageBtn = [[UIButton alloc] init];
    [self.imageBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self.imageBtn addTarget:self action:@selector(didClickOnImage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.imageBtn];
    
    self.pickerImageView = [[SFClickImageView alloc] init];
    self.pickerImageView.image = [UIImage imageNamed:@"photo_picker_no"];
    [self.pickerImageView addTarget:self selector:@selector(didClickOnPicker:)];
    [self addSubview:self.pickerImageView];
}

- (void)didClickOnImage:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(didClickOnImage:status:)]) {
        [self.delegate didClickOnImage:self.tag status:self.status];
    }
}

- (void)didClickOnPicker:(id)sender {
    self.status = !self.status;
    if(self.status) {
        self.pickerImageView.image = [UIImage imageNamed:@"photo_picker_yes"];
    } else {
        self.pickerImageView.image = [UIImage imageNamed:@"photo_picker_no"];
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(didClickOnPicker:status:)]) {
        [self.delegate didClickOnPicker:self.tag status:self.status];
    }
}

@end

#pragma -mark -
#pragma -mark -SFPhotoPickerCell

@interface SFPhotoPickerCell () <PPCellImageDelegate>{
    CGFloat _perLength;
    
    PPCellImage *_firstImage;
    PPCellImage *_secondImage;
    PPCellImage *_thirdImage;
    PPCellImage *_fourImage;
    
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
    _firstImage = [[PPCellImage alloc] init];
    _firstImage.delegate = self;
    [self.contentView addSubview:_firstImage];
    _secondImage = [[PPCellImage alloc] init];
    _secondImage.delegate = self;
    [self.contentView addSubview:_secondImage];
    _thirdImage = [[PPCellImage alloc] init];
    _thirdImage.delegate = self;
    [self.contentView addSubview:_thirdImage];
    _fourImage = [[PPCellImage alloc] init];
    _fourImage.delegate = self;
    [self.contentView addSubview:_fourImage];
    
    _perLength = ([UIScreen mainScreen].bounds.size.width-cellPerMargin*(cellImageMaxCount+1))/cellImageMaxCount;
}

+ (CGFloat)cellHeight {
    return ([UIScreen mainScreen].bounds.size.width-cellPerMargin*(cellImageMaxCount+1))/cellImageMaxCount + cellPerMargin;
}

-(void)cellContent:(NSArray *)dataArray indexs:(NSArray *)indexArray {
    if(dataArray==nil || dataArray.count<=0 || dataArray.count>cellImageMaxCount) {
        return;
    }
    if(indexArray==nil || indexArray.count<=0 || indexArray.count>cellImageMaxCount) {
        return;
    }
    [self resetImages:dataArray indexs:indexArray];
}

- (void)resetImages:(NSArray *)dataArray indexs:(NSArray *)indexArray {
    switch (dataArray.count) {
        case 1:
            [_firstImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:0]];
            [_secondImage clear];
            [_thirdImage clear];
            [_fourImage clear];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            break;
        case 2:
            [_firstImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:0]];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            [_secondImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:1]];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            [_thirdImage clear];
            [_fourImage clear];
            break;
        case 3:
            [_firstImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:0]];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            [_secondImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:1]];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            [_thirdImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:2]];
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            [_fourImage clear];
            break;
        case 4:
            [_firstImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:0]];
            _firstImage.tag = [[indexArray objectAtIndex:0] integerValue] + cellImageTag;
            [_secondImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:1]];
            _secondImage.tag = [[indexArray objectAtIndex:1] integerValue] + cellImageTag;
            [_thirdImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:2]];
            _thirdImage.tag = [[indexArray objectAtIndex:2] integerValue] + cellImageTag;
            [_fourImage showImage:(SFPhotoCellImageData *)[dataArray objectAtIndex:3]];
            _fourImage.tag = [[indexArray objectAtIndex:3] integerValue] + cellImageTag;
            break;
        default:
            break;
    }
}

- (void)layoutSubviews {
    [_firstImage layOutViews:CGRectMake(cellPerMargin, cellPerMargin/2, _perLength, _perLength)];
    [_secondImage layOutViews:CGRectMake(cellPerMargin*2+_perLength, cellPerMargin/2, _perLength, _perLength)];
    [_thirdImage layOutViews:CGRectMake(cellPerMargin*3+_perLength*2, cellPerMargin/2, _perLength, _perLength)];
    [_fourImage layOutViews:CGRectMake(cellPerMargin*4+_perLength*3, cellPerMargin/2, _perLength, _perLength)];
}

#pragma -mark -
#pragma -mark -PPCellImageDelegate

- (void)didClickOnPicker:(NSInteger)aTag status:(BOOL)status{

    if(self.delegate && [self.delegate respondsToSelector:@selector(didPickImageWithIndex: withStatus:)]) {
        [self.delegate didPickImageWithIndex:(aTag-cellImageTag) withStatus:status];
    }
}

- (void)didClickOnImage:(NSInteger)aTag status:(BOOL)status{
    if(self.delegate && [self.delegate respondsToSelector:@selector(didClickOnImageWithIndex:withStatus:)]) {
        [self.delegate didClickOnImageWithIndex:(aTag-cellImageTag) withStatus:status];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
