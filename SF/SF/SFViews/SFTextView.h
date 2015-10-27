//
//  SFTextView.h
//  SF
//
//  Created by penn on 15/10/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFTextView : UIView

@property (nonatomic, strong) UITextView *input;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *placeHolder;

- (id)initWithFrame:(CGRect)frame  placeHolder:(NSString *)placeHolder;

@end
