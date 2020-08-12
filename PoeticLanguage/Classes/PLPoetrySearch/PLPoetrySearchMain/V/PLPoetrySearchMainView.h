//
//  PLPoetrySearchMainView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class PoetryContent;
@class PLPSCellButton;

@protocol PLPSCellDelegate <NSObject>

- (void)passButton:(PLPSCellButton *) button;

@end

@interface PLPoetrySearchMainView : UIView
<UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UITableView *searchTableView;
@property (nonatomic, strong) NSMutableArray *poetryArray;
@property (nonatomic, strong) NSMutableArray *sizeHeightArray;
@property (nonatomic, strong) UITableView *searchRecommandTableView;
@property (nonatomic, strong) NSMutableDictionary *getHeightDict;
@property (nonatomic, strong) NSMutableArray *poemMutableArray;
@property id <PLPSCellDelegate> plpsCellDelegate;

@end

NS_ASSUME_NONNULL_END
