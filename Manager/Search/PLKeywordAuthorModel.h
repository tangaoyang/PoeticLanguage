//
//  PLKeywordAuthorModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorModel : JSONModel

@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;

@end

@interface PLKeywordAuthorModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) AuthorModel *author;

@end

NS_ASSUME_NONNULL_END
