//
//  PLCollectionTableViewCell.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/6/16.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLCollectionTableViewCell.h"
#import "Masonry.h"
#import "ChangeFontTay.h"
#import "PLPSCellButton.h"

@implementation PLCollectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.poetLabel = [[UILabel alloc] init];
    [self addSubview:_poetLabel];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_poetLabel withSize:19];
    _poetLabel.backgroundColor = [UIColor clearColor];
    _poetLabel.textColor = [UIColor colorWithRed:88/255.0 green:115/255.0 blue:150/255.0 alpha:1];
    
    self.contectTextView = [[UITextView alloc] init];
    [self addSubview:_contectTextView];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_contectTextView withSize:19];
    _contectTextView.backgroundColor = [UIColor clearColor];
    _contectTextView.editable = NO;
    _contectTextView.scrollEnabled = NO;
    
    self.timeLabel = [[UILabel alloc] init];
    [self addSubview:_timeLabel];
    _timeLabel.backgroundColor = [UIColor clearColor];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_timeLabel withSize:12];
    _timeLabel.textColor = [UIColor colorWithRed:128/255.0 green:127/255.0 blue:128/255.0 alpha:1];
    
    self.collectionButton = [[PLPSCellButton alloc] init];
    [self addSubview:_collectionButton];
    [_collectionButton.buttonImageView setImage:[[UIImage imageNamed:@"pl_ps_uncollect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _collectionButton.buttonLabel.text = @"收藏";
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_collectionButton.buttonLabel withSize:15];
    _collectionButton.selected = NO;
    
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_poetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(30);
        make.width.equalTo(@(200));
        make.height.equalTo(@(20));
        make.top.mas_equalTo(self.mas_top).offset(30);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _poetLabel.mas_left).offset(30);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.width.equalTo(@(200));
        make.height.equalTo(@(15));
    }];
    
    [_contectTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _poetLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self -> _timeLabel.mas_left);
        make.bottom.mas_equalTo(self -> _timeLabel.mas_top).offset(-10);
        make.right.mas_equalTo(self.mas_right).offset(-30);
    }];
    
    [_collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _timeLabel).offset(-10);
        make.right.mas_equalTo(self).offset(-30);
        make.width.equalTo(@70);
        make.bottom.mas_equalTo(self -> _timeLabel);
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
