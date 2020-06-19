//
//  PLSavedSuitModel.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/6/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PLSavedSuitDetailModel
@end

@interface PLSavedSuitDetailModel : JSONModel
@property NSInteger hair;
@property NSInteger face;
@property NSInteger dress;
@end

@interface PLSavedSuitModel : JSONModel
@property NSString *msg;
@property PLSavedSuitDetailModel *cloth;
@end

NS_ASSUME_NONNULL_END
