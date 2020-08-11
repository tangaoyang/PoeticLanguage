//
//  PLGroupView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/15.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLGroupView.h"
#import <Masonry.h>
#import "ChangeFontTay.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLGroupView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(100);
            make.height.equalTo(@(100));
        }];
        _nameLabel.text = @"等级说明";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_nameLabel withSize:35];
        
        self.gradeImageView = [[UIImageView alloc] init];
        [self addSubview:_gradeImageView];
        [_gradeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _nameLabel.mas_bottom);
            make.right.equalTo(@(-20));
            make.left.equalTo(@(20));
            make.height.equalTo(@180);
        }];
        double count = 45;
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5 - i; j++) {
                UIImageView *starSingleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(W / 2 - 21 * j - 70, i * 23 + 25, 20, 20)];
                [starSingleImageView setImage:[UIImage imageNamed:@"BeanFlapStarUnlight.png"]];
                [_gradeImageView addSubview:starSingleImageView];
            }
            if (count != 0) {
                UIProgressView *gradeProgressView = [[UIProgressView alloc] init];
                gradeProgressView.frame = CGRectMake(W / 2 - 25, i * 24 + 36, 150, 26);
                gradeProgressView.backgroundColor = [UIColor grayColor];
                gradeProgressView.progressTintColor = [UIColor orangeColor];
                gradeProgressView.progressViewStyle = UIProgressViewStyleDefault;
                if (i == 4) {
                    double progress = 1;
                    gradeProgressView.progress = progress;
                } else if (i == 3) {
                    gradeProgressView.progress = (count/30);
                } else if (i == 2) {
                    gradeProgressView.progress = (count/60);
                } else if (i == 1) {
                    gradeProgressView.progress = (count/100);
                } else {
                    gradeProgressView.progress = (count/1000);
                }
                [_gradeImageView addSubview:gradeProgressView];
            }
        }
        
        self.contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@50);
            make.right.equalTo(@-50);
            make.top.mas_equalTo(self).offset(180);
            make.bottom.mas_equalTo(self).offset(-100);
        }];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_contentLabel withSize:17];
        _contentLabel.text = @" 升级机制：采用\"背诵积分制来对用户进行升级\"，每背诵一首诗积累积分为5分，积分对应的级别分别为:\n0分：1级(默认级别)\n10分：2级\n30分：3级\n60分：4级\n100分：5级";
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
