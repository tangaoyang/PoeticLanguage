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
    
    for (int i = 0; i < _myView.poetryArray.count; i++) {
        PoetryContent *poetry = [[PoetryContent alloc] init];
        poetry = _myView.poetryArray[i];
        if (![poetry.poet isEqualToString:_keyword]) {
            [_myView.poetryArray removeObjectAtIndex:i];
            NSLog(@"remove");
        }
    }
    [self.view addSubview:_myView];
    _myView.frame = self.view.bounds;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"poetry" object:nil];
}

- (void)jumpView:(PoetryContent *)poetry {
    PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
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
