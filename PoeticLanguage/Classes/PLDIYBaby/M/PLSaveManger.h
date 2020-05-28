//
//  PLSaveManger.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLSaveModel.h"
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^addSuitBlock)(PLSaveModel *model);


@interface PLSaveManger : NSObject
+ (instancetype)sharedManger;
- (void)getAddSuitMessage:(addSuitBlock)successBlock lookID:(NSInteger)look hairID:(NSInteger)hair dressID:(NSInteger)dress;
@end

NS_ASSUME_NONNULL_END
