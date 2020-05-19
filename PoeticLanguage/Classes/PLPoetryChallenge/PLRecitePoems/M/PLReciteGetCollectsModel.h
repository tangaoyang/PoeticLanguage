//
//  PLReciteGetCollectsModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PoetsModel : JSONModel

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *paragraphs;
@property (nonatomic, copy) NSString *dynasty;

@end

@interface PLReciteGetCollectsModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) PoetsModel *poet;

@end

NS_ASSUME_NONNULL_END
