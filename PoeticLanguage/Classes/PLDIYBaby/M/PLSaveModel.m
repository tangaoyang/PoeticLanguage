//
//  PLSaveModel.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSaveModel.h"

@implementation ClothModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"suitId":@"id"}];
}
@end

@implementation PLSaveModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end
