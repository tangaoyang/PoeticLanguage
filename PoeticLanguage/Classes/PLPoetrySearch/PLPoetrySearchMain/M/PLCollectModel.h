//
//  PLCollectModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/13.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *poetId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *isCanceled;

@end

@interface PLCollectModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) InfoModel *info;

@end

NS_ASSUME_NONNULL_END
