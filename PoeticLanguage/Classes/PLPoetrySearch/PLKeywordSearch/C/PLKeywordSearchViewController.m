//
//  PLKeywordSearchViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchViewController.h"
#import "PLKeywordSearchDetailedViewController.h"
#import "PoetryContent.h"
#import "PLKeywordSearchView.h"
#import "PLSearchManager.h"
#import "PLPoetrySearchMainModel.h"

@interface PLKeywordSearchViewController ()

@end

@implementation PLKeywordSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBarController.tabBar.hidden = YES;
    UIImage *backImage = [[UIImage imageNamed:@"pl_pc_fly.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.5;
    [self.view insertSubview:backImageView atIndex:0];
    
    [[PLSearchManager sharedManager] collectMessage:^(PLPoetrySearchMainModel * _Nullable searchMainModel) {
        if ([searchMainModel.msg isEqualToString:@"ok"]) {
            self.myView = [[PLKeywordSearchView alloc] init];
            [self.view addSubview:self->_myView];
            self->_myView.frame = self.view.bounds;
            self -> _myView.poetryArray = searchMainModel.poets;
            self -> _myView.authorArray = searchMainModel.author;
            [self->_myView updatePoetAndAuthor];
            NSLog(@"self -> _myView.poetryArray == %lu", (unsigned long)self -> _myView.authorArray.count);
        } else {
            NSLog(@"searchMainModel.msg == %@", searchMainModel.msg);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"search error = %@", error);
    } key:_keyword];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"poetry" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = _keyword;
}

- (void)jumpView:(NSNotification *)keyword {
    PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
    NSDictionary *getDictionary = keyword.userInfo;
    detail.keyword = getDictionary[@"key"];
    [self.navigationController pushViewController:detail animated:NO];
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
