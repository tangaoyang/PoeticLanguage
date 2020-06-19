//
//  PLLoginManager.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/4/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLLoginManager.h"
#import "PLLoginModel.h"
#import <AFNetworking.h>
#import "JSONModel.h"
#import "PLSettingUpdateModel.h"
#import "PLSettingUpdateHeaderModel.h"
#define HTTP @"http://118.31.12.175:8081/"

static PLLoginManager *manager = nil;

@implementation PLLoginManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[PLLoginManager alloc] init];
        }
    });
    return manager;
}

- (void)getLoginMessage:(LoginModelBlock)successBlock error:(ErrorBlock)errorBlock account:(NSString *)account password:(NSString *)password {
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PLLoginModel *loginModel = [[PLLoginModel alloc] initWithDictionary:responseObject error:nil];
        successBlock(loginModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)updateMessage:(UpdateModelBlock)successBlock error:(ErrorBlock)errorBlock name:(NSString *)name signature:(NSString *)signature account:(NSString *)account password:(NSString *)password {
    
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        NSString *sureURLStr = [NSString stringWithFormat:@"%@/user/update.do?name=%@&signature=%@", HTTP, name, signature];
        sureURLStr = [sureURLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLSettingUpdateModel *updateModel = [[PLSettingUpdateModel alloc] initWithDictionary:responseObject error:nil];
            successBlock(updateModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
    
}

- (void)updateHeaderMessage:(UpdateHeaderModelBlock)successBlock error:(ErrorBlock)errorBlock image:(UIImage *)image file:(NSString *)file account:(NSString *)account password:(NSString *)password {
    
    AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/login.do?accountNumber=%@&password=%@", HTTP, account, password];
    [httpManager POST:sureURLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) { httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", @"text/javascript,multipart/form-data",nil];
        NSDictionary *paramDict = @{};
        NSString *url = [NSString stringWithFormat:@"%@/user/upload_header.do", HTTP];
        //[manage.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
        httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        httpManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [httpManager POST:url parameters:paramDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmm"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            NSData *imageData = UIImageJPEGRepresentation(image , 0.5);
            [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg"];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            PLSettingUpdateHeaderModel *upLoadModel = [[PLSettingUpdateHeaderModel alloc] initWithData:responseObject error:nil];
            successBlock(upLoadModel);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errorBlock(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ;
    }];
    
    
}

@end
