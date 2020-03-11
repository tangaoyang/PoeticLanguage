
//
//  PLPoetryChallengeMainViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetryChallengeMainViewController.h"
#import "PLPoetryChallengeMainView.h"

@interface PLPoetryChallengeMainViewController ()

@end

@implementation PLPoetryChallengeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myView = [[PLPoetryChallengeMainView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
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
