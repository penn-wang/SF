//
//  SFPhotoPickedView.m
//  SF
//
//  Created by penn on 15/10/27.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoPickedView.h"
#import "SFPhotoData.h"

static const NSInteger imageBtnTag = 10000;

#pragma -mark -
#pragma -mark -SFPhotoPickedView

@interface SFPhotoPickedView () {
    UIButton *_addButton;
    
    CGFloat _perLength;
    CGFloat _margin;
    NSInteger _numbers;
    
    NSMutableArray *_dataMutArray;

}
@end

@implementation SFPhotoPickedView

- (id)initWithOriginY:(CGFloat)originY {
    if (self = [super init]) {
        [self initData];
        self.frame = CGRectMake(0, originY, [UIScreen mainScreen].bounds.size.width, _perLength+_margin);
        [self addAddButton:CGRectMake(_margin, _margin/2, _perLength, _perLength)];
    }
    return self;
}

- (void)initData {
    _margin = 5.0f;
    _numbers = 4;
    _perLength = ([UIScreen mainScreen].bounds.size.width-(_numbers+1)*_margin)/_numbers;

    _dataMutArray = [[NSMutableArray alloc] init];
}

- (void)addAddButton:(CGRect)frame {
    _addButton = [[UIButton alloc] initWithFrame:frame];
    _addButton.backgroundColor = [UIColor redColor];
    [_addButton addTarget:self action:@selector(clickOnAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
}

- (void)resetContentViewsByData {
    if (_dataMutArray.count <= 0) {
        return;
    }
    for (UIView *subV in self.subviews) {
        [subV removeFromSuperview];
    }
    for (NSInteger i=0; i<_dataMutArray.count; i++) {
        SFPhotoData *data = [_dataMutArray objectAtIndex:i];
        NSInteger x = i%_numbers;
        NSInteger y = i/_numbers;
        UIButton *imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(_margin+(_margin+_perLength)*x, _margin/2+(_margin/2+_perLength)*y, _perLength, _perLength)];
        [imageBtn addTarget:self action:@selector(showPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [imageBtn setBackgroundImage:data.smallImage forState:UIControlStateNormal];
        imageBtn.tag = imageBtnTag+i;
        [self addSubview:imageBtn];
    }
    NSInteger count = _dataMutArray.count;
    NSInteger addX = count%_numbers;
    NSInteger addY = count%_numbers==0?count/_numbers+1:count/_numbers+0;
    [self addAddButton:CGRectMake(_margin+(_margin+_perLength)*addX, _margin/2+(_margin/2+_perLength)*addY, _perLength, _perLength)];
}

- (void)addPhotoImageViews:(NSArray *)dataArray {
    if (dataArray==nil || dataArray.count<=0) {
        return;
    }
    [_dataMutArray addObjectsFromArray:dataArray];
    [self resetContentViewsByData];
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, [self getHeight]);
}


- (CGFloat)getHeight {
    NSInteger count = _dataMutArray.count;
    NSInteger y = count%_numbers==0?count/_numbers+2:count/_numbers+1;
    return y*(_margin+_perLength);
}

- (void)clickOnAddButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shouldAddPhotos)]) {
        [self.delegate shouldAddPhotos];
    }
}

- (void)showPhoto:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (self.delegate && [self.delegate respondsToSelector:@selector(shouldShowPhotos:index:)]) {
        [self.delegate shouldShowPhotos:_dataMutArray index:(btn.tag-imageBtnTag)];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
