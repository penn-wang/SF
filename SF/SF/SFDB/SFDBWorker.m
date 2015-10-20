//
//  SFDBWorker.m
//  SF
//
//  Created by penn on 15/9/7.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "SFDBWorker.h"
#import "SFDBHelper.h"

static SFDBWorker *_sharedWorker = nil;

typedef NS_ENUM(NSInteger, SFDBWorkType) {
    SFDBWorkSelect,
    SFDBWorkDelete,
    SFDBWorkInsert
};

@implementation SFDBWorker

#pragma -mark -
#pragma -mark -init worker

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t once ;
    dispatch_once(&once, ^(void){
        _sharedWorker = [super allocWithZone:zone];
    });
    return _sharedWorker;
}
+ (instancetype)sharedDBWorker {
    static dispatch_once_t once;
    dispatch_once(&once, ^(void){
        _sharedWorker = [[self alloc] init];
    });
    return _sharedWorker;
}
- (id)copyWithZone:(NSZone *)zone {
    return _sharedWorker;
}

#pragma -mark -
#pragma -mark -init _db

- (BOOL)openDB {
    NSString *path = [SFDBHelper dbFullPath];
    return SQLITE_OK == sqlite3_open([path UTF8String], &_db);
}

- (BOOL)closeDB {
    return SQLITE_OK == sqlite3_close(_db);
}

- (BOOL)createTable:(NSString *)name {
    char *errMsg;
    const char *SQL = [[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, FIELD_DATA TEXT)", name] UTF8String];
    return SQLITE_OK == sqlite3_exec(_db, SQL, NULL, NULL, &errMsg);
}

- (void)insertTable:(NSArray *)textArr {
    
}


@end
