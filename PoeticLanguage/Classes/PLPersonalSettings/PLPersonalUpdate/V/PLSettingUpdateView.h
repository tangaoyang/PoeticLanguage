//
//  PLSettingUpdateView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSettingUpdateView : UIView
<
UITextFieldDelegate
>

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *updateLabel;
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *contentTextField;

@end

NS_ASSUME_NONNULL_END
