//
//  AccessModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccessModel : JSONModel

@property (nonatomic, copy) NSString *access_token;

@end

NS_ASSUME_NONNULL_END
