//
//  ImageManager.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "ImageManager.h"
#import <AFNetworking.h>
#import "ImageModel.h"
#import "JSONModel.h"
#import "AccessModel.h"

static ImageManager *manager = nil;

@implementation ImageManager

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[ImageManager alloc] init];
        }
    });
    return manager;
}

- (void)getAccess:(AccessModelBlock)successBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=Po2OY1lVt9XZie0HUUdfI0FA&client_secret=GBm6fcGewvn346pBLSIaGPwbbolyo9RK" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AccessModel *accessModel = [[AccessModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(accessModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)identification:(ImageModelBlock)successBlock {
    
    NSString *imageBase64 = [_data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString *imageStr = [imageBase64 mutableCopy];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{@"access_token":self.access, @"Content-Type":@"application/json",@"image":imageStr, @"image_type":@"BASE64", @"face_field": @"age,gender,expression"};
    [manager POST:@"https://aip.baidubce.com/rest/2.0/face/v3/detect" parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ImageModel *imageModel = [[ImageModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(imageModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    }];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"change:%@", change);
    if ([keyPath  isEqual: @"access_token"]) {
        self.access = [[change valueForKey:@"new"] mutableCopy];
    }
}

@end
