//
//  PLDailySharingManger.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/25.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDailySharingManger.h"

static PLDailySharingManger *manger;

@implementation PLDailySharingManger

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[PLDailySharingManger alloc] init];
        }
    });
    return manger;
}

- (void)postData:(longSuccessful)result {
    NSString *urlString = @"http://118.31.12.175:8081//poet/ran_share.do";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTast = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *nowDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            PLDailySharingModel *model1 = [[PLDailySharingModel alloc] initWithDictionary:nowDictionary error:nil];
            result(model1);
        } else {
            NSLog(@"%@", error);
        }
    }];
    [dataTast resume];
}

@end
