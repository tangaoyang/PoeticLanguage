//
//  PLKeywordSearchDetailedView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchDetailedView.h"
#import "Masonry.h"
#import "ChangeFontTay.h"
#import "PLKeywordSearchDetailModel.h"

/* 整首诗的位置top改为离屏幕一个屏幕高度*/


@implementation PLKeywordSearchDetailedView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _number = 0;
        self.mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.alwaysBounceVertical = YES;
        _mainScrollView.scrollEnabled = YES;
        [self addSubview:_mainScrollView];
        _mainScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
      
        _characterImageView = [[UIImageView alloc] init];
        [self.mainScrollView addSubview:_characterImageView];
    }
    return self;
}

- (void)labelInit {

    float hight = [UIScreen mainScreen].bounds.size.height;
  
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 2);  //self -> _number * 25 + 150
    _mainScrollView.pagingEnabled = YES;
    
    _content = [_content stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    self.mainFirstLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_mainFirstLabel];
    _mainFirstLabel.text = [_content substringToIndex:self-> _content.length / 2];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"HannotateSC-W5" withLabel:_mainFirstLabel withSize:32];
    _mainFirstLabel.numberOfLines = 0;
    [_mainFirstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainScrollView.mas_top).offset(0);
        make.left.mas_equalTo(self -> _mainScrollView.mas_left).offset(80);
        make.width.equalTo(@(34));
        make.height.equalTo(@((int)self->_content.length / 2 * 50));
    }];
    
    self.mainSecondLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_mainSecondLabel];
    _mainSecondLabel.text = [_content substringFromIndex:self-> _content.length / 2];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"HannotateSC-W5" withLabel:_mainSecondLabel withSize:32];
    _mainSecondLabel.numberOfLines = 0;
    [_mainSecondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainFirstLabel.mas_top).offset(100);
        make.left.mas_equalTo(self -> _mainFirstLabel.mas_left).offset(80);
        make.width.equalTo(@(34));
        make.height.mas_equalTo(self -> _mainFirstLabel.mas_height).offset(30);
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_nameLabel];
    _nameLabel.text = _poem.title;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_nameLabel withSize:32];
    _nameLabel.numberOfLines = 0;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mainScrollView.mas_top).offset(hight + (hight - (self -> _number * 25)) / 2 - 70);
        make.centerX.mas_equalTo(self -> _mainScrollView.mas_centerX);
        make.height.mas_equalTo(@(35));
    }];
    
    self.dynastyLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_dynastyLabel];
    _dynastyLabel.text = _poem.dynasty;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_dynastyLabel withSize:18];
    _dynastyLabel.numberOfLines = 0;
    [_dynastyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _nameLabel.mas_right).offset(-50);
        make.top.mas_equalTo(self -> _nameLabel.mas_bottom).offset(20);
        make.width.equalTo(@(self -> _poem.dynasty.length * 22));
        make.height.mas_equalTo(@(20));
    }];
    
    self.allLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_allLabel];
    _allLabel.text = _poem.paragraphs;
    _allLabel.textAlignment = NSTextAlignmentCenter;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_allLabel withSize:20];
    _allLabel.numberOfLines = 0;
    NSLog(@"%@", _poem.paragraphs);
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self -> _mainScrollView.mas_centerX);
        make.top.mas_equalTo(self -> _dynastyLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(@(self -> _number * 25 + 25));
        make.width.mas_equalTo(self).offset(-30);
    }];
    
    /* 蒲悦蓉写的人物动画部分 */
    float width = [UIScreen mainScreen].bounds.size.width;
    float width0;
    float hight0;
    float left;
    float top;
    float bottom;
    bottom = 0.85 * hight;
    width0 = 0.9 * width;
    hight0 = 0.5614 * hight;
    top = 0.55 * hight;
    left = 0.8 * width;    //0.8
    [_characterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
   //     make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.bottom.equalTo(self.mainScrollView.mas_top).offset(bottom);
//        make.centerY.equalTo(self.mainScrollView.mas_top).offset(top);
        make.centerX.equalTo(self.mainScrollView.mas_left).offset(left);
 //       make.left.equalTo(self.mainScrollView.mas_left).offset(left);
    }];
    _characterImageView.image = [UIImage imageNamed:@"CharacterAnimation1.jpeg"];
    _characterImageView.contentMode = UIViewContentModeScaleAspectFit;
    CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration = 1;
    hight0 = bottom - 0.2807 * hight;
 //   left = 0.5 * width + _characterImageView.image.size.width / 2;
    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(width,hight0)];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(left,hight0)];
    [_characterImageView.layer addAnimation:moveAnimation forKey:@"poistion"];


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end




