//
//  PLKeywordSearchView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchView.h"
#import "PLPoetryChallengeButtonView.h"
#import "ChangeFontTay.h"
#import "PLKeywordPoetView.h"
#import "PLKeywordAuthorView.h"

@implementation PLKeywordSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _poetryArray = [[NSArray alloc] init];
        _authorArray = [[NSArray alloc] init];
        
        self.buttonNamesArray = @[@"诗词", @"诗人"];
        self.buttonView = [[PLPoetryChallengeButtonView alloc] initWithItems:_buttonNamesArray];
        _buttonView.frame = CGRectMake(0, 90, [UIScreen mainScreen].bounds.size.width, 60);
        for (UIButton *button in _buttonView.buttonsArray) {
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:_buttonView];
        
        self.searchScrollView = [[UIScrollView alloc] init];
        _searchScrollView.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 95 - 50);
        _searchScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height - 95 - 83);
        _searchScrollView.scrollEnabled = NO;
        _searchScrollView.pagingEnabled = YES;
        [self addSubview:_searchScrollView];
        
    }
    return self;
}

- (void)click: (UIButton *) button {
    [_searchScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (button.tag - 1000), 0)];
}

- (void)updatePoetAndAuthor {
    self.poetView = [[PLKeywordPoetView alloc] initWithArray:_poetryArray];
    [_searchScrollView addSubview:_poetView];
    [_searchScrollView addSubview:_poetView.searchTableView];
    _poetView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height);
    
    self.authorView = [[PLKeywordAuthorView alloc] initWithArray:_authorArray];
    [_searchScrollView addSubview:_authorView];
    [_searchScrollView addSubview:_authorView.searchTableView];
    _authorView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
