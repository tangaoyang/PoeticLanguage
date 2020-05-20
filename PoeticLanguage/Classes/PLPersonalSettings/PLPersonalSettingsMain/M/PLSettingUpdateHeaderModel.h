//
//  PLSettingUpdateHeaderModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/4.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLSettingUpdateHeaderModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
