//
//  PLSettingUpdateOtherTableViewCell.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSettingUpdateOtherTableViewCell : UITableViewCell
<
UITextFieldDelegate
>

@property (nonatomic, strong) UILabel *cellLabel;
@property (nonatomic, strong) UITextField *cellTextField;

@end

NS_ASSUME_NONNULL_END
