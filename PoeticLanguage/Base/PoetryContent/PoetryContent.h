//
//  PoetryContent.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PoetryContent : NSObject

@property (nonatomic, copy) NSString *name;      //诗名
@property (nonatomic, copy) NSString *poet;      //诗人
@property (nonatomic, copy) NSString *content;   //诗相关内容
@property (nonatomic, copy) NSString *all;       //诗所有内容
@property (nonatomic, copy) NSString *dynasty;   //诗人朝代
@property (nonatomic, copy) NSString *imageName; //诗人头像
@property (nonatomic, copy) NSString *poetHistory;   //诗人简介
@property (nonatomic, copy) NSString *id;      //诗id

@end

NS_ASSUME_NONNULL_END
