//
//  PLSearchManager.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSearchManager.h"
#import "PLPoetrySearchMainModel.h"
#import <AFNetworking.h>
#import "JSONModel.h"
#import "PLKeywordSearchDetailModel.h"
#import "PLKeywordAuthorModel.h"
#define HTTP @"http://118.31.12.175:8081/"

static PLSearchManager *manager = nil;
static NSString *account;
static NSString *password;

@implementation PLSearchManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[PLSearchManager alloc] init];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            account = [userDefaults objectForKey:@"accountNumber"];
            password = [userDefaults objectForKey:@"password"];
        }
    });
    return manager;
}

- (void)collectMessage:(SearchMainModelBlock)successBlock error:(ErrorBlock)errorBlock key:(NSString *)key {
    
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = [NSString stringWithFormat:@"%@/poet/select.do?key=%@", HTTP, key];
        sureURLStr = [sureURLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLPoetrySearchMainModel *searchMainModel = [[PLPoetrySearchMainModel alloc] initWithDictionary:responseObject error:nil];
            successBlock(searchMainModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
}

- (void)getPoet:(SearchDetailModelBlock)successBlock error:(ErrorBlock)errorBlock sid:(NSString *)sid {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = [NSString stringWithFormat:@"%@/poet/get_poet.do?id=%@", HTTP, sid];
        httpManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLKeywordSearchDetailModel *searchDetailModel = [[PLKeywordSearchDetailModel alloc] initWithDictionary:responseObject error:nil];
            successBlock(searchDetailModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
    
}

- (void)getAuthor:(KeywordAuthorModelBlock)successBlock error:(ErrorBlock)errorBlock mid:(NSString *)mid {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = [NSString stringWithFormat:@"%@/poet/get_author.do?id=%@", HTTP, mid];
        [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLKeywordAuthorModel *authorModel = [[PLKeywordAuthorModel alloc] initWithDictionary:responseObject error:nil];
            successBlock(authorModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
}

@end
