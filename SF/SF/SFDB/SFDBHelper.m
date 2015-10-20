//
//  SFDBHelper.m
//  SF
//
//  Created by penn on 15/9/7.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "SFDBHelper.h"

@implementation SFDBHelper

+ (NSString *)dbFullPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *path = [docDir stringByAppendingPathComponent:DBFullName];
    return path;
}


@end
