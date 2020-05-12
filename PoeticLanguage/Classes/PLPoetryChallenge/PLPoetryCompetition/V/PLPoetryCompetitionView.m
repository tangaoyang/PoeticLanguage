//
//  PLPoetryCompetitionView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetryCompetitionView.h"
#import "ChangeFontTay.h"
#import <Masonry.h>

@implementation PLPoetryCompetitionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pl_pc_fly.jpg"]];
        [self insertSubview:backImageView atIndex:0];
        
        self.titleLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STXingkaiSC-Light" withLabel:_titleLabel withSize:65];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(75);
            make.left.mas_equalTo(self).offset(40);
            make.height.equalTo(@70);
            make.width.mas_equalTo(self);
        }];
        _titleLabel.text = @"飞花令";
        
        self.introduceLabel = [[UILabel alloc] init];
        [self addSubview:_introduceLabel];
        _introduceLabel.numberOfLines = 0;
        _introduceLabel.text = @"行飞花令时可选用诗和词，也可用曲，但选择的句子一般不超过七个字。比如说，酒宴上甲说一句第一字带有“花”的诗词，如“花近高楼伤客心”。乙要接续第二字带“花”的诗句，如“落花时节又逢君”。丙可接“春江花朝秋月夜”，“花”在第三字位置上。丁接“人面桃花相映红”，“花”在第四字位置上。接着可以是“不知近水花先发”、“出门俱是看花人”、“霜叶红于二月花”等。到花在第七个字位置上则一轮完成，可继续循环下去。行令人一个接一个，当作不出诗、背不出诗或作错、背错时，则游戏结束，对方获胜，根据轮数确定积分。";
        CGSize introduceSize = [[NSString stringWithFormat:@"%@", _introduceLabel.text] boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
        NSLog(@"introduceSize == %f, %f", introduceSize.width, introduceSize.height);
        [_introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _titleLabel.mas_bottom).offset(20);
            make.left.mas_equalTo(self).offset(20);
            make.right.mas_equalTo(self).offset(-20);
            make.height.equalTo(@(introduceSize.height + 20));
        }];
        
        self.beginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_beginButton setTitle:@"开始游戏" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_beginButton.titleLabel withSize:23];
        _beginButton.titleLabel.textColor = [UIColor whiteColor];
        _beginButton.backgroundColor = [UIColor blackColor];
        _beginButton.tintColor = [UIColor whiteColor];
        _beginButton.layer.cornerRadius = 5;
        _beginButton.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的颜色
        _beginButton.layer.shadowOffset = CGSizeMake(5, 5);//阴影偏移量
        _beginButton.layer.shadowOpacity = 0.8;//阴影的透明度
        _beginButton.layer.shadowRadius = 5;//阴影的圆角
        
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
