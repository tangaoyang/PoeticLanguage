
//
//  PLPoetryChallengeMainViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetryChallengeMainViewController.h"
#import "PLPoetryChallengeMainView.h"
#import "PLRecitePoemsView.h"
#import "PLPSCellButton.h"
#import "PLKeywordSearchDetailedViewController.h"

@interface PLPoetryChallengeMainViewController ()

@end

@implementation PLPoetryChallengeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[PLPoetryChallengeMainView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonClick:) name:@"buttonClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goPoem:) name:@"recitePoem" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.topItem.title = @"";
    self.tabBarController.tabBar.hidden = NO;
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

- (void)goPoem:(NSNotification *)keyword {
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
