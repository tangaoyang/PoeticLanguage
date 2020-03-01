
//
//  PLSettingPersonalTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingPersonalTableViewCell.h"
#import "ChangeFontTay.h"

@implementation PLSettingPersonalTableViewCell

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
    
    self.writerLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_writerLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    
    self.personalImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_personalImageView];
    
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(150, 0, 180, 60);
    
    _writerLabel.frame = CGRectMake(150, 43, 100, 20);
    
    _contentLabel.frame = CGRectMake(150, 63, 300, 15);
    
    _personalImageView.frame = CGRectMake(30, 15, 100, 100);
    
}

@end
