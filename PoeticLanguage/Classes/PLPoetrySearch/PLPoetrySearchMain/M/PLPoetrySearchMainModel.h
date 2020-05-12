//
//  PLPoetrySearchMainModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PoetsModel <NSObject>


@end

@protocol AuthorModel <NSObject>


@end

@interface PoetsModel : JSONModel

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *paragraphs;
@property (nonatomic, copy) NSString *dynasty;

@end

@interface AuthorModel : JSONModel

@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dynasty;
@property (nonatomic, copy) NSString *header;

@end

@interface PLPoetrySearchMainModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray<AuthorModel> *author;
@property (nonatomic, strong) NSArray<PoetsModel> *poets;

@end

NS_ASSUME_NONNULL_END
