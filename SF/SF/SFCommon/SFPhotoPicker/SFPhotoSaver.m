//
//  SFPhotoSaver.m
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoSaver.h"
#import "SFPhotoData.h"

static SFPhotoSaver *_sharedPhotoSaver;

@implementation SFPhotoSaver

#pragma -mark -
#pragma -mark -init _sharedPhotoSaver

- (id) init {
    if (self = [super init]) {
        self.savedPhotoCount = 0;
    }
    return self;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t once ;
    dispatch_once(&once, ^(void){
        _sharedPhotoSaver = [super allocWithZone:zone];
    });
    return _sharedPhotoSaver;
}
+ (instancetype)sharedPhotoSaver {
    static dispatch_once_t once;
    dispatch_once(&once, ^(void){
        _sharedPhotoSaver = [[self alloc] init];
    });
    return _sharedPhotoSaver;
}

- (id)copyWithZone:(NSZone *)zone {
    return _sharedPhotoSaver;
}

#pragma -mark -
#pragma -mark -method

- (NSDateFormatter *)photoDateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    return formatter;
}

- (BOOL)createTodayPhotoFolder {
    NSString *folder = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"pic"];
    BOOL bo = false;
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if (![fileManger fileExistsAtPath:folder]) {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *todayFolderName = [[[[self class] sharedPhotoSaver] photoDateFormatter] stringFromDate:[NSDate date]];
    NSString *todayFolder = [folder stringByAppendingPathComponent:todayFolderName];
    if (![fileManger fileExistsAtPath:todayFolder]) {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:todayFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return bo;
}

- (NSString *)todayPhotoFolder {
    NSString *folder = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"pic"];
    NSString *todayFolderName = [[[[self class] sharedPhotoSaver] photoDateFormatter] stringFromDate:[NSDate date]];
    NSString *todayFolder = [folder stringByAppendingPathComponent:todayFolderName];
    return todayFolder;
}

- (void)savePhoto:(SFPhotoData *)photoData {
    if(!photoData) {
        return;
    }
    NSString *floder = [[[self class] sharedPhotoSaver] todayPhotoFolder];
    
    NSString *path = [floder stringByAppendingPathComponent:photoData.bigName];
    [UIImagePNGRepresentation(photoData.bigImage)writeToFile:path  atomically:YES];
    NSString *spath = [floder stringByAppendingPathComponent:photoData.smallName];
    [UIImagePNGRepresentation(photoData.smallImage)writeToFile:spath  atomically:YES];
}

@end




