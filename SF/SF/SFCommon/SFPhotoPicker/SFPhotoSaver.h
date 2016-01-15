//
//  SFPhotoSaver.h
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Photo_Max_Capacity  5

@class SFPhotoData;

@interface SFPhotoSaver : NSObject

@property (nonatomic, assign) NSInteger photoCapacity;

+ (SFPhotoSaver *)sharedPhotoSaver;

- (BOOL)createTodayPhotoFolder;
- (NSString *)todayPhotoFolder;
- (void)savePhoto:(SFPhotoData *)photoData;

- (NSDateFormatter *)photoDateFormatter;

@end
