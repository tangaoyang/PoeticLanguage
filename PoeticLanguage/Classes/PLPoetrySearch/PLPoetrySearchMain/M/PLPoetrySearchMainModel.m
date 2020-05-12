//
//  PLPoetrySearchMainModel.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchMainModel.h"

@implementation AuthorModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation PoetsModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation PLPoetrySearchMainModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
