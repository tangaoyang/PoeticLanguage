//
//  PLDIYBabyView.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/27.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDIYBabyView.h"

@implementation PLDIYBabyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _lookImageView = [[UIImageView alloc] init];
    _hairImageView = [[UIImageView alloc] init];
    _clothesImageView = [[UIImageView alloc] init];
    _upImageView = [[UIImageView alloc] init];
    _downImageView = [[UIImageView alloc] init];
    _shoesImageView = [[UIImageView alloc] init];
    _bodyImageView = [[UIImageView alloc] init];
    
    [self addSubview:_bodyImageView];
    [self addSubview:_shoesImageView];
    [self addSubview:_lookImageView];
    [self addSubview:_clothesImageView];
    [self addSubview:_upImageView];
    [self addSubview:_upImageView];
    [self addSubview:_hairImageView];
//    self addSubview:
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    float width0 = 0.028 * hight;
    float hight0;
    float left = 0.355 * width;
    float top = 0.246 * hight
//    100 - 140 150 - 190
    [_lookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(width0));
        make.left.equalTo(self).offset(left);
        make.top.equalTo(self).offset(top);
    }];
//  100 - 140 500 - 520
    width0 = 0.142 * width;
    hight0 = 0.0328 *hight;
    top = 0.82 * hight;
    [_shoesImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.lookImageView.mas_left);
        make.top.equalTo(self).offset(top);
    }];
    
    // 1792 828
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
