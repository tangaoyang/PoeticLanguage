//
//  PLLoginManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PLLoginModel;
@class PLSettingUpdateModel;
@class PLSettingUpdateHeaderModel;

NS_ASSUME_NONNULL_BEGIN

typedef void (^ErrorBlock)(NSError *error);

typedef void (^LoginModelBlock)(PLLoginModel *loginModel);
typedef void (^UpdateModelBlock)(PLSettingUpdateModel *updateModel);
typedef void (^UpdateHeaderModelBlock)(PLSettingUpdateHeaderModel *updateHeaderModel);

@interface PLLoginManager : NSObject

@property (nonatomic, strong) PLLoginModel *loginMessage;

+ (instancetype)sharedManager;
- (void)getLoginMessage:(LoginModelBlock)successBlock error:(ErrorBlock)errorBlock account:(NSString *)account password:(NSString *)password;
- (void)updateMessage:(UpdateModelBlock)successBlock error:(ErrorBlock)errorBlock name:(NSString *)name signature:(NSString *)signature account:(NSString *)account password:(NSString *)password;
- (void)updateHeaderMessage:(UpdateHeaderModelBlock)successBlock error:(ErrorBlock)errorBlock image:(UIImage *)image file:(NSString *)file account:(NSString *)account password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
