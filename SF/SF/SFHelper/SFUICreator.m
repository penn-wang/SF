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

+ (UITextView *)SFCommonTextView:(id)delegate {
    UITextView *textView = [[UITextView alloc] init];
    textView.textColor = [UIColor darkTextColor];
    textView.font =  TEXT_NORMAL_FONT;
    textView.delegate = delegate;
    textView.backgroundColor = [UIColor whiteColor];
    textView.returnKeyType = UIReturnKeyDefault;
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.scrollEnabled = YES;
    return textView;
}

+ (UITextView *)SFCommonTextView:(id)delegate frame:(CGRect)frame {
    UITextView *textView = [[self class] SFCommonTextView:delegate];
    textView.frame = frame;
    return textView;
}

@end
