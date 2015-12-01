//
//  SFPhotoSaver.h
//  SF
//
//  Created by penn on 15/11/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFPhotoData;

@interface SFPhotoSaver : NSObject

@property (nonatomic, assign) NSInteger savedPhotoCount;

+ (SFPhotoSaver *)sharedPhotoSaver;

- (BOOL)createTodayPhotoFolder;
- (NSString *)todayPhotoFolder;
- (void)savePhoto:(SFPhotoData *)photoData;

- (NSDateFormatter *)photoDateFormatter;

@end
