//
//  PLLoginModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurrentUserModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *accountNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *grades;

@end

@interface PLLoginModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) CurrentUserModel *currentUser;

@end

NS_ASSUME_NONNULL_END
