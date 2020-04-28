//
//  PLRegisterView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UnderlineTextField;

@interface PLRegisterView : UIView

@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UILabel *confirmLabel; //验证码
@property (nonatomic, strong) UnderlineTextField *accountTextField;
@property (nonatomic, strong) UnderlineTextField *passwordTextField;
@property (nonatomic, strong) UnderlineTextField *confirmTextFiled;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end

NS_ASSUME_NONNULL_END
