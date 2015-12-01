//
//  SFPhotoData.h
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAsset;

@interface SFPhotoData : NSObject

@property (nonatomic, strong) UIImage *bigImage;
@property (nonatomic, strong) UIImage *smallImage;

@property (nonatomic, strong) NSString *preFix;
@property (nonatomic, strong) NSString *smallName;
@property (nonatomic, strong) NSString *bigName;

- (id)initWithAsset:(ALAsset *)asset namePrefix:(NSString *)prefix;

//- (NSString *)bigImagePath;
//- (NSString *)smallImagePath;

@end
