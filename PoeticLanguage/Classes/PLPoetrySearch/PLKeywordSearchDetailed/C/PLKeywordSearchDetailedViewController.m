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
    
    self.myView = [[PLKeywordSearchDetailedView alloc] init];
    _myView.poem = _keyword;
    NSLog(@"keyword == %@", _keyword);
    [_myView labelInit];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
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
