//
//  ImageManager.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageModel;
@class AccessModel;

typedef void (^ErrorBlock)(NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

typedef void (^ImageModelBlock)(ImageModel *ImageModel);
typedef void (^AccessModelBlock)(AccessModel *AccessModel);


@interface ImageManager : NSObject

@property (nonatomic, strong) AccessModel *access;
@property (nonatomic, strong) NSData *data;

+ (instancetype)sharedManger;
- (void)identification:(ImageModelBlock)successBlock;
- (void)getAccess:(AccessModelBlock)successBlock error:(ErrorBlock)errorBlock;


@end

NS_ASSUME_NONNULL_END
