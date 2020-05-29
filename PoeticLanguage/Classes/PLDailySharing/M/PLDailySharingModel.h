//
//  PLDailySharingModel.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/25.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PLContentModel
@end

@interface PLContentModel : JSONModel
@property NSString *title;
@property NSString *dynasty;
@property NSString *author;
@property NSString *paragraphs;
@end

@interface PLDailySharingModel : JSONModel
@property NSString *msg;
@property PLContentModel *poet;
@end



NS_ASSUME_NONNULL_END
