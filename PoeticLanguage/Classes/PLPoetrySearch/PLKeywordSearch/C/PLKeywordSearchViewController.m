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

@interface PLKeywordSearchViewController ()

@end

@implementation PLKeywordSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [[UIImage imageNamed:@"pl_ps_background_knot.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.5;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.myView = [[PLKeywordSearchView alloc] init];
    self.title = @"搜索";
    NSUInteger n = _myView.poetryArray.count; //用于记录数组数量，确保循环次数
    int m = 0;  //用于记录删除个数，同于对应数组中的元素
    for (int i = 0; i < n; i++) {
        PoetryContent *poetry = [[PoetryContent alloc] init];
        poetry = _myView.poetryArray[i - m];
        if (![poetry.poet isEqualToString:_keyword]) {
            [_myView.poetryArray removeObjectAtIndex:i - m];
            NSLog(@"remove");
            m++;
        }
    }
    [self.view addSubview:_myView];
    _myView.frame = self.view.bounds;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"poetry" object:nil];
}

- (void)jumpView:(NSNotification *)keyword {
    PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
    NSDictionary *getDictionary = keyword.userInfo;
    
    detail.keyword = getDictionary[@"key"];
    NSLog(@"detail.keyword  == %@\n", detail.keyword );
    [self.navigationController pushViewController:detail animated:NO];
}

- (void)back{
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
