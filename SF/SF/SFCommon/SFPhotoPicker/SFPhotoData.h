//
//  SFPhotoData.h
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPhotoData : NSObject

@property (nonatomic, strong) UIImage *bigImage;
@property (nonatomic, strong) UIImage *smallImage;

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *samllName;
@property (nonatomic, strong) NSString *bigName;

@end
