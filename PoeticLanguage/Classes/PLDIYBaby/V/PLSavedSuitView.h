//
//  PLSavedSuitView.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/29.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "PLDIYBabyM.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLSavedSuitView : UIView
@property UIImageView *lookImageView;
@property UIImageView *hairImageView;
@property UIImageView *dressImageView;
@property UIImageView *bodyImageView;
@property float scalingMultiple;
@property PLDIYBabyM *model;
@property NSInteger lookId;
@property NSInteger hairId;
@property NSInteger dressId;

@end

NS_ASSUME_NONNULL_END
