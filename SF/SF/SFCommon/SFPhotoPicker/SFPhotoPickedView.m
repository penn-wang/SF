//
//  SFPhotoPickedView.m
//  SF
//
//  Created by penn on 15/10/27.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoPickedView.h"

#pragma -mark -
#pragma -mark -SFPhotoPickedViewData

@implementation SFPhotoPickedViewData

- (id)initWithBigImage:(UIImage *)bigImage smallImage:(UIImage *)smallImage {
    if (self = [super init]) {
        self.bigImage = bigImage;
        self.smallImage = smallImage;
    }
    return self;
}

@end

#pragma -mark -
#pragma -mark -SFPhotoPickedView

@interface SFPhotoPickedView () {
    UIView *_addView;
    
    CGFloat _perLength;
    CGFloat _margin;
    NSInteger _numbers;
    
    NSMutableArray *_imageMutArray;
    NSMutableArray *_dataMutArray;
}

@end

@implementation SFPhotoPickedView

- (id)initWithOriginY:(CGFloat)originY {
    if (self = [super init]) {
        [self initData];
        self.frame = CGRectMake(0, originY, [UIScreen mainScreen].bounds.size.width, _perLength+_margin);
        [self initContentViews];
    }
    return self;
}

//- (id)initWithFrame:(CGRect)frame {
//    if (self = [self initWithOriginY:frame.origin.y]) {
//    }
//    return self;
//}

- (void)initData {
    _margin = 5.0f;
    _numbers = 4;
    _perLength = ([UIScreen mainScreen].bounds.size.width-(_numbers+1)*_margin)/_numbers;
    _imageMutArray = [[NSMutableArray alloc] init];
    _dataMutArray = [[NSMutableArray alloc] init];
}

- (void)initContentViews {
    _addView = [[UIView alloc] initWithFrame:CGRectMake(_margin, _margin/2, _perLength, _perLength)];
    _addView.backgroundColor = [UIColor grayColor];
    [self addSubview:_addView];
}

- (void)resetContentViewsByData {
    if (_dataMutArray.count <= 0) {
        return;
    }
    for (UIView *subV in self.subviews) {
        [subV removeFromSuperview];
    }
    for (NSInteger i=0; i<_dataMutArray.count; i++) {
        SFPhotoPickedViewData *data = [_dataMutArray objectAtIndex:i];
        NSInteger x = i%_numbers;
        NSInteger y = i/_numbers;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_margin+(_margin+_perLength)*x, _margin/2+(_margin/2+_perLength)*y, _perLength, _perLength)];
        imageView.image = data.smallImage;
        [self addSubview:imageView];
    }
    NSInteger count = _dataMutArray.count;
    NSInteger addX = count%_numbers==0?0:count%_numbers;
    NSInteger addY = count%_numbers==0?count/_numbers+1:count/_numbers+0;
    _addView = [[UIView alloc] initWithFrame:CGRectMake(_margin+(_margin+_perLength)*addX, _margin/2+(_margin/2+_perLength)*addY, _perLength, _perLength)];
    _addView.backgroundColor = [UIColor redColor];
    [self addSubview:_addView];
}

- (void)addViews:(NSArray *)dataArray {
    if (dataArray==nil || dataArray.count<=0) {
        return;
    }
    [_dataMutArray addObjectsFromArray:dataArray];
    [self resetContentViewsByData];
}


- (CGFloat)getHeight {
    NSInteger count = _dataMutArray.count;
    NSInteger y = count%_numbers==0?count/_numbers+2:count/_numbers+1;
    return y*(_margin+_perLength);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
