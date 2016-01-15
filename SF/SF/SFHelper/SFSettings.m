//
//  SFSettings.m
//  SF
//
//  Created by penn-wang on 16/1/15.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "SFSettings.h"

static SFSettings *_sharedSettings = nil;

@implementation SFSettings

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t once ;
    dispatch_once(&once, ^(void){
        _sharedSettings = [super allocWithZone:zone];
    });
    return _sharedSettings;
}
+ (instancetype)sharedSettings {
    static dispatch_once_t once;
    dispatch_once(&once, ^(void){
        _sharedSettings = [[self alloc] init];
    });
    return _sharedSettings;
}
- (id)copyWithZone:(NSZone *)zone {
    return _sharedSettings;
}


@end
