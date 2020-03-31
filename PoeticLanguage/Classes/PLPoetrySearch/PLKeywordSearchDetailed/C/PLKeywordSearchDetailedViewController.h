//
//  PLKeywordSearchDetailedViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PoetryContent;
@class PLKeywordSearchDetailedView;

NS_ASSUME_NONNULL_BEGIN

@interface PLKeywordSearchDetailedViewController : UIViewController

@property (nonatomic, strong) PLKeywordSearchDetailedView *myView;
@property (nonatomic, strong) PoetryContent *keyword;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
