//
//  PLSettingViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLSettingView;

@interface PLSettingViewController : UIViewController
<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

@property (nonatomic, strong) PLSettingView *myView;

@end

NS_ASSUME_NONNULL_END
