//
//  PLSettingUpdateView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingUpdateView.h"
#import <Masonry.h>

@implementation PLSettingUpdateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        self.headerImageView = [[UIImageView alloc] init];
        [self addSubview:_headerImageView];
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.layer.cornerRadius = 40;
        _headerImageView.image = [userDefaults objectForKey:@"header"];
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(@80);
            make.left.equalTo(@20);
            make.top.equalTo(@100);
        }];
        
        self.updateLabel = [[UILabel alloc] init];
        [self addSubview:_updateLabel];
        _updateLabel.text = @"修改头像";
        _updateLabel.font = [UIFont systemFontOfSize:17];
        _updateLabel.tintColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [_updateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self -> _headerImageView.mas_right).offset(30);
            make.top.equalTo(@130);
            make.height.equalTo(@15);
            make.width.equalTo(@100);
        }];
        
        self.accountLabel = [[UILabel alloc] init];
        [self addSubview:_accountLabel];
        _accountLabel.text = @"账号";
        _accountLabel.font = [UIFont systemFontOfSize:14];
        _accountLabel.tintColor = [UIColor grayColor];
        [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _headerImageView.mas_bottom).offset(25);
            make.height.mas_equalTo(self -> _updateLabel);
            make.left.equalTo(@10);
            make.width.equalTo(@80);
        }];
        
        self.accountTextField = [[UITextField alloc] init];
        _accountTextField.font = [UIFont systemFontOfSize:14];
        _accountTextField.enabled = NO;
        _accountTextField.text = [userDefaults objectForKey:@"accountNumber"];
        _accountTextField.delegate = self;
        [self addSubview:_accountTextField];
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(130);
            make.top.bottom.mas_equalTo(self -> _accountLabel);
            make.right.mas_equalTo(self).offset(-25);
        }];
        
        self.nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        _nameLabel.text = @"名称";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.tintColor = [UIColor grayColor];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _accountLabel.mas_bottom).offset(25);
            make.height.mas_equalTo(self -> _accountLabel);
            make.left.equalTo(@10);
            make.width.equalTo(@80);
        }];
        
        self.nameTextField = [[UITextField alloc] init];
        _nameTextField.font = [UIFont systemFontOfSize:14];
        _nameTextField.text = [userDefaults objectForKey:@"name"];
        _nameTextField.delegate = self;
        [self addSubview:_nameTextField];
        [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(130);
            make.top.bottom.mas_equalTo(self -> _nameLabel);
            make.right.mas_equalTo(self).offset(-25);
        }];
        
        self.contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        _contentLabel.text = @"简介";
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.tintColor = [UIColor grayColor];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _nameLabel.mas_bottom).offset(25);
            make.height.mas_equalTo(self -> _nameLabel);
            make.left.equalTo(@10);
            make.width.equalTo(@80);
        }];
        
        self.contentTextField = [[UITextField alloc] init];
        _contentTextField.font = [UIFont systemFontOfSize:14];
        _contentTextField.text = [userDefaults objectForKey:@"signature"];
        _contentTextField.delegate = self;
        [self addSubview:_contentTextField];
        [_contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(130);
            make.top.bottom.mas_equalTo(self -> _contentLabel);
            make.right.mas_equalTo(self).offset(-25);
        }];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
