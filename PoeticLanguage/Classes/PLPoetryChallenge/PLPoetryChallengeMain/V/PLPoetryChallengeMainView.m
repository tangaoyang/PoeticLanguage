//

//  PLPoetryChallengeMainView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetryChallengeMainView.h"
#import "PLPoetryChallengeButtonView.h"
#import "PLRecitePoemsView.h"
#import "PLPoetryCompetitionView.h"
#import <Masonry.h>

#import "PoetryContent.h"
#import "ChangeFontTay.h"
#import "PLPoetrySearchTableViewCell.h"

@implementation PLPoetryChallengeMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.buttonNamesArray = @[@"背诗词", @"诗词挑战赛"];
        self.buttonView = [[PLPoetryChallengeButtonView alloc] initWithItems:_buttonNamesArray];
        _buttonView.frame = CGRectMake(0, 35, [UIScreen mainScreen].bounds.size.width, 60);
        for (UIButton *button in _buttonView.buttonsArray) {
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:_buttonView];
        
        self.challengeScrollView = [[UIScrollView alloc] init];
        _challengeScrollView.frame = CGRectMake(0, 95, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 95 - 83);
        _challengeScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height - 95 - 83);
        _challengeScrollView.scrollEnabled = NO;
        _challengeScrollView.pagingEnabled = YES;
        [self addSubview:_challengeScrollView];
        
        self.reciteView = [[PLRecitePoemsView alloc] init];
        [_challengeScrollView addSubview:_reciteView];
        [_challengeScrollView addSubview:_reciteView.reciteTableView];
        _reciteView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height);
        
        self.competitionView = [[PLPoetryCompetitionView alloc] init];
        [_challengeScrollView addSubview:_competitionView];
        [_challengeScrollView addSubview:_competitionView.beginButton];
        [_competitionView.beginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_competitionView.introduceLabel.mas_bottom).offset(30);
            make.right.mas_equalTo(self->_competitionView.introduceLabel).offset(-20);
            make.height.equalTo(@60);
            make.width.mas_equalTo(@150);
        }];
        [_competitionView.beginButton addTarget:self action:@selector(battle) forControlEvents:UIControlEventTouchUpInside];
        _competitionView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height);
        
    }
    return self;
}

- (void)battle {
    NSLog(@"1111");
}

- (void)click: (UIButton *) button {
    [_challengeScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 1000), 0)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
