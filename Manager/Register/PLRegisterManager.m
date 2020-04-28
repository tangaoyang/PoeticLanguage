//
//  PLRegisterManager.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRegisterManager.h"
#import "PLRegisterModel.h"
#import <AFNetworking.h>
#import "JSONModel.h"
#define HTTP @"http://118.31.12.175:8081/"

static PLRegisterManager *manager = nil;

@implementation PLRegisterManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[PLRegisterManager alloc] init];
        }
    });
    return manager;
}

- (void)getRegisterMessage:(RegisterModelBlock)successBlock error:(ErrorBlock)errorBlock memPhone:(NSString *)memPhone code:(NSString *)code password:(NSString *)password {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/register.do?memPhone=%@&code=%@&password=%@", HTTP, memPhone, code, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLRegisterModel *registerModel = [[PLRegisterModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(registerModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
