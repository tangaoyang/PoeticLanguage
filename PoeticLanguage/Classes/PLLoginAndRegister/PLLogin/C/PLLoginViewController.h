//
//  PLLoginViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLRegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class PLLoginView;

@interface PLLoginViewController : UIViewController
<
AccountToLoginDelegate
>

@property (nonatomic, strong) PLLoginView *myView;

@end

NS_ASSUME_NONNULL_END
