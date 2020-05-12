
//
//  PLRegisterView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRegisterView.h"
#import "ChangeFontTay.h"
#import <Masonry.h>
#import "UnderlineTextField.h"

@implementation PLRegisterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.welcomeLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STXingkaiSC-Light" withLabel:_welcomeLabel withSize:65];
        [self addSubview:_welcomeLabel];
        [_welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(145);
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
        _accountLabel.text = @"手机号";
        _accountLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
        self.accountTextField = [[UnderlineTextField alloc] init];
        [self addSubview:_accountTextField];
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _accountLabel.mas_bottom).offset(10);
            make.height.equalTo(@50);
            make.left.mas_equalTo(self -> _accountLabel);
            make.right.mas_equalTo(self).offset(-50);
        }];
        _accountTextField.tintColor = [UIColor blackColor];
        
        self.confirmLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_confirmLabel withSize:20];
        [self addSubview:_confirmLabel];
        [_confirmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _accountTextField.mas_bottom).offset(15);
            make.height.equalTo(@25);
            make.left.and.right.mas_equalTo(self -> _welcomeLabel);
        }];
        _confirmLabel.text = @"验证码";
        _confirmLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
        self.confirmTextFiled = [[UnderlineTextField alloc] init];
        [self addSubview:_confirmTextFiled];
        [_confirmTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _confirmLabel.mas_bottom).offset(10);
            make.height.equalTo(@50);
            make.left.mas_equalTo(self -> _confirmLabel);
            make.right.mas_equalTo(self).offset(-50);
        }];
        _confirmTextFiled.tintColor = [UIColor blackColor];
        _confirmTextFiled.secureTextEntry = YES;
        
        self.confirmButton = [[UIButton alloc] init];
        [self addSubview:_confirmButton];
        [_confirmButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_confirmButton.titleLabel withSize:13];
        _confirmButton.titleLabel.textColor = [UIColor whiteColor];
        _confirmButton.backgroundColor = [UIColor colorWithRed:115/255 green:100/255 blue:120/255 alpha:0.8];
        [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self -> _confirmTextFiled);
            make.right.mas_equalTo(self -> _confirmTextFiled);
            make.height.mas_equalTo(self -> _confirmTextFiled).offset(-10);
            make.width.equalTo(@80);
        }];
        _confirmButton.tintColor = [UIColor whiteColor];
        _confirmButton.layer.cornerRadius = 5;
        _confirmButton.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的颜色
        _confirmButton.layer.shadowOffset = CGSizeMake(5, 5);//阴影偏移量
        _confirmButton.layer.shadowOpacity = 0.8;//阴影的透明度
        _confirmButton.layer.shadowRadius = 5;//阴影的圆角
        
        self.passwordLabel = [[UILabel alloc] init];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_passwordLabel withSize:20];
        [self addSubview:_passwordLabel];
        [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _confirmTextFiled.mas_bottom).offset(15);
            make.height.equalTo(@25);
            make.left.and.right.mas_equalTo(self -> _accountLabel);
        }];
        _passwordLabel.text = @"密码";
        _passwordLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        
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
        
        self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_sureButton];
        [_sureButton setTitle:@"确认" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_sureButton.titleLabel withSize:23];
        _sureButton.titleLabel.textColor = [UIColor whiteColor];
        _sureButton.backgroundColor = [UIColor blackColor];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _passwordTextField.mas_bottom).offset(80);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.equalTo(@60);
            make.width.mas_equalTo(self.mas_width).offset(-120);
        }];
        _sureButton.tintColor = [UIColor whiteColor];
        _sureButton.layer.cornerRadius = 5;
        _sureButton.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的颜色
        _sureButton.layer.shadowOffset = CGSizeMake(5, 5);//阴影偏移量
        _sureButton.layer.shadowOpacity = 0.8;//阴影的透明度
        _sureButton.layer.shadowRadius = 5;//阴影的圆角
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_cancelButton];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_cancelButton.titleLabel withSize:23];
        _cancelButton.titleLabel.textColor = [UIColor whiteColor];
        _cancelButton.backgroundColor = [UIColor blackColor];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _sureButton.mas_bottom).offset(40);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.equalTo(@60);
            make.width.mas_equalTo(self.mas_width).offset(-120);
        }];
        _cancelButton.tintColor = [UIColor whiteColor];
        _cancelButton.layer.cornerRadius = 5;
        _cancelButton.layer.shadowColor = [UIColor grayColor].CGColor;//阴影的颜色
        _cancelButton.layer.shadowOffset = CGSizeMake(5, 5);//阴影偏移量
        _cancelButton.layer.shadowOpacity = 0.8;//阴影的透明度
        _cancelButton.layer.shadowRadius = 5;//阴影的圆角
        
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
