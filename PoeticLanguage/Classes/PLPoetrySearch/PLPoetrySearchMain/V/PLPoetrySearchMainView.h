//
//  PLPoetrySearchMainView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLPoetrySearchMainView : UIView
<UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UITableView *searchTableView;

@end

NS_ASSUME_NONNULL_END
