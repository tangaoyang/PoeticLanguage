//
//  PLKeywordSearchDetailedViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchDetailedViewController.h"
#import "PLKeywordSearchDetailedView.h"
#import "PLKeywordSearchDetailModel.h"
#define W ([UIScreen mainScreen].bounds.size.width)
#define H ([UIScreen mainScreen].bounds.size.height)

@interface PLKeywordSearchDetailedViewController ()

@end

@implementation PLKeywordSearchDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    UIImage *backImage = [[UIImage imageNamed:@"animation1.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.3;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.myView = [[PLKeywordSearchDetailedView alloc] init];
    _myView.poem = _keyword;
    int m = 0;  //用于记录换行个数
    NSMutableString *all = [NSMutableString stringWithString:_keyword.paragraphs];
    for (int i = 0; i < _keyword.paragraphs.length - 1; i++) {
        unichar str =   [_keyword.paragraphs characterAtIndex:i];
        NSString *str1 = [NSString stringWithFormat:@"%C", str];
        unichar str2 = [_keyword.paragraphs characterAtIndex:i + 1];
        NSString *str3 = [NSString stringWithFormat:@"%C", str2];
        if ([str1 isEqualToString:@"。"] && ![str3 isEqualToString:@"\n"]) {
            [all insertString:@"\n" atIndex:i + m + 1];
            m++;
        }
        if ([str1 isEqualToString:@"。"]) {
            _myView.number++;
        }
    }
    NSString *para = [all stringByReplacingOccurrencesOfString:@"\",\"" withString:@""];
    _myView.poem.paragraphs = [para stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    _myView.poem.paragraphs = [_myView.poem.paragraphs stringByReplacingOccurrencesOfString:@"[" withString:@""];
    _myView.poem.paragraphs = [_myView.poem.paragraphs stringByReplacingOccurrencesOfString:@"]" withString:@""];
    self.title = _keyword.title;
    _myView.content = _content;
    [_myView labelInit];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = _keyword.title;
}

- (void)setHand {
    //原生方法无效
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    //设置手势
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(openMenuClick)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
}

- (void)openMenuClick {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"恭喜，您已完成这篇诗词的背诵！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:NO completion:nil];
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
