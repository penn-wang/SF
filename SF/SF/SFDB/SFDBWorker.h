//
//  SFDBWorker.h
//  SF
//
//  Created by penn on 15/9/7.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SFDBWorker : NSObject<NSCopying> {
    sqlite3 *_db;
}

+ (SFDBWorker *)sharedDBWorker;

- (BOOL)openDB;
- (BOOL)closeDB;
- (BOOL)createTable:(NSString *)name;

@end
