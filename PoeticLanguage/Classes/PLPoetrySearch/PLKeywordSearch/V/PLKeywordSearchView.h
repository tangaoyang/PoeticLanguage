//
//  PLKeywordSearchView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLPoetryChallengeButtonView;
@class PLKeywordPoetView;
@class PLKeywordAuthorView;

@interface PLKeywordSearchView : UIView


@property (nonatomic, strong) NSArray *buttonNamesArray;
@property (nonatomic, strong) UIScrollView *searchScrollView;
@property (nonatomic, strong) PLPoetryChallengeButtonView *buttonView;
@property (nonatomic, strong) PLKeywordPoetView *poetView;
@property (nonatomic, strong) PLKeywordAuthorView *authorView;
@property (nonatomic, strong) NSArray *poetryArray;
@property (nonatomic, strong) NSArray *authorArray;

- (void)updatePoetAndAuthor;

@end

NS_ASSUME_NONNULL_END
