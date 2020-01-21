//
//  PLPoetrySearchMainViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchMainViewController.h"
#import "PLPoetrySearchMainView.h"
#import "Masonry.h"
#import "PLKeywordSearchViewController.h"

@interface PLPoetrySearchMainViewController ()

@end

@implementation PLPoetrySearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [[UIImage imageNamed:@"pl_ps_background_knot.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.5;
    [self.view insertSubview:backImageView atIndex:0];
    
    _myView = [[PLPoetrySearchMainView alloc] init];
    [self.view addSubview:_myView];
    _myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_myView.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"search" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)jumpView:(NSNotification *)keyword {
    NSLog(@"keyword == %@", keyword);
    NSDictionary *getDictionary = keyword.userInfo;
    PLKeywordSearchViewController *search = [[PLKeywordSearchViewController alloc] init];
    UINavigationController *navSearch = [[UINavigationController alloc] initWithRootViewController:search];
    search.keyword = getDictionary[@"key"];
//    [self presentViewController:navSearch animated:NO completion:nil];
    NSLog(@"%@", self.navigationController);
    [self presentViewController:navSearch animated:NO completion:nil];
}

- (void)cancel {
    
    _myView.searchTextField.text = @"";
    [_myView.searchTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width).offset(-70);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _myView.photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.view.mas_top).offset(40);
    }];
    [_myView.searchTextField endEditing:YES];
    [_myView.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(0));
        make.top.and.bottom.equalTo(@(0));
    }];
    
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