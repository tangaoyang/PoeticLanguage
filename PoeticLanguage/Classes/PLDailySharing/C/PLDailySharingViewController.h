//
//  PLDailySharingViewController.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/24.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLDailySharingView.h"
#import "Masonry.h"
#import "PLDailySharingModel.h"
#import "PLDailySharingManger.h"
#import "PLSavedSuitView.h"
#import "PLSavedSuitModel.h"
#import "PLSavedSuitManger.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLDailySharingViewController : UIViewController

@property NSInteger hairId;
@property PLSavedSuitModel *savedModel;
@property PLSavedSuitDetailModel *clothId;
@end

NS_ASSUME_NONNULL_END
