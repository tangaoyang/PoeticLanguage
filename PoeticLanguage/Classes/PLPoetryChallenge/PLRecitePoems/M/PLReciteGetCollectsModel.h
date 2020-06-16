//
//  PLReciteGetCollectsModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GetPoetsModel <NSObject>

@end

@interface GetPoetsModel : JSONModel

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *paragraphs;
@property (nonatomic, copy) NSString *dynasty;
@property int collected;

@end

@interface PLReciteGetCollectsModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray<GetPoetsModel> *poet;

@end

NS_ASSUME_NONNULL_END
