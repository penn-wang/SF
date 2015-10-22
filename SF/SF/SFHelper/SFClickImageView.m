//
//  SFClickImageView.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFClickImageView.h"

@interface SFClickImageView () {
    id _target;
    SEL _selector;
}

@end

@implementation SFClickImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
    }
    return self;
}

-(id)initWithImage:(UIImage *)image
{
    self=[super initWithImage:image];
    if (self) {
        self.userInteractionEnabled=YES;
    }
    return self;
}

-(void)addTarget:(id)target selector:(SEL)selector {
    _target=target;
    _selector=selector;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.image == nil) {
        return;
    }
    if([_target respondsToSelector:_selector]){
//        [_target performSelector:_selector withObject:self];
        IMP imp = [_target methodForSelector:_selector];
        void (*func)(id, SEL, id) = (void *)imp; //最后的id 为参数
        func(_target, _selector, self);
    }
}

@end
