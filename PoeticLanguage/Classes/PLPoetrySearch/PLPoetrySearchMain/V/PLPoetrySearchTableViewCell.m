
//
//  PLPoetrySearchTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/18.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchTableViewCell.h"
#import "Masonry.h"

@implementation PLPoetrySearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.poetLabel = [[UILabel alloc] init];
    [self addSubview:_poetLabel];
    _poetLabel.font = [UIFont systemFontOfSize:17];
    _poetLabel.backgroundColor = [UIColor clearColor];
    _poetLabel.textColor = [UIColor colorWithRed:88/255.0 green:115/255.0 blue:150/255.0 alpha:1];
    
    self.contectTextView = [[UITextView alloc] init];
    [self addSubview:_contectTextView];
    _contectTextView.font = [UIFont systemFontOfSize:17];
    _contectTextView.backgroundColor = [UIColor clearColor];
    _contectTextView.editable = NO;
    _contectTextView.scrollEnabled = NO;
    
    self.timeLabel = [[UILabel alloc] init];
    [self addSubview:_timeLabel];
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor colorWithRed:128/255.0 green:127/255.0 blue:128/255.0 alpha:1];
    
    self.photoImageView = [[UIImageView alloc] init];
    [self addSubview:_photoImageView];
    _photoImageView.layer.masksToBounds = YES;
    _photoImageView.layer.cornerRadius = 10;
    
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.width.and.height.equalTo(@(50));
    }];
    
    [_poetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _photoImageView.mas_right).offset(20);
        make.width.equalTo(@(200));
        make.height.equalTo(@(20));
        make.top.mas_equalTo(self -> _photoImageView.mas_top);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _poetLabel.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.width.equalTo(@(200));
        make.height.equalTo(@(15));
    }];
    
    [_contectTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _poetLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self -> _poetLabel.mas_left);
        make.bottom.mas_equalTo(self -> _timeLabel.mas_top).offset(-10);
        make.right.mas_equalTo(self.mas_right).offset(-30);
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
