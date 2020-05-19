
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
#import "PLRecitePoemsModel.h"
#import "PLReciteGetCollectsModel.h"
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
    
    [httpManager GET:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject == %@", responseObject);
        PLCollectModel *collectModel = [[PLCollectModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(collectModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
}

- (void)rememberMessage:(PLRecitePoemsModelBlock)successBlock error:(ErrorBlock)errorBlock id:(NSString *)cid {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@/collect/remember.do?poetId=%@", HTTP, cid];
    
    [httpManager GET:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLRecitePoemsModel *reciteModel = [[PLRecitePoemsModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(reciteModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)cancelRememberMessage:(PLRecitePoemsModelBlock)successBlock error:(ErrorBlock)errorBlock id:(NSString *)cid {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@/collect/cancelRemember.do?poetId=%@", HTTP, cid];
    
    [httpManager GET:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLRecitePoemsModel *reciteModel = [[PLRecitePoemsModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(reciteModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)getCollects:(PLReciteGetCollectsModelBlock)successBlock error:(ErrorBlock)errorBlock {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@/collect/getCollects.do", HTTP];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLReciteGetCollectsModel *getCollectsModel = [[PLReciteGetCollectsModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(getCollectsModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
