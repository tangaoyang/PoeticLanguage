//
//  PLKeywordAuthorDetailView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordAuthorDetailView.h"
#import "Masonry.h"
#import "ChangeFontTay.h"
#import "PLKeywordAuthorModel.h"
#define H [UIScreen mainScreen].bounds.size.height

@implementation PLKeywordAuthorDetailView

- (void)labelInit {
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    NSLog(@"_author.name = %@", _author.name);
    _nameLabel.text = _author.name;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_nameLabel withSize:32];
    _nameLabel.numberOfLines = 0;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(H);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(@(35));
    }];
    
    self.historyLabel = [[UILabel alloc] init];
    [self addSubview:_historyLabel];
    _historyLabel.text = _author.desc;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"HannotateSC-W5"withLabel:_historyLabel withSize:18];
    _historyLabel.numberOfLines = 0;
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGSize cContentSize = [_author.desc boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    [_historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _nameLabel.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self);
        make.width.equalTo(@(cContentSize.width));
        make.height.equalTo(@(cContentSize.height + 30));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
