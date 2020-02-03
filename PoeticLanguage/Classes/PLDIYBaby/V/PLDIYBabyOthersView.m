//
//  PLDIYBabyView.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDIYBabyOthersView.h"
#import "Masonry.h"

@implementation PLDIYBabyOthersView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _needRemake = 1;
    _clickTime = @"FirstClick";
    _backgroundImageView = [[UIImageView alloc] init];
    _lookButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _hairButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _skirtButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _upButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _downButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _shoesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _decorationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backgroundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _babyView = [[PLDIYBabyView alloc] init];
    
    [self addSubview:_backgroundImageView];
    [self addSubview:_lookButton];
    [self addSubview:_hairButton];
    [self addSubview:_skirtButton];
    [self addSubview:_upButton];
    [self addSubview:_downButton];
    [self addSubview:_shoesButton];
    [self addSubview:_decorationButton];
    [self addSubview:_backgroundButton];
    [self addSubview:_babyView];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0;
    int hight0;
    _backgroundImageView.frame = [UIScreen mainScreen].bounds;
    _backgroundImageView.image = [UIImage imageNamed:@"background2.jpeg"];
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    // 超出边框的内容都剪掉
    _backgroundImageView.clipsToBounds = YES;
    
    
    width0 = 0.187 * width;
    hight0 = 0.052 * hight;
    _lookButton.clipsToBounds = YES;
    if (_needRemake == 1) {
        [_lookButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.right.equalTo(self).offset(-30);
            make.top.equalTo(self).offset(50);
        }];
        _lookButton.layer.cornerRadius = hight0 / 2;
    }
    _lookButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_lookButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_lookButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _lookButton.tag = 1;
    _lookButton.titleLabel.numberOfLines = 3;
    
    [_hairButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.lookButton.mas_bottom).offset(20);
    }];
    _hairButton.clipsToBounds = YES;
    _hairButton.layer.cornerRadius = hight0 / 2;
    _hairButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_hairButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_hairButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _hairButton.tag = 2;
    
    [_skirtButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.hairButton.mas_bottom).offset(20);
    }];
    _skirtButton.clipsToBounds = YES;
    _skirtButton.layer.cornerRadius = hight0 / 2;
    _skirtButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_skirtButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_skirtButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _skirtButton.tag = 3;
    
    [_upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.skirtButton.mas_bottom).offset(20);
    }];
    _upButton.clipsToBounds = YES;
    _upButton.layer.cornerRadius = hight0 / 2;
    _upButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_upButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_upButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _upButton.tag = 4;
    
    [_downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.upButton.mas_bottom).offset(20);
    }];
    _downButton.clipsToBounds = YES;
    _downButton.layer.cornerRadius = hight0 / 2;
    _downButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_downButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_downButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _downButton.tag = 5;
    
    [_shoesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.downButton.mas_bottom).offset(20);
    }];
    _shoesButton.clipsToBounds = YES;
    _shoesButton.layer.cornerRadius = hight0 / 2;
    _shoesButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_shoesButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_shoesButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _shoesButton.tag = 6;
    
    [_decorationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.shoesButton.mas_bottom).offset(20);
    }];
    _decorationButton.clipsToBounds = YES;
    _decorationButton.layer.cornerRadius = hight0 / 2;
    _decorationButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_decorationButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_decorationButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _decorationButton.tag = 7;
    
    [_backgroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.decorationButton.mas_bottom).offset(20);
    }];
    _backgroundButton.clipsToBounds = YES;
    _backgroundButton.layer.cornerRadius = hight0 / 2;
    _backgroundButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_backgroundButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_backgroundButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _backgroundButton.tag = 8;
    
    [_babyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}

- (void)PressShowDetail:(UIButton*)btn {
    [_delegate PressShowDetailClick:btn];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
