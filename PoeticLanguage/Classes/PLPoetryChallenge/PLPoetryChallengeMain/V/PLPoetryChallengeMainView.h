//
//  PLPoetryChallengeMainView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLPoetryChallengeButtonView;
@class PLPoetryCompetitionView;
@class PLRecitePoemsView;

@interface PLPoetryChallengeMainView : UIView

@property (nonatomic, strong) NSArray *buttonNamesArray;
@property (nonatomic, strong) PLPoetryChallengeButtonView *buttonView;
@property (nonatomic, strong) PLPoetryCompetitionView *competitionView;
@property (nonatomic, strong) PLRecitePoemsView *reciteView;
@property (nonatomic, strong) UIScrollView *challengeScrollView;
@property (nonatomic, strong) NSArray *poemArray;

- (void)viewInit;

@end

NS_ASSUME_NONNULL_END
