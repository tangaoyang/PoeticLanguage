//
//  PLSavedSuitView.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/29.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSavedSuitView.h"

@implementation PLSavedSuitView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _model = [[PLDIYBabyM alloc] init];
    _model.width = [UIScreen mainScreen].bounds.size.width;
    _model.hight = [UIScreen mainScreen].bounds.size.height;
    [_model LoadData];
    _lookImageView = [[UIImageView alloc] init];
    _hairImageView = [[UIImageView alloc] init];
    _bodyImageView = [[UIImageView alloc] init];
    _dressImageView = [[UIImageView alloc] init];
    
    [self addSubview:_bodyImageView];
    [self addSubview:_lookImageView];
    [self addSubview:_dressImageView];
    [self addSubview:_hairImageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    float width0 = 0.12985 * width * _scalingMultiple;
    float hight0;
    float top = (0.5 * (1 - _scalingMultiple) * 0.06 * hight + (0.25 * hight))  * _scalingMultiple;
    float left = (0.5 * (1 - _scalingMultiple) * 0.12985 * width + (0.35 * width))  * _scalingMultiple;
    _lookImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"look%ld.jpeg", _lookId]];
    [_lookImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(width0));
        make.top.equalTo(self);
        make.left.equalTo(self).offset(left);
    }];
    
    //70 * 335 left:80 top:170
    width0 = 0.46 * width * _scalingMultiple;
    hight0 = 0.5496 * hight * _scalingMultiple;
    left = -0.17 * width * _scalingMultiple;
    top = (0.045 * hight) * _scalingMultiple;
    [_bodyImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.lookImageView.mas_top).offset(top);
        make.left.equalTo(self.lookImageView.mas_left).offset(left);
    }];
    _bodyImageView.image = [UIImage imageNamed:@"body.jpeg"];
    
    left = ([self.model.masonryDictionary[@"hair"][@"left"][self.hairId - 1] floatValue] - 0.35 * width) * _scalingMultiple;
    top = ([self.model.masonryDictionary[@"hair"][@"top"][self.hairId - 1] floatValue] - 0.25 * hight) * _scalingMultiple;
    _hairImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"hair%ld.jpeg", _hairId]];
    [_hairImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(([self.model.masonryDictionary[@"hair"][@"width"][self.hairId - 1] floatValue]) * self.scalingMultiple));
        make.height.equalTo(@(([self.model.masonryDictionary[@"hair"][@"hight"][self.hairId - 1] floatValue]) * self.scalingMultiple));
            make.left.equalTo(self.lookImageView.mas_left).offset(left);
            make.top.equalTo(self.lookImageView.mas_top).offset(top);
    }];
    
    left = ([self.model.masonryDictionary[@"clothes"][@"left"][self.dressId - 1] floatValue] - 0.35 * width) * _scalingMultiple;
   top = ([self.model.masonryDictionary[@"clothes"][@"top"][self.dressId - 1] floatValue]) * _scalingMultiple;
    _dressImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"skirt%ld.jpeg", _dressId]];
    [self.dressImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@([self.model.masonryDictionary[@"clothes"][@"width"][self.dressId - 1] floatValue] * self.scalingMultiple));
        make.height.equalTo(@([self.model.masonryDictionary[@"clothes"][@"hight"][self.dressId - 1] floatValue] * self.scalingMultiple));
            make.left.equalTo(self.lookImageView.mas_left).offset(left);
            make.top.equalTo(self.lookImageView.mas_bottom).offset(top);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
