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
    textView.textColor = TEXT_NORMAL_COLOR;
    textView.font =  TEXT_NORMAL_FONT;
    textView.delegate = delegate;
    textView.backgroundColor = [UIColor clearColor];
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

+ (UIView *)SFCommonLine:(CGPoint)startPoint {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *v = [[self class] SFCommonLine];
    v.frame = CGRectMake(startPoint.x, startPoint.y, screenWidth-startPoint.x, 1);
    v.backgroundColor = [UIColor grayColor];
    return v;
}

+ (UIView *)SFCommonLine {
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor lightGrayColor];
    return v;
}

+ (UILabel *)SFCommonLabel:(CGRect)frame {
    UILabel *label = [[self class] SFCommonLabel];
    label.frame = frame;
    return label;
}

+ (UILabel *)SFCommonLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    label.font = TEXT_NORMAL_FONT;
    label.textColor = TEXT_NORMAL_COLOR;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

@end
