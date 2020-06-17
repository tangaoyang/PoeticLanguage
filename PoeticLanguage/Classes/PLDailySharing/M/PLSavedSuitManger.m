//
//  PLSavedSuitManger.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/6/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSavedSuitManger.h"

static PLSavedSuitManger *manger;
static NSString *account;
static NSString *password;

@implementation PLSavedSuitManger

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[PLSavedSuitManger alloc] init];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            account = [userDefaults objectForKey:@"accountNumber"];
            password = [userDefaults objectForKey:@"password"];
        }
    });
    return manger;
}

- (void)postData:(getDataSuccessful)result {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"http://118.31.12.175:8081/user/login.do?accountNumber=%@&password=%@", account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = @"http://118.31.12.175:8081/user/getClothes.do?accountNumber=16882430";
        
        [httpManager GET:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"responseObject == %@", responseObject);
            PLSavedSuitModel *savedSuitModel = [[PLSavedSuitModel alloc] initWithDictionary:responseObject error:nil];
            result(savedSuitModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //errorBlock(error);
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}


@end
