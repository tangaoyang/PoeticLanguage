//
//  PLSettingUpdateViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/4.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingUpdateViewController.h"
#import "PLSettingUpdateView.h"
#import "PLLoginManager.h"
#import "PLSettingUpdateModel.h"

@interface PLSettingUpdateViewController ()

@end

@implementation PLSettingUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"修改资料";
    UIBarButtonItem *sure = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(updateSure)];
    self.navigationItem.rightBarButtonItem = sure;
    self.myView = [[PLSettingUpdateView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
}

- (void)updateSure {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[PLLoginManager sharedManager] updateMessage:^(PLSettingUpdateModel * _Nonnull updateModel) {
        if ([updateModel.msg isEqualToString:@"ok"]) {
            UserModel *userModel = updateModel.user;
            [userDefaults setObject:userModel.name forKey:@"name"];
            [userDefaults setObject:userModel.signature forKey:@"signature"];
            [userDefaults synchronize];
        } else {
            NSLog(@"%@", updateModel.msg);
        }
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    } name:_myView.nameTextField.text signature:_myView.contentTextField.text account:[userDefaults objectForKey:@"accountNumber"] password:[userDefaults objectForKey:@"password"]];
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
