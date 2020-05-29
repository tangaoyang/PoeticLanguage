//
//  PLDailySharingManger.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/25.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"
#import "PLDailySharingModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^longSuccessful)(PLDailySharingModel *model);

@interface PLDailySharingManger : JSONModel
+ (instancetype)sharedManger;
- (void)postData:(longSuccessful)result;
@end

NS_ASSUME_NONNULL_END
