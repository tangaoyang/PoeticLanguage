//
//  PLDailySharingView.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/24.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDailySharingView.h"

@implementation PLDailySharingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    
    _titleLabel = [[UILabel alloc] init];
    _dynastyLabel = [[UILabel alloc] init];
    _authorLabel = [[UILabel alloc] init];
    _paragraphLabel = [[UILabel alloc] init];
    
    [self addSubview:_titleLabel];
    [self addSubview:_dynastyLabel];
    [self addSubview:_authorLabel];
    [self addSubview:_paragraphLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:23];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top);
    }];
    
    _dynastyLabel.textAlignment = NSTextAlignmentRight;
    _dynastyLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:20];
    [_dynastyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.right.equalTo(self.mas_centerX).offset(-50);
    }];
    
    _authorLabel.textAlignment = NSTextAlignmentLeft;
    _authorLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:20];
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.left.equalTo(self.mas_centerX).offset(50);
    }];
    
    _paragraphLabel.textAlignment = NSTextAlignmentCenter;
    _paragraphLabel.numberOfLines = 0;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 50.0f;
    NSDictionary *dic;
    
    NSAttributedString *attributeStr;
    if ([_paragraphLabel.text length] == 0) {
        dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:23], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
        attributeStr = [[NSAttributedString alloc] initWithString:@"" attributes:dic];
    } else {
        if (_juhao >= 15) {
            dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:18], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
            _titleLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:18];
            _authorLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:18];
            _dynastyLabel.font = [UIFont fontWithName:@"TpldKhangXiDict" size:18];
        } else {
            dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:23], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
        }
        attributeStr = [[NSAttributedString alloc] initWithString:_paragraphLabel.text attributes:dic];
    }
    _paragraphLabel.attributedText = attributeStr;
    [_paragraphLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.mas_bottom).offset(40);
        make.centerX.equalTo(self.mas_centerX);
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
