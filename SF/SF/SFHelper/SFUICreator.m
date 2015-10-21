//
//  SFUICreator.m
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFUICreator.h"

@implementation SFUICreator

+ (UITableView *)SFCommonTableView:(id)delegate {
    UITableView *table = [[UITableView alloc] init];
    table.delegate = delegate;
    table.dataSource = delegate;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor clearColor];
    return table;
}

+ (UITableView *)SFCommonTableView:(id)delegate frame:(CGRect)frame {
    UITableView *table = [[self class] SFCommonTableView:delegate];
    table.frame = frame;
    return table;
}

@end
