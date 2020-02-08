//
//  PLKeywordSearchDetailedView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PoetryContent;

@interface PLKeywordSearchDetailedView : UIView

@property (nonatomic, strong) PoetryContent *poem;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UILabel *mainFirstLabel;
@property (nonatomic, strong) UILabel *mainSecondLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dynastyLabel;
@property (nonatomic, strong) UILabel *allLabel;
@property (nonatomic, strong) UILabel *historyLabel;
@property int number;   //记录句号个数

- (void)labelInit;

@end

NS_ASSUME_NONNULL_END
