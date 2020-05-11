//
//  PLSearchManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PLPoetrySearchMainModel;
@class PLKeywordSearchDetailModel;
@class PLKeywordAuthorModel;

typedef void (^ErrorBlock)(NSError * _Nullable error);

typedef void (^SearchMainModelBlock)(PLPoetrySearchMainModel * _Nullable searchMainModel);
typedef void (^SearchDetailModelBlock)(PLKeywordSearchDetailModel * _Nullable searchDetailModel);
typedef void (^KeywordAuthorModelBlock)(PLKeywordAuthorModel * _Nullable authorModel);

NS_ASSUME_NONNULL_BEGIN

@interface PLSearchManager : NSObject

+ (instancetype)sharedManager;
- (void)collectMessage:(SearchMainModelBlock)successBlock error:(ErrorBlock)errorBlock key:(NSString *)key;
- (void)getPoet:(SearchDetailModelBlock)successBlock error:(ErrorBlock)errorBlock sid:(NSString *)sid;
- (void)getAuthor:(KeywordAuthorModelBlock)successBlock error:(ErrorBlock)errorBlock mid:(NSString *)mid;

@end

NS_ASSUME_NONNULL_END
