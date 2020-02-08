//
//  PLKeywordSearchView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLKeywordSearchView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *searchTableView;
@property (nonatomic, strong) NSMutableArray *poetryArray;

@end

NS_ASSUME_NONNULL_END
