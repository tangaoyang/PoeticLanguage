//
//  PLDIYBabyM.h
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLDIYBabyM : NSObject

- (void)LoadData;

@property float width;
@property float hight;
@property NSMutableArray *allTypeArray;
@property NSMutableDictionary *masonryDictionary;

@end

NS_ASSUME_NONNULL_END
