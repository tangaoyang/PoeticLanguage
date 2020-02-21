//
//  PLKeywordSearchDetailedViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchDetailedViewController.h"
#import "PLKeywordSearchDetailedView.h"
#import "PoetryContent.h"

@interface PLKeywordSearchDetailedViewController ()

@end

@implementation PLKeywordSearchDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [[UIImage imageNamed:@"pl_ps_background_knot.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.3;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.myView = [[PLKeywordSearchDetailedView alloc] init];
    _myView.poem = _keyword;
    int m = 0;  //用于记录换行个数
    NSMutableString *all = [NSMutableString stringWithString:_myView.poem.all];
    for (int i = 0; i < _keyword.all.length; i++) {
        unichar str =   [_keyword.all characterAtIndex:i];
//        NSLog(@"%C",str);
        NSString *str1 = [NSString stringWithFormat:@"%C", str];
        NSLog(@"%@", str1);
        if ([str1 isEqualToString:@"。"]) {
            [all insertString:@"\n" atIndex:i + m + 1];
            m++;
            _myView.number++;
            NSLog(@"add");
        }
    }
    _myView.poem.all = all;
    self.title = _keyword.name;
    [_myView labelInit];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = _keyword.name;
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
