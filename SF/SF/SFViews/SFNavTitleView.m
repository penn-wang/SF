//
//  SFNavTitleView.m
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFNavTitleView.h"

@interface SFNavTitleView () {
    UIButton *_firstBtn;
    UIButton *_secondBtn;
    UIButton *_thirdBtn;
}

@end

@implementation SFNavTitleView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initContentViews];
    }
    return self;
}

- (void)initContentViews {
    CGFloat width = self.frame.size.width/3;
    CGFloat height = self.frame.size.height;
    _firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [_firstBtn addTarget:self action:@selector(clickOnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_firstBtn setTitle:@"昨天" forState:UIControlStateNormal];
    _firstBtn.titleLabel.font = NAV_TITLE_FONT;
    _firstBtn.tag = 10000;
    [self addSubview:_firstBtn];
    _secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    [_secondBtn addTarget:self action:@selector(clickOnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_secondBtn setTitle:@"今天" forState:UIControlStateNormal];
    _secondBtn.titleLabel.font = NAV_TITLE_FONT;
    _secondBtn.tag = 10000+1;
    [self addSubview:_secondBtn];
    _thirdBtn = [[UIButton alloc] initWithFrame:CGRectMake(width*2, 0, width, height)];
    [_thirdBtn addTarget:self action:@selector(clickOnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_thirdBtn setTitle:@"明天" forState:UIControlStateNormal];
    _thirdBtn.titleLabel.font = NAV_TITLE_FONT;
    _thirdBtn.tag = 10000+2;
    [self addSubview:_thirdBtn];
    
    self.curPage = 1;
    [self resetButtonsByCurPage];
}

- (void)resetButtonsByCurPage {
    switch (self.curPage) {
        case 0:
            [_firstBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [_secondBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            [_thirdBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            break;
        case 1:
            [_firstBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            [_secondBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [_thirdBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            break;
        case 2:
            [_firstBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            [_secondBtn setTitleColor:NAV_TITLE_COLOR forState:UIControlStateNormal];
            [_thirdBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (void)clickOnBtn:(id)sender {
    UIButton *btn = (UIButton *) sender;
    if(btn.tag == 10000+self.curPage) {
        return;
    }
    switch (btn.tag) {
        case 10000:
            self.curPage = 0;
            [self resetButtonsByCurPage];
            break;
        case 10001:
            self.curPage = 1;
            [self resetButtonsByCurPage];
            break;
        case 10002:
            self.curPage = 2;
            [self resetButtonsByCurPage];
            break;
        default:
            break;
    }
    [self toCurPage];
}

- (void)toCurPage{
    if(self.delegate && [self.delegate respondsToSelector:@selector(navTitleDidToPage:)]) {
        [self.delegate navTitleDidToPage:_curPage];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
