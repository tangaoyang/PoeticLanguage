//
//  PLAboutView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/14.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLAboutView.h"
#import "Masonry.h"

@implementation PLAboutView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentLabel = [[UILabel alloc] init];
        [self addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(50);
            make.bottom.mas_equalTo(self).offset(-50);
        }];
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
