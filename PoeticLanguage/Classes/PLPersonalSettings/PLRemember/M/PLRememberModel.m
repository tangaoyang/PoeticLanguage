//
//  PLRememberModel.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/20.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRememberModel.h"

@implementation PLRememberModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation RememberPoetsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end
