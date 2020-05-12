//
//  PLRegisterManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PLRegisterModel;

NS_ASSUME_NONNULL_BEGIN

typedef void (^ErrorBlock)(NSError *error);

typedef void (^RegisterModelBlock)(PLRegisterModel *registerModel);

@interface PLRegisterManager : NSObject

@property (nonatomic, strong) PLRegisterModel *registerMessage;

+ (instancetype)sharedManager;
- (void)getRegisterMessage:(RegisterModelBlock)successBlock error:(ErrorBlock)errorBlock memPhone:(NSString *)memPhone code:(NSString *)code password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
