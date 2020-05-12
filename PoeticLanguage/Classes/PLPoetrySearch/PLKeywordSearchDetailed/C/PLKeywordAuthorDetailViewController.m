//
//  PLKeywordAuthorDetailViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/12.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordAuthorDetailViewController.h"
#import "PLKeywordAuthorDetailView.h"
#import "PLKeywordAuthorModel.h"

@interface PLKeywordAuthorDetailViewController ()

@end

@implementation PLKeywordAuthorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [[UIImage imageNamed:@"animation1.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.3;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.myView = [[PLKeywordAuthorDetailView alloc] init];
    _myView.author = _keyword;
    self.title = _keyword.name;
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
