//
//  SFHelper.m
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFHelper.h"

@implementation SFHelper

+ (NSString *)timeStampOfNow {
    return  [NSString stringWithFormat:@"%lld", (long long)[[NSDate date] timeIntervalSince1970]];
}

@end
