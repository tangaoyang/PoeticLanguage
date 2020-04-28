//
//  PLRegisterViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLRegisterView;

@protocol AccountToLoginDelegate <NSObject> //给登陆界面传账号

- (void)pass:(NSString *)accountString;

@end

@interface PLRegisterViewController : UIViewController

@property (nonatomic, strong) PLRegisterView *myView;
@property id <AccountToLoginDelegate> accountDelegate;

@end

NS_ASSUME_NONNULL_END
