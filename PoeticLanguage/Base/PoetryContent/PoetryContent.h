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

@property (nonatomic, strong) NSString *name;      //诗名
@property (nonatomic, strong) NSString *poet;      //诗人
@property (nonatomic, strong) NSString *content;   //诗相关内容
@property (nonatomic, strong) NSString *all;       //诗所有内容
@property (nonatomic, strong) NSString *dynasty;   //诗人朝代
@property (nonatomic, strong) NSString *imageName; //诗人头像
@property (nonatomic, strong) NSString *poetHistory;   //诗人简介

@end

NS_ASSUME_NONNULL_END
