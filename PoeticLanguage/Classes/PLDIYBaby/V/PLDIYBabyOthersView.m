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
    _backgroundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _babyView = [[PLDIYBabyView alloc] init];
    
    [self addSubview:_backgroundImageView];
    [self addSubview:_babyView];
    [self addSubview:_lookButton];
    [self addSubview:_hairButton];
    [self addSubview:_skirtButton];
    [self addSubview:_backgroundButton];
    [self addSubview:_saveButton];
    
    _backgroundImageView.image = [[UIImage imageNamed:@"B2804388-30EA-4F2F-BA24-B005FB3B295E的副本.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _saveButtonColorChange = YES;
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0;
    int hight0;
    _backgroundImageView.frame = [UIScreen mainScreen].bounds;

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
    
    [_backgroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-30);
        make.top.equalTo(self.skirtButton.mas_bottom).offset(20);
    }];
    _backgroundButton.clipsToBounds = YES;
    _backgroundButton.layer.cornerRadius = hight0 / 2;
    _backgroundButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_backgroundButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    [_backgroundButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
    _backgroundButton.tag = 4;
    
    [_babyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
    
    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundButton.mas_bottom).offset(20);
        make.width.height.equalTo(self.hairButton.mas_width);
        make.right.equalTo(self.mas_right).offset(-30);
    }];
    _saveButton.layer.cornerRadius = width0 / 2;
    [_saveButton setTitle:@"保存\n套装" forState:UIControlStateNormal];
    _saveButton.titleLabel.numberOfLines = 0;
 //   _saveButton.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    [_saveButton setTitleColor:[UIColor colorWithRed:0.98f green:0.90f blue:0.69f alpha:1.00f] forState:UIControlStateNormal];
    _image = _babyView.clothesImageView.image;
    _chromoplast = [[SOZOChromoplast alloc] initWithImage:_image];
    if (_saveButtonColorChange == YES) {
        _saveButton.backgroundColor = _chromoplast.firstHighlight;
    }
    _saveButton.tag = 5;
    [_saveButton addTarget:self action:@selector(PressShowDetail:) forControlEvents:UIControlEventTouchUpInside];
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
