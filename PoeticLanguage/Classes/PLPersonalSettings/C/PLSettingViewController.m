//
//  PLSettingViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingViewController.h"
#import "PLSettingView.h"

@interface PLSettingViewController ()

@end

@implementation PLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人设置";
    
    self.myView = [[PLSettingView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
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
