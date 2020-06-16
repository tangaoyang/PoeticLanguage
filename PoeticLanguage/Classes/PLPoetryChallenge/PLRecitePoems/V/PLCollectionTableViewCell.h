//
//  PLCollectionTableViewCell.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/6/16.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLPSCellButton;

@interface PLCollectionTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *poetLabel;
@property (nonatomic, strong) UITextView *contectTextView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) PLPSCellButton *collectionButton;

@end

NS_ASSUME_NONNULL_END
