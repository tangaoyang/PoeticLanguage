//
//  PLFaceRecognitionView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLFaceRecognitionModel;

@interface PLFaceRecognitionView : UIView

@property (nonatomic, strong) PLFaceRecognitionModel *poem;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *dynastyLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *translationLabel;
@property (nonatomic, strong) UILabel *annotationLabel;
@property (nonatomic, strong) UIImageView *characterImageView;
@property int characterNumber;
@property int number;

- (void)labelInit;

@end

NS_ASSUME_NONNULL_END
