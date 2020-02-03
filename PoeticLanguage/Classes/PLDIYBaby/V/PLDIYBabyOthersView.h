//
//  PLDIYBabyView.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLDIYBabyView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DIYBabyViewDelegate <NSObject>

- (void)PressShowDetailClick:(UIButton*)btn;

@end


@interface PLDIYBabyOthersView : UIView
@property UIImageView *backgroundImageView;
@property UIButton *hairButton;
@property UIButton *skirtButton;
@property UIButton *upButton;
@property UIButton *downButton;
@property UIButton *shoesButton;
@property UIButton *lookButton;
@property UIButton *decorationButton;
@property UIButton *backgroundButton;
@property NSString *clickTime;
@property NSInteger needRemake;
@property PLDIYBabyView *babyView;
@property id<DIYBabyViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
