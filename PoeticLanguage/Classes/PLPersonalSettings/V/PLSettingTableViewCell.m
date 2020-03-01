//
//  PLSettingTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingTableViewCell.h"

@implementation PLSettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.iimageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iimageView];
    
    return self;
    
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(42, 17, 300, 20);
    _nameLabel.font = [UIFont systemFontOfSize:17];
    
    _iimageView.frame = CGRectMake(10, 15, 20, 20);
    
}

@end
