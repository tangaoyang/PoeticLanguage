//
//  PLKeywordSearchDetailedView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchDetailedView.h"
#import "PoetryContent.h"
#import "Masonry.h"
#import "PoetryContent.h"

@implementation PLKeywordSearchDetailedView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 3);
        _mainScrollView.alwaysBounceVertical = YES;
        _mainScrollView.scrollEnabled = YES;
        [self addSubview:_mainScrollView];
        _mainScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        
    }
    return self;
}

- (void)labelInit {
    self.mainFirstLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_mainFirstLabel];
    _mainFirstLabel.text = [_poem.content substringToIndex:self->_poem.content.length / 2];
    _mainFirstLabel.font = [UIFont systemFontOfSize:32];
    _mainFirstLabel.numberOfLines = 0;
    [_mainFirstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainScrollView.mas_top).offset(80);
        make.left.mas_equalTo(self -> _mainScrollView.mas_left).offset(80);
        make.width.equalTo(@(34));
        make.height.equalTo(@((int)self->_poem.content.length / 2 * 38 + 50));
    }];
    
    self.mainSecondLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_mainSecondLabel];
    _mainSecondLabel.text = [_poem.content substringFromIndex:_poem.content.length / 2];
    _mainSecondLabel.font = [UIFont systemFontOfSize:32];
    _mainSecondLabel.numberOfLines = 0;
    [_mainSecondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainFirstLabel.mas_top).offset(100);
        make.left.mas_equalTo(self -> _mainFirstLabel.mas_left).offset(80);
        make.width.equalTo(@(34));
        make.height.mas_equalTo(self -> _mainFirstLabel.mas_height);
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_nameLabel];
    _nameLabel.text = _poem.name;
    _nameLabel.font = [UIFont fontWithName:@"PingFang SC" size:32];
    _nameLabel.numberOfLines = 0;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainFirstLabel.mas_bottom).offset(300);
        make.centerX.mas_equalTo(self -> _mainScrollView.mas_centerX);
        make.height.mas_equalTo(@(35));
    }];
    
    self.dynastyLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_dynastyLabel];
    _dynastyLabel.text = _poem.dynasty;
    _dynastyLabel.font = [UIFont fontWithName:@"Gurmukhi MN" size:18];
    _dynastyLabel.numberOfLines = 0;
    [_dynastyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _nameLabel.mas_right).offset(-50);
        make.top.mas_equalTo(self -> _nameLabel.mas_bottom).offset(20);
        make.width.equalTo(@(self -> _poem.dynasty.length * 22));
        make.height.mas_equalTo(@(20));
    }];
    
    self.allLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_allLabel];
    _allLabel.text = _poem.all;
    _allLabel.font = [UIFont systemFontOfSize:20];
    _allLabel.numberOfLines = 0;
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self -> _mainScrollView.mas_centerX);
        make.top.mas_equalTo(self -> _dynastyLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(@(self -> _number * 25 + 25));
    }];
    
    self.historyLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_historyLabel];
    _historyLabel.text = _poem.poetHistory;
    _historyLabel.font = [UIFont fontWithName:@"Copperplate" size:23];
    _historyLabel.numberOfLines = 0;
    NSDictionary *attri = @{NSFontAttributeName:_historyLabel.font};
    CGSize cContentSize = [_poem.poetHistory boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    [_historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _allLabel.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self -> _mainScrollView.mas_centerX);
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
