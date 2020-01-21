//
//  PLKeywordSearchViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLKeywordSearchView;

NS_ASSUME_NONNULL_BEGIN

@interface PLKeywordSearchViewController : UIViewController

@property (nonatomic, strong) PLKeywordSearchView *myView;
@property (nonatomic, strong) NSString *keyword;

@end

NS_ASSUME_NONNULL_END
