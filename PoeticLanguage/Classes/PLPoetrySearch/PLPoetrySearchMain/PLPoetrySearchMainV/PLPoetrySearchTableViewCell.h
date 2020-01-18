//
//  PLPoetrySearchTableViewCell.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/18.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLPoetrySearchTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextView *contectTextView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *photoImageView;

@end

NS_ASSUME_NONNULL_END
