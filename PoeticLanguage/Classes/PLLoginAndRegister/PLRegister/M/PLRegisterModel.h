//
//  PLRegisterModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLRegisterModel : JSONModel

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *accountNumber;

@end

NS_ASSUME_NONNULL_END
