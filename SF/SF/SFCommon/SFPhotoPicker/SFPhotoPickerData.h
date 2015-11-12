//
//  SFPhotoPickerData.h
//  SF
//
//  Created by penn on 15/10/28.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPhotoPickerViewData : NSObject

@property (nonatomic, strong) UIImage *bigImage;
@property (nonatomic, strong) UIImage *smallImage;
- (id)initWithBigImage:(UIImage *)bigImage smallImage:(UIImage *)smallImage;

@end


@interface SFPhotoPathData : NSObject

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *samllName;
@property (nonatomic, strong) NSString *bigName;

@end