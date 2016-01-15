//
//  SFSettings.h
//  SF
//
//  Created by penn-wang on 16/1/15.
//  Copyright © 2016年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Setting_Default_Photo_Capacity  5

@interface SFSettings : NSObject

@property (nonatomic, assign) NSInteger photoCapacity;

+ (SFSettings *)sharedSettings;

@end
