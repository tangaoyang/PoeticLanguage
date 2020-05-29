//
//  PLSaveModel.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ClothModel
@end

@interface ClothModel : JSONModel
@property NSInteger id;
@property NSInteger userId;
@property NSInteger hair;
@property NSInteger dress;
@property NSInteger face;
@end

@interface PLSaveModel : JSONModel
@property ClothModel *cloth;
@property NSString *msg;
@end

NS_ASSUME_NONNULL_END
