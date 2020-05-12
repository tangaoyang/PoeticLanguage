
//
//  PLCollectManager.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/13.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLCollectManager.h"
#import "PLCollectModel.h"
#import <AFNetworking.h>
#import "JSONModel.h"
#define HTTP @"http://118.31.12.175:8081/"

static PLCollectManager *manager = nil;

@implementation PLCollectManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[PLCollectManager alloc] init];
        }
    });
    return manager;
}

- (void)collectMessage:(PLCollectModelBlock)successBlock error:(ErrorBlock)errorBlock id:(NSString *)cid {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@/collect/collect.do?id=%@", HTTP, cid];
    NSLog(@"sureURLStr = %@", sureURLStr);
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLCollectModel *collectModel = [[PLCollectModel alloc] init];
        successBlock(collectModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
