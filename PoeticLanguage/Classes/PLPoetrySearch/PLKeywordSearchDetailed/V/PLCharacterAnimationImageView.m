//
//  PLCharacterAnimationImageView.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLCharacterAnimationImageView.h"

@implementation PLCharacterAnimationImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
//    self.image = [UIImage imageNamed:@"CharacterAnimation1"];
    [self setMoveAnimation:_moveAnimation];
    
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
