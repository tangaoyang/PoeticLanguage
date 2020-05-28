//
//  PLGetDateModel.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLGetDateModel : NSObject
- (NSString*)getChineseCalendarWithDate:(NSDate *)date;
- (NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;
@end

NS_ASSUME_NONNULL_END
