//
//  SFPhotoGroupCell.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFPhotoGroupCell.h"

@interface SFPhotoGroupCell() {
    UIImageView *_headImageView;
    UIView *_line;
    UILabel *_titleLabel;
}
@end

@implementation SFPhotoGroupCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImageView];
        _line = [SFUICreator SFCommonLine];
        [self.contentView addSubview:_line];
    }
    return self;
}
- (void)cellContent:(UIImage *)image {
    _headImageView.image = image;
}
- (void)layoutSubviews {
    //这个时候，cell的高度才是heightForRowAtIndexPath的高度 在此之前，都是 44或者0
    _headImageView.frame = CGRectMake(20, 10, self.height-20, self.height-20);
    _line.frame = CGRectMake(0, self.height-1, self.width, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
