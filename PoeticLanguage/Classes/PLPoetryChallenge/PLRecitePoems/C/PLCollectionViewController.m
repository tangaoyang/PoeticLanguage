
//
//  PLCollectionViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/22.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLCollectionViewController.h"
#import "PLRecitePoemsView.h"
#import "PLPSCellButton.h"
#import "PLKeywordSearchDetailedViewController.h"
#import "PLCollectManager.h"
#import "PLCollectModel.h"
#import "PLSearchManager.h"
#import "PLReciteGetCollectsModel.h"
#import "PLKeywordSearchDetailModel.h"

@interface PLCollectionViewController ()

@end

@implementation PLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonClick:) name:@"buttonClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goPoem:) name:@"recitePoem" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    while ([self.view.subviews lastObject] != nil) {
        [(UIView *)[self.view.subviews lastObject] removeFromSuperview];
    }
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = @"";
    self.tabBarController.tabBar.hidden = NO;
    
    [[PLCollectManager sharedManager] getCollects:^(PLReciteGetCollectsModel * _Nullable getCollectsModel) {
        if ([getCollectsModel.msg isEqualToString:@"ok"]) {
            self.myView = [[PLRecitePoemsView alloc] initWithArray:getCollectsModel.poet];
            self -> _myView.frame = self.view.bounds;
            [self.view addSubview:self -> _myView];
            [self.view addSubview:self -> _myView.reciteTableView];
            self -> _myView.reciteTableView.frame = self.view.bounds;
        } else {
            NSLog(@"getCollectsModel.msg == %@", getCollectsModel.msg);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"getCollectsModel error = %@", error);
    }];
    
}

- (void)buttonClick:(NSNotification *)keyword {
    NSDictionary *getDictionary = keyword.userInfo;
    PLPSCellButton *button = getDictionary[@"button"];
    [[PLCollectManager sharedManager] collectMessage:^(PLCollectModel * _Nullable collectModel) {
        if ([collectModel.msg isEqualToString:@"ok"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"操作成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [self viewWillAppear:NO];
            }];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
        } else {
            NSLog(@"collectModel.msg = %@", collectModel.msg);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"collect error == %@", error);
    } id:[NSString stringWithFormat: @"%ld", (long)button.tag]];
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

- (void)goPoem:(NSNotification *)keyword {
    //    PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
    //    NSDictionary *getDictionary = keyword.userInfo;
    //    detail.keyword = getDictionary[@"key"];
    //    [self.navigationController pushViewController:detail animated:NO];
    NSDictionary *getDictionary = keyword.userInfo;
    [[PLSearchManager sharedManager] getPoet:^(PLKeywordSearchDetailModel * _Nullable searchDetailModel) {
        if ([searchDetailModel.msg isEqualToString:@"ok"]) {
            NSLog(@"model = %@", searchDetailModel);
            PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
            detail.keyword = searchDetailModel.poet;
            detail.content = getDictionary[@"poemContent"];
            [detail setHand];
            [self.navigationController pushViewController:detail animated:NO];
        } else {
            NSLog(@"searchDetailModel.msg == %@", searchDetailModel.msg);
            NSLog(@"getDictionary[@key] = %@", getDictionary[@"key"]);
        }
    } error:^(NSError * _Nullable error) {
        NSLog(@"detailError == %@", error);
    } sid:getDictionary[@"key"]];
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
