//
//  PLSettingUpdateOtherTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingUpdateOtherTableViewCell.h"
#import <Masonry.h>

@implementation PLSettingUpdateOtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.cellLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_cellLabel];
    _cellLabel.font = [UIFont systemFontOfSize:14];
    _cellLabel.tintColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    
    self.cellTextField = [[UITextField alloc] init];
    _cellTextField.font = [UIFont systemFontOfSize:14];
    _cellTextField.delegate = self;
    [self.contentView addSubview:_cellTextField];
    
    return self;
    
}

- (void)layoutSubviews {
    
    [_cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.bottom.mas_equalTo(self).offset(-10);
        make.left.equalTo(@10);
        make.width.equalTo(@80);
    }];
    
    [_cellTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(130);
        make.top.bottom.mas_equalTo(self -> _cellLabel);
        make.right.mas_equalTo(self).offset(-25);
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
