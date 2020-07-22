//
//  PLFaceRecognitionView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLFaceRecognitionView.h"
#import "PLFaceRecognitionModel.h"
#import "ChangeFontTay.h"
#import <Masonry.h>
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation PLFaceRecognitionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.alwaysBounceVertical = YES;
        _mainScrollView.scrollEnabled = YES;
        [self addSubview:_mainScrollView];
        _mainScrollView.frame = CGRectMake(0, 0, W, H);
    }
    return self;
}

- (void)labelInit {
    
    float hight = [UIScreen mainScreen].bounds.size.height;
    
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 3);  //self -> _number * 25 + 150
    _mainScrollView.pagingEnabled = NO;
    
    self.titleLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_titleLabel];
    _titleLabel.text = _poem.poet.title;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_titleLabel withSize:32];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _mainScrollView).offset(150);
        make.centerX.mas_equalTo(self -> _mainScrollView);
        make.width.equalTo(self -> _mainScrollView);
        make.height.equalTo(@(50));
    }];
    
    self.authorLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_authorLabel];
    _authorLabel.text = _poem.poet.author;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_authorLabel withSize:18];
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self -> _titleLabel.mas_right).offset(-20);
        make.top.mas_equalTo(self -> _titleLabel.mas_bottom).offset(20);
        make.width.equalTo(@(self -> _poem.poet.author.length * 25));
        make.height.mas_equalTo(@(20));
    }];
    
    self.dynastyLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_dynastyLabel];
    _dynastyLabel.text = _poem.poet.dynasty;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_dynastyLabel withSize:18];
    _dynastyLabel.textAlignment = NSTextAlignmentRight;
    [_dynastyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self -> _authorLabel.mas_left).offset(-13);
        make.top.mas_equalTo(self -> _authorLabel);
        make.width.equalTo(@(55));
        make.height.mas_equalTo(@(20));
    }];
    
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGSize contentSize = [_poem.poet.content boundingRectWithSize:CGSizeMake(W - 20, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    self.contentLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_contentLabel];
    _contentLabel.text = _poem.poet.content;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_contentLabel withSize:20];
    _contentLabel.numberOfLines = 0;
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _dynastyLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(self).offset(-40);
        make.left.mas_equalTo(self).offset(20);
        make.height.mas_equalTo(contentSize.height);
    }];
    
    CGSize translationSize = [_poem.poet.translation boundingRectWithSize:CGSizeMake(W - 20, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    self.translationLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_translationLabel];
    _translationLabel.text = _poem.poet.translation;
    _translationLabel.numberOfLines = 0;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_translationLabel withSize:18];
    [_translationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _contentLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(self).offset(-40);
        make.left.mas_equalTo(self).offset(20);
        make.height.mas_equalTo(translationSize.height);
    }];
    
    CGSize annotationSize = [_poem.poet.annotation boundingRectWithSize:CGSizeMake(W - 20, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    self.annotationLabel = [[UILabel alloc] init];
    [_mainScrollView addSubview:_annotationLabel];
    _annotationLabel.text = _poem.poet.annotation;
    NSLog(@"%@", _poem.poet.annotation);
    _annotationLabel.numberOfLines = 0;
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaiti" withLabel:_annotationLabel withSize:18];
    [_annotationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self -> _translationLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(self).offset(-40);
        make.left.mas_equalTo(self).offset(20);
        make.height.mas_equalTo(annotationSize.height);
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
    
    //    _characterNumber = 6;
    _characterImageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"CharacterAnimation%d.jpeg", _characterNumber]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    float suoxiaoBeishu = _characterImageView.image.size.height / hight0;
    left = width / 2 - width / suoxiaoBeishu / 2;
    
    if (_characterNumber == 1) {
        left = left + 200;
    }
    if ((_characterNumber == 3) || (_characterNumber == 4)) {
        left = left + 100;
    }
    if (_characterNumber == 2) {
        left = left + 450;
    }
    
    _characterImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_characterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(hight0));
        //        make.width.equalTo(@(width / suoxiaoBeishu));
        make.bottom.equalTo(self.mainScrollView.mas_top).offset(bottom);
        make.centerX.equalTo(self.mainScrollView.mas_centerX).offset(left -200);
    }];
    
    CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration = 1;
    hight0 = bottom - 0.2807 * hight;
    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(width,hight0)];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(left + width / 2 - 200,hight0)];
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
