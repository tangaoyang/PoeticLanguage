//
//  PLRememberView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLRememberView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) NSArray *poetryArray;
@property (nonatomic, strong) UITableView *rememberTableView;
@property (nonatomic, strong) NSMutableArray *sizeHeightArray;

- (instancetype)initWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
