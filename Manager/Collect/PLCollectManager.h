//
//  PLCollectManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/13.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PLCollectModel;

typedef void (^ErrorBlock)(NSError * _Nullable error);

typedef void (^PLCollectModelBlock)(PLCollectModel * _Nullable collectModel);

@interface PLCollectManager : NSObject

+ (instancetype)sharedManager;
- (void)collectMessage:(PLCollectModelBlock)successBlock error:(ErrorBlock)errorBlock id:(NSString *)cid;

@end

NS_ASSUME_NONNULL_END
