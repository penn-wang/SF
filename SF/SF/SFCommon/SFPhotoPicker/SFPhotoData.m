//
//  SFPhotoData.m
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoData.h"

#import <AssetsLibrary/AssetsLibrary.h>

@implementation SFPhotoData

- (id)initWithAsset:(ALAsset *)asset namePrefix:(NSString *)prefix {
    if (self = [super init]) {
        self.smallImage = [UIImage imageWithCGImage:[asset thumbnail]];
        self.bigImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
        
        self.smallName = [NSString stringWithFormat:@"%@-s", prefix];
        self.bigName = [NSString stringWithFormat:@"%@-b", prefix];
        self.preFix = prefix;
    }
    return self;
}

@end
