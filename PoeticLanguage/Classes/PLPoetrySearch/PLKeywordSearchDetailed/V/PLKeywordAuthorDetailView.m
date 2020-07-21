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

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *backImage = [UIImage imageNamed:@"allBackgroundImage.jpg"];
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
        [self insertSubview:backImageView atIndex:0];
        [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self);
            make.width.height.right.mas_equalTo(self);
        }];
        
        
    }
    return self;
}

- (void)labelInit {
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.text = _author.name;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_nameLabel withSize:32];
    _nameLabel.numberOfLines = 0;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(150);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(@(35));
    }];
    
    NSMutableString *all = [[NSMutableString alloc] init];
    [all appendString:[NSString stringWithFormat:@"%C", [_author.desc characterAtIndex:0]]];
    for (int i = 1; i < _author.desc.length - 1; i++) {
        unichar str =   [_author.desc characterAtIndex:i];
        NSString *str1 = [NSString stringWithFormat:@"%C", str];
        NSLog(@"%@", str1);
        if (![str1 isEqualToString:@" "]) {
            [all appendString:str1];
        } else {
            break;
        }
    }
    
    self.historyLabel = [[UILabel alloc] init];
    [self addSubview:_historyLabel];
    _historyLabel.text = all;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"HannotateSC-W5"withLabel:_historyLabel withSize:18];
    _historyLabel.numberOfLines = 0;
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGSize cContentSize = [all boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    NSLog(@"%@", _author.desc);
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
