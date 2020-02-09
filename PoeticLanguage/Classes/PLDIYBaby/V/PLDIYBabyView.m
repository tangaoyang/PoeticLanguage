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
    _hairImageView = [[PLImageView alloc] init];
    _clothesImageView = [[PLImageView alloc] init];
    _upImageView = [[PLImageView alloc] init];
    _downImageView = [[PLImageView alloc] init];
    _shoesImageView = [[PLImageView alloc] init];
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
    float width0 = 0.06 * hight;
    float hight0;
    float top = 0.25 * hight;
    float left = 0.35 * width;
    // 90 - 140 140 - 190 0.082 0.23 0.32
    [_lookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(width0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self).offset(left);
    }];
    
    //70 * 335 left:80 top:170
    width0 = 0.46 * width;
    hight0 = 0.5496 * hight;
    left = 0.18 * width;
    top = 0.295 * hight;
    [_bodyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self).offset(left);
    }];
    _bodyImageView.image = [UIImage imageNamed:@"body.png"];
    
    //  100 - 140 500 - 520
    width0 = 0.142 * width;
    hight0 = 0.0328 *hight;
    top = 0.82 * hight;
    [_shoesImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self.lookImageView.mas_left);
        
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
