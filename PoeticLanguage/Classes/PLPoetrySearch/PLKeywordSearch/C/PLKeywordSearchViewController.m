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
#import "PLKeywordPoetView.h"
#import "PLPSCellButton.h"
#import "PLKeywordSearchDetailModel.h"

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
        } else {
            NSLog(@"searchMainModel.msg == %@", searchMainModel.msg);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"search error = %@", error);
    } key:_keyword];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"poetry" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonClick:) name:@"buttonCollection" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = _keyword;
}

- (void)jumpView:(NSNotification *)keyword {
    NSDictionary *getDictionary = keyword.userInfo;
    [[PLSearchManager sharedManager] getPoet:^(PLKeywordSearchDetailModel * _Nullable searchDetailModel) {
        if ([searchDetailModel.msg isEqualToString:@"ok"]) {
            PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
            detail.keyword = searchDetailModel.poet;
            detail.content = getDictionary[@"poemContent"];
            [self.navigationController pushViewController:detail animated:NO];
        } else {
            NSLog(@"searchMainModel.msg == %@", searchDetailModel.msg);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"detailError == %@", error);
    } id:getDictionary[@"key"]];
    
}

- (void)buttonClick:(NSNotification *)keyword {
    NSDictionary *getDictionary = keyword.userInfo;
    PLPSCellButton *button = getDictionary[@"button"];
    if(button.selected == NO) {
        button.selected = YES;
        [button.buttonImageView setImage:[[UIImage imageNamed:@"pl_ps_collected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        button.buttonLabel.text = @"已收藏";
    } else {
        button.selected = NO;
        [button.buttonImageView setImage:[[UIImage imageNamed:@"pl_ps_uncollect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        button.buttonLabel.text = @"收藏";
    }
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
