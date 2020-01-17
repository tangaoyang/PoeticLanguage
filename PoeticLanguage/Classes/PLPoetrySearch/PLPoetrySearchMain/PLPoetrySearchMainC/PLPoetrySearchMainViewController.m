//
//  PLPoetrySearchMainViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchMainViewController.h"
#import "PLPoetrySearchMainView.h"

@interface PLPoetrySearchMainViewController ()

@end

@implementation PLPoetrySearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myView = [[PLPoetrySearchMainView alloc] init];
    [self.view addSubview:_myView];
    _myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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
