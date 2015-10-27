//
//  SFTextView.m
//  SF
//
//  Created by penn on 15/10/26.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFTextView.h"

@interface SFTextView () <UITextViewDelegate>{
    UILabel *_label;
}
@end

@implementation SFTextView

- (id)initWithFrame:(CGRect)frame  placeHolder:(NSString *)placeHolder {
    if(self = [self initWithFrame:frame]) {
        self.placeHolder = placeHolder;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initContentViews];
    }
    return self;
}

- (void)initContentViews {
    _label = [SFUICreator SFCommonLabel];
    _label.textColor = [UIColor lightTextColor];
    [self addSubview:_label];
    
    self.input = [SFUICreator SFCommonTextView:self frame:self.bounds];
    [self addSubview:self.input];
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    if([_placeHolder isEqualToString:placeHolder]) {
        return;
    }
    _placeHolder = placeHolder;
    _label.text = _placeHolder;
    CGSize labelSize = [_placeHolder sizeWithFont:[_label font] maxSize:CGSizeMake(self.width, MAXFLOAT)];
    _label.frame = CGRectMake(2, _input.font.lineHeight/2, labelSize.width, labelSize.height);
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    _label.text = nil;
    _label.hidden = YES;
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if(textView.text.length<=0 ||textView.text==nil) {
        _label.text = self.placeHolder;
        _label.hidden = NO;
    } else {
        if(_label.hidden == NO) {
            _label.hidden = YES;
            _label.text = nil;
        }
    }
}

- (BOOL)isFirstResponder {
    return [self.input isFirstResponder];
}

- (BOOL)resignFirstResponder {
    return [self.input resignFirstResponder];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
