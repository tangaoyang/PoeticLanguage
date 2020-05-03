//
//  PLSettingUpdateModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/4.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *accountNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *grades;

@end

@interface PLSettingUpdateModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) UserModel *user;

@end

NS_ASSUME_NONNULL_END
