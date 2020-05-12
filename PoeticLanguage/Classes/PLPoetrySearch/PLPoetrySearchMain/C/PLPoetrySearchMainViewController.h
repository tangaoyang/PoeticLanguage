//
//  PLPoetrySearchMainViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLPoetrySearchMainView;

@interface PLPoetrySearchMainViewController : UIViewController
<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

@property (nonatomic, strong) PLPoetrySearchMainView *myView;
@property (nonatomic, copy) NSString *access_token;

@end

NS_ASSUME_NONNULL_END
