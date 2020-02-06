//
//  ImageModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ListModel

@end

@interface GenderModel : JSONModel

@property (nonatomic, copy) NSString *probability;
@property (nonatomic, copy) NSString *type;

@end

@interface ExpressionModel : JSONModel

@property (nonatomic, copy) NSString *probability;
@property (nonatomic, copy) NSString *type;

@end

@interface ListModel : JSONModel

@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) ExpressionModel *expression;
@property (nonatomic, strong) GenderModel *gender;

@end

@interface ResultModel : JSONModel

@property (nonatomic, strong) NSArray<ListModel> *face_list;

@end

@interface ImageModel : JSONModel

@property (nonatomic, strong) ResultModel *result;

@end

NS_ASSUME_NONNULL_END
