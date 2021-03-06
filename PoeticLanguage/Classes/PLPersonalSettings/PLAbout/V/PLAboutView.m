//
//  PLAboutView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/14.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLAboutView.h"
#import "Masonry.h"
#import "ChangeFontTay.h"

@implementation PLAboutView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(100);
            make.height.equalTo(@(100));
        }];
        _nameLabel.text = @"关于诗语";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_nameLabel withSize:35];
        
        self.contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        _contentLabel.numberOfLines = 0;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@50);
            make.right.equalTo(@-50);
            make.top.mas_equalTo(self).offset(130);
            make.bottom.mas_equalTo(self).offset(-50);
        }];
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:_contentLabel withSize:17];
        _contentLabel.text = @" 诗词，作为中华文化的精髓之一，有悠久的历史，也有多样的类型。每一首诗词都以它精简，规整的内容传递着一种思想，一种文化，一种精神……这样的特点也就更加符合当今快时代下人们“碎片化”阅读，“碎片化”学习的特点。 我们的项目致力于用精选的诗词集，优美的设计界面，集中的软件功能，激发起用户学习诗词的兴趣。在这款app中，有大江东去的豪放明快，有低头弄梅的婉眉曲折，也有西窗剪烛的情意深重。诗词之美，时光洗练。精选中国古诗文经典，为你提供一个干净，清新，高效的欣赏空间。致力于创造以语词文化传承为宗旨，以弘扬中华传统诗词之美，促进中华传统文化的传承和发扬，提升现代中国人生活和精神质量为目标的诗词APP";
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
