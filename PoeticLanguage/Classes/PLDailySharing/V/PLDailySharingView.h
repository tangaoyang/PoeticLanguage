//
//  PLDailySharingView.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/24.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLDailySharingView : UIView
@property UILabel *titleLabel;
@property UILabel *dynastyLabel;
@property UILabel *authorLabel;
@property UILabel *paragraphLabel;
@property NSInteger juhao; //记录句号出现的位置
@end

NS_ASSUME_NONNULL_END
