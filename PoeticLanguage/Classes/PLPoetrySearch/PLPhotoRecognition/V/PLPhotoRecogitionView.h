//
//  PLPhotoRecogitionView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLPhotoRecogitionView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *toolNameArray;

@end

NS_ASSUME_NONNULL_END
