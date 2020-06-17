//
//  PLSavedSuitManger.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/6/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLSavedSuitModel.h"
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^getDataSuccessful)(PLSavedSuitModel * _Nullable model);

@interface PLSavedSuitManger : NSObject
+ (instancetype)sharedManger;
- (void)postData:(getDataSuccessful)result;
@end

NS_ASSUME_NONNULL_END
