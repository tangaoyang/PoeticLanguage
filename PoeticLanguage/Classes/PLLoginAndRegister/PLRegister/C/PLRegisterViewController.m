
//
//  PLRegisterViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRegisterViewController.h"
#import "PLRegisterView.h"
#import "UnderlineTextField.h"
#import "PLRegisterModel.h"
#import "PLRegisterManager.h"
#define HTTP @"http://118.31.12.175:8081/"

@interface PLRegisterViewController ()

@end

@implementation PLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[PLRegisterView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    [_myView.confirmButton addTarget:self action:@selector(touchConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [_myView.sureButton addTarget:self action:@selector(touchSureButton) forControlEvents:UIControlEventTouchUpInside];
    [_myView.cancelButton addTarget:self action:@selector(touchBackButton) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)touchSureButton {
    /*
    NSString *sureURLStr = [NSString stringWithFormat:@"%@user/register.do?memPhone=%@&code=%@&password=%@", HTTP, _myView.accountTextField.text, _myView.confirmTextFiled.text, _myView.passwordTextField.text];
    NSLog(@"sureURLStr = %@", sureURLStr);
    NSURL *sureURL = [NSURL URLWithString:sureURLStr];
    NSURLRequest *sureURLRequest = [NSURLRequest requestWithURL:sureURL];
    NSURLSession *sureURLSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *sureDataTask = [sureURLSession dataTaskWithRequest:sureURLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error) {
            NSDictionary *getDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"getDic = %@", getDictionary);
            PLRegisterModel *registerModel = [[PLRegisterModel alloc] initWithDictionary:getDictionary error:&error];
            if ([registerModel.msg isEqualToString:@"ok"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"注册成功！您的账号为%@", registerModel.accountNumber] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
                    [self dismissViewControllerAnimated:NO completion:nil];
                }];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            }
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
        }
    }];
    [sureDataTask resume];
     */
    [[PLRegisterManager sharedManager] getRegisterMessage:^(PLRegisterModel * _Nonnull registerModel) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"注册成功！您的账号为%@", registerModel.accountNumber] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
            [self dismissViewControllerAnimated:NO completion:nil];
            if([self -> _accountDelegate respondsToSelector:@selector(pass:)]){
                [self -> _accountDelegate pass:registerModel.accountNumber];
            }
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    } memPhone:_myView.accountTextField.text code:_myView.confirmTextFiled.text password:_myView.passwordTextField.text];
    
}

- (void)touchBackButton {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchConfirmButton {
    NSString *confirmURLStr = [NSString stringWithFormat:@"%@get_code?memPhone=%@", HTTP, _myView.accountTextField.text];
    NSLog(@"confirmURLStr = %@", confirmURLStr);
    NSURL *confirmURL = [NSURL URLWithString:confirmURLStr];
    NSURLRequest *confirmURLRequest = [NSURLRequest requestWithURL:confirmURL];
    NSURLSession *confirmURLSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *confirmDataTask = [confirmURLSession dataTaskWithRequest:confirmURLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error) {
            NSString *returnStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", returnStr);
            if ([returnStr isEqualToString:@"ture"]) {
                [self->_myView.confirmButton setTitle:@"已发送验证码" forState:UIControlStateNormal];
                self->_myView.confirmButton.backgroundColor = [UIColor colorWithRed:20/255 green:20/255 blue:20/255 alpha:1.0];
            }
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请核对手机号！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
        }
    }];
    [confirmDataTask resume];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
