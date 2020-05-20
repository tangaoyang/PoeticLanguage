//
//  PLSettingView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/27.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSettingView : UIView
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *mainTableView;

@end

NS_ASSUME_NONNULL_END
