//
//  PLFaceRecognitionModel.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaceRecognitionPoetModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *dynasty;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *translation;
@property (nonatomic, copy) NSString *annotation;

@end

@interface PLFaceRecognitionModel : JSONModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) FaceRecognitionPoetModel *poet;

@end

NS_ASSUME_NONNULL_END
