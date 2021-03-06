//
//  PLDIYBabyController.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//
//1792 * 828
//350 200
//610 * 280      2.94

#import <UIKit/UIKit.h>
#import "PLDIYBabyOthersView.h"
#import "PLDIYBabyM.h"
#import "SOZOChromoplast.h"
#import "Masonry.h"
#import "PLSaveModel.h"
#import "PLSaveManger.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLDIYBabyController : UIViewController
<DIYBabyViewDelegate>
@property SOZOChromoplast *chromoplast;

@end

NS_ASSUME_NONNULL_END
