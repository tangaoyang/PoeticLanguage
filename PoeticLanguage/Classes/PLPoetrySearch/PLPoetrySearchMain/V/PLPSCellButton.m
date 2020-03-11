//
//  PLPSCellButton.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPSCellButton.h"

@implementation PLPSCellButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.buttonLabel = [[UILabel alloc] init];
        [self addSubview:_buttonLabel];
        _buttonLabel.textColor = [UIColor blackColor];
        
        self.buttonImageView = [[UIImageView alloc] init];
        [self addSubview:_buttonImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _buttonLabel.frame = CGRectMake(self.bounds.size.height + 5, 0, self.bounds.size.width - self.bounds.size.height, self.bounds.size.height);
    
    _buttonImageView.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
