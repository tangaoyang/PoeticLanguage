//
//  PLSaveManger.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSaveManger.h"

static PLSaveManger *manger;
static NSString *account;
static NSString *password;

@implementation PLSaveManger

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manger) {
            manger = [[PLSaveManger alloc] init];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            account = [userDefaults objectForKey:@"accountNumber"];
            password = [userDefaults objectForKey:@"password"];
        }
    });
    return manger;
}
- (void)getAddSuitMessage:(addSuitBlock)successBlock lookID:(NSInteger)look hairID:(NSInteger)hair dressID:(NSInteger)dress {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"http://118.31.12.175:8081/user/login.do?accountNumber=%@&password=%@", account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = [NSString stringWithFormat:@"http://118.31.12.175:8081//user/addClothes.do?hair=%ld&dress=%ld&background=1&face=%ld", hair, dress, look];
        sureURLStr = [sureURLStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%^{}\"[]|\\<> "].invertedSet];
        [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLSaveModel *saveModel = [[PLSaveModel alloc] initWithDictionary:responseObject error:nil];
            successBlock(saveModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
}

@end
     
