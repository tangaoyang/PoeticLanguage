//
//  PLKeywordAuthorDetailViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLKeywordAuthorDetailView;
@class AuthorsModel;

@interface PLKeywordAuthorDetailViewController : UIViewController

@property (nonatomic, strong) PLKeywordAuthorDetailView *myView;
@property (nonatomic, strong) AuthorsModel *keyword;

@end

NS_ASSUME_NONNULL_END
