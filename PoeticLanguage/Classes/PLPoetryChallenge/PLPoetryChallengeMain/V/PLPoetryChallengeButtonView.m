//
//  PLPoetryChallengeButtonView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetryChallengeButtonView.h"
#import "ChangeFontTay.h"

@implementation PLPoetryChallengeButtonView

- (instancetype)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.items = items;
        self.buttonsArray = [[NSMutableArray alloc] init];
        [self setButtons];
        [self setInitialValue];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.frame) / _items.count; //每个button平均宽度
    CGFloat height = CGRectGetHeight(self.frame); //给定高度
    for (int i = 0; i < _items.count; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:1000 + i];
        if (button != nil) {
            button.frame = CGRectMake(i * width, 0, width, height);
        }
    }
    
    UIView *underLine = [self viewWithTag:UNDERLINETAG];
    CGFloat underLineW = width - 2 * UNDERLINEDISTANCE;
    if (underLine != nil) {
        underLine.frame = CGRectMake(self.selectedIndex * underLineW + UNDERLINEDISTANCE, height - UNDERLINEHEIGHT, underLineW, UNDERLINEHEIGHT);
    }
}

- (void)setButtons {
    int i = 0;
    for (NSString *titleStr in _items) {
        UIButton *button = [[UIButton alloc] init];
        [_buttonsArray addObject:button];
        button.tag = 1000 + i;
        [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:button.titleLabel withSize:20];
        [button setTitle:titleStr forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:44/255.0 green:67/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        i++;
    }
    
    UIView *underLine = [[UIView alloc] init];
    underLine.backgroundColor = [UIColor colorWithRed:211/255.0 green:214/255.0 blue:225/255.0 alpha:1];
    underLine.tag = UNDERLINETAG;
    underLine.layer.cornerRadius = 5;
    [self addSubview:underLine];
}

//设置最开始的地点
- (void)setInitialValue {
    self.selectedIndex = 0;
    [self selectButtonWithIndex:0];
}

- (void)buttonAction:(UIButton *)button {
    NSInteger index = button.tag - 1000;
    if (index == self.selectedIndex)
        return;
    self.selectedIndex = index;
}

#pragma mark - private

- (void)selectButtonWithIndex:(NSInteger)index {
    CGFloat width = CGRectGetWidth(self.frame) / _items.count;
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat underLineW = width - 2 * UNDERLINEDISTANCE;
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        UIView *underLine = [self viewWithTag:UNDERLINETAG];
        if (underLine != nil) {
            underLine.frame = CGRectMake(index * width + UNDERLINEDISTANCE, height - UNDERLINEHEIGHT, underLineW, UNDERLINEHEIGHT);
        }
    } completion:^(BOOL finished) {
        
    }];
}

//调用selectedIndex的setter方法
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (_selectedIndex == selectedIndex)
        return;
    _selectedIndex = selectedIndex;
    [self selectButtonWithIndex:selectedIndex];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
