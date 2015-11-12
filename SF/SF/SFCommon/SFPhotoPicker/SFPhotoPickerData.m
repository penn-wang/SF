//
//  SFPhotoPickerData.m
//  SF
//
//  Created by penn on 15/10/28.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoPickerData.h"

#pragma -mark -
#pragma -mark -SFPhotoPickedViewData

@implementation SFPhotoPickerViewData

- (id)initWithBigImage:(UIImage *)bigImage smallImage:(UIImage *)smallImage {
    if (self = [super init]) {
        self.bigImage = bigImage;
        self.smallImage = smallImage;
    }
    return self;
}

@end


@implementation SFPhotoPathData


@end