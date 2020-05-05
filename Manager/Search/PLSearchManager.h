//
//  PLSearchManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PLPoetrySearchMainModel;

typedef void (^ErrorBlock)(NSError * _Nullable error);

typedef void (^SearchMainModelBlock)(PLPoetrySearchMainModel * _Nullable searchMainModel);

NS_ASSUME_NONNULL_BEGIN

@interface PLSearchManager : NSObject

+ (instancetype)sharedManager;
- (void)collectMessage:(SearchMainModelBlock)successBlock error:(ErrorBlock)errorBlock key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
