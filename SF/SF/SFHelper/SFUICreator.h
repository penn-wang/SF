//
//  SFUICreator.h
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFUICreator : NSObject {
    
}

+ (UITableView *)SFCommonTableView:(id)delegate;
+ (UITableView *)SFCommonTableView:(id)delegate frame:(CGRect)frame;

+ (UITextView *)SFCommonTextView:(id)delegate;
+ (UITextView *)SFCommonTextView:(id)delegate frame:(CGRect)frame;


+ (UIView *)SFCommonLine:(CGPoint)startPoint;
+ (UIView *)SFCommonLine;

+ (UILabel *)SFCommonLabel:(CGRect)frame;
+ (UILabel *)SFCommonLabel;

@end
