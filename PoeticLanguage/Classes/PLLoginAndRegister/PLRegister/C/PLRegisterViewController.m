
//
//  PLRegisterViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRegisterViewController.h"
#import "PLRegisterView.h"

@interface PLRegisterViewController ()

@end

@implementation PLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[PLRegisterView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    [_myView.sureButton addTarget:self action:@selector(touchSureButton) forControlEvents:UIControlEventTouchUpInside];
    [_myView.cancelButton addTarget:self action:@selector(touchBackButton) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)touchSureButton {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已成功注册！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:NO completion:nil];
}

- (void)touchBackButton {
    [self dismissViewControllerAnimated:NO completion:nil];
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
