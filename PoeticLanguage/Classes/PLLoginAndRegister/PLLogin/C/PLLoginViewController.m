//
//  PLLoginViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/19.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLLoginViewController.h"
#import "PLRegisterViewController.h"
#import "PLLoginView.h"
#import "PLPoetrySearchMainViewController.h"
#import "PLDIYBabyController.h"

@interface PLLoginViewController ()

@end

@implementation PLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myView = [[PLLoginView alloc] init];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    [_myView.loginButton addTarget:self action:@selector(touchLogin) forControlEvents:UIControlEventTouchUpInside];
    [_myView.registerButton addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchLogin {
    PLPoetrySearchMainViewController *search = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:search];
    searchNav.title = @"每日分享";
    [searchNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset1;
    offset1.horizontal = 2;
    offset1.vertical = 13;
    [searchNav.tabBarItem setTitlePositionAdjustment:offset1];
    searchNav.tabBarItem.image = [[UIImage imageNamed:@"pl_ds_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"pl_ds_tabbar_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PLPoetrySearchMainViewController *search2 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav2 = [[UINavigationController alloc] initWithRootViewController:search2];
    searchNav2.title = @"诗词挑战";
    [searchNav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset2;
    offset2.horizontal = 2;
    offset2.vertical = 13;
    [searchNav2.tabBarItem setTitlePositionAdjustment:offset2];
    searchNav2.tabBarItem.image = [[UIImage imageNamed:@"pl_pc_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"pl_pc_tabbar_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PLPoetrySearchMainViewController *search3 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav3 = [[UINavigationController alloc] initWithRootViewController:search3];
    searchNav3.title = @"诗词搜索";
    [searchNav3.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset3;
    offset3.horizontal = 2;
    offset3.vertical = 13;
    [searchNav3.tabBarItem setTitlePositionAdjustment:offset3];
    searchNav3.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav3.tabBarItem.selectedImage = [[UIImage imageNamed:@"pl_ps_tabbar_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PLDIYBabyController *diy = [[PLDIYBabyController alloc] init];
    UINavigationController *diyNav4 = [[UINavigationController alloc] initWithRootViewController:diy];
    diyNav4.title = @"DIY娃娃";
    [diyNav4.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset4;
    offset4.horizontal = 2;
    offset4.vertical = 13;
    [diyNav4.tabBarItem setTitlePositionAdjustment:offset4];
    diyNav4.tabBarItem.image = [[UIImage imageNamed:@"pl_diy_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    diyNav4.tabBarItem.selectedImage = [[UIImage imageNamed:@"pl_diy_tabbar_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PLPoetrySearchMainViewController *search5 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav5 = [[UINavigationController alloc] initWithRootViewController:search5];
    searchNav5.title = @"个人设置";
    [searchNav5.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset5;
    offset5.horizontal = 2;
    offset5.vertical = 13;
    [searchNav5.tabBarItem setTitlePositionAdjustment:offset5];
    searchNav5.tabBarItem.image = [[UIImage imageNamed:@"pl_pset_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav5.tabBarItem.selectedImage = [[UIImage imageNamed:@"pl_pset_tabbar_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *navArr = [NSArray arrayWithObjects:searchNav, searchNav2, searchNav3, diyNav4, searchNav5, nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = navArr;
    tabBarController.view.tintColor = [UIColor colorWithRed:228/255.0 green:20/255.0 blue:20/255.0 alpha:1.0];
    tabBarController.view.backgroundColor = [UIColor whiteColor];
    tabBarController.tabBar.translucent = NO;
    
    self.view.window.rootViewController = tabBarController;
    self.view.window.backgroundColor = [UIColor whiteColor];
}

- (void)touchRegister {
    
    PLRegisterViewController *registerViewController = [[PLRegisterViewController alloc] init];
    [self presentViewController:registerViewController animated:NO completion:nil];
    
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