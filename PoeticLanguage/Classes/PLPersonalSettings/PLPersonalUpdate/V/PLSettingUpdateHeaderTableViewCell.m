//
//  PLSettingUpdateHeaderTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingUpdateHeaderTableViewCell.h"
#import <Masonry.h>

@implementation PLSettingUpdateHeaderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.headerImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerImageView];
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.layer.cornerRadius = 40;
    
    self.updateLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_updateLabel];
    _updateLabel.text = @"修改头像";
    _updateLabel.font = [UIFont systemFontOfSize:17];
    _updateLabel.tintColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@80);
        make.left.equalTo(@20);
        make.centerY.mas_equalTo(self);
    }];
    
    [_updateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _headerImageView.mas_right).offset(30);
        make.centerY.mas_equalTo(self);
        make.width.equalTo(@100);
    }];
    
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
