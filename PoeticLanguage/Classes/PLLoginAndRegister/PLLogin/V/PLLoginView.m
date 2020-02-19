//
//  PLLoginView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLLoginView.h"
#import "ChangeFontTay.h"
#import <Masonry.h>
#import "UnderlineTextField.h"

@implementation PLLoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.welcomeLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STXingkaiSC-Light" withLabel:_welcomeLabel withSize:65];
        [self addSubview:_welcomeLabel];
        [_welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(175);
            make.left.mas_equalTo(self.mas_left).offset(50);
            make.right.mas_equalTo(self.mas_right).offset(-100);
            make.height.equalTo(@100);
        }];
        _welcomeLabel.text = @"诗语";
        
        self.accountLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_accountLabel withSize:20];
        [self addSubview:_accountLabel];
        [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _welcomeLabel.mas_top).offset(150);
            make.height.equalTo(@25);
            make.left.and.right.mas_equalTo(self -> _welcomeLabel);
        }];
        _accountLabel.text = @"账号";
        _accountLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
        self.passwordLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_passwordLabel withSize:20];
        [self addSubview:_passwordLabel];
        [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _accountLabel.mas_top).offset(150);
            make.height.equalTo(@25);
            make.left.and.right.mas_equalTo(self -> _accountLabel);
        }];
        _passwordLabel.text = @"密码";
        _passwordLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
        self.accountTextField = [[UnderlineTextField alloc] init];
        [self addSubview:_accountTextField];
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _accountLabel.mas_bottom).offset(10);
            make.height.equalTo(@50);
            make.left.mas_equalTo(self -> _accountLabel);
            make.right.mas_equalTo(self).offset(-50);
        }];
        _accountTextField.tintColor = [UIColor blackColor];
        
        self.passwordTextField = [[UnderlineTextField alloc] init];
        [self addSubview:_passwordTextField];
        [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _passwordLabel.mas_bottom).offset(10);
            make.height.equalTo(@50);
            make.left.mas_equalTo(self -> _passwordLabel);
            make.right.mas_equalTo(self).offset(-50);
        }];
        _passwordTextField.tintColor = [UIColor blackColor];
        _passwordTextField.secureTextEntry = YES;
        
        self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_registerButton];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_registerButton.titleLabel withSize:23];
        [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self -> _passwordTextField);
            make.top.mas_equalTo(self -> _passwordTextField.mas_bottom).offset(20);
            make.height.equalTo(@25);
            make.width.equalTo(@50);
        }];
        _registerButton.tintColor = [UIColor blackColor];
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_loginButton];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_loginButton.titleLabel withSize:23];
        _loginButton.titleLabel.textColor = [UIColor whiteColor];
        _loginButton.backgroundColor = [UIColor blackColor];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _passwordTextField.mas_bottom).offset(100);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.equalTo(@60);
            make.width.mas_equalTo(self.mas_width).offset(-120);
        }];
        _loginButton.tintColor = [UIColor whiteColor];
        _loginButton.layer.cornerRadius = 5;
        _loginButton.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的颜色
        _loginButton.layer.shadowOffset = CGSizeMake(5, 5);//阴影偏移量
        _loginButton.layer.shadowOpacity = 0.8;//阴影的透明度
        _loginButton.layer.shadowRadius = 5;//阴影的圆角
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountTextField endEditing:YES];
    [_passwordTextField endEditing:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
