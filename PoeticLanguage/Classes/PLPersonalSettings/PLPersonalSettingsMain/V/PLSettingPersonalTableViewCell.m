
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
    
    self.gradeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_gradeLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentLabel];
    
    self.personalImageButton = [[UIButton alloc] init];
    [self.contentView addSubview:_personalImageButton];
    [_personalImageButton addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.personalImageButton setImage:[UIImage imageNamed:@"headImage.jpg"] forState:UIControlStateNormal];
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(150, 5, 180, 60);
    
    _gradeLabel.frame = CGRectMake(151, 49, 100, 20);
    
    _contentLabel.frame = CGRectMake(150, 77, 300, 20);
    
    _personalImageButton.frame = CGRectMake(30, 20, 90, 90);
    
}

- (void)changeImage {
    NSNotification *changeImage = [NSNotification notificationWithName:@"changeImage" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:changeImage];
}

@end
