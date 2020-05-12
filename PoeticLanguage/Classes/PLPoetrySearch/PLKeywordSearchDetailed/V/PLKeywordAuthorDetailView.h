//
//  PLKeywordAuthorDetailView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AuthorsModel;

@interface PLKeywordAuthorDetailView : UIView

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *historyLabel;
@property (nonatomic, strong) AuthorsModel *author;

- (void)labelInit;

@end

NS_ASSUME_NONNULL_END
