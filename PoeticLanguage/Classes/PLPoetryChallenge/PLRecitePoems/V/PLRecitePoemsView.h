//
//  PLRecitePoemsView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLRecitePoemsView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) NSMutableArray *poetryArray;
@property (nonatomic, strong) UITableView *reciteTableView;

@end

NS_ASSUME_NONNULL_END
