//
//  PLLoginViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLLoginViewController.h"
#import "PLLoginView.h"
#import "UnderlineTextField.h"
#import "PLLoginManager.h"
#import "PLLoginModel.h"
#import "PLMainViewController.h"

@interface PLLoginViewController ()

@end

@implementation PLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myView = [[PLLoginView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    [_myView.loginButton addTarget:self action:@selector(touchLogin) forControlEvents:UIControlEventTouchUpInside];
    [_myView.registerButton addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchLogin {
    [[PLLoginManager sharedManager] getLoginMessage:^(PLLoginModel * _Nonnull loginModel) {
        if ([loginModel.msg isEqualToString:@"ok"]) {
            CurrentUserModel *currentUserModel = loginModel.currentUser;
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:self -> _myView.accountTextField.text forKey:@"accountNumber"];
            [userDefaults setObject:self -> _myView.passwordTextField.text forKey:@"password"];
            [userDefaults setObject:currentUserModel.id forKey:@"id"];
            [userDefaults setObject:currentUserModel.name forKey:@"name"];
            [userDefaults setObject:currentUserModel.phone forKey:@"phone"];
            [userDefaults setObject:currentUserModel.header forKey:@"header"];
            [userDefaults setObject:currentUserModel.signature forKey:@"signature"];
            [userDefaults setObject:currentUserModel.grades forKey:@"grades"];
            [userDefaults synchronize];
            
            [self go];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号与密码不匹配!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                self->_myView.accountTextField.text = @"";
                self->_myView.passwordTextField.text = @"";
            }];
            [alert addAction:sureAction];
            [self presentViewController:alert animated:NO completion:nil];
        }
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    } account:_myView.accountTextField.text password:_myView.passwordTextField.text];
}

- (void)go {
    PLMainViewController *main = [[PLMainViewController alloc] init];
    [self presentViewController:main animated:NO completion:nil];
}

- (void)touchRegister {
    
    PLRegisterViewController *registerViewController = [[PLRegisterViewController alloc] init];
    registerViewController.accountDelegate = self;
    [self presentViewController:registerViewController animated:NO completion:nil];
    
}

- (void)pass:(NSString *)str {
    _myView.accountTextField.text = str;
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
