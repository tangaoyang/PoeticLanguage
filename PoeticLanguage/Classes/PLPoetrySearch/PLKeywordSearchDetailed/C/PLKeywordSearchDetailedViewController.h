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
@class PoetModel;

NS_ASSUME_NONNULL_BEGIN

@interface PLKeywordSearchDetailedViewController : UIViewController

@property (nonatomic, strong) PLKeywordSearchDetailedView *myView;
@property (nonatomic, strong) PoetModel *keyword;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, strong) NSString *content;

- (void)setHand;//完成背诵手势

@end

NS_ASSUME_NONNULL_END
