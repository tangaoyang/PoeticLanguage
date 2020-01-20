//
//  ViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/15.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "ViewController.h"
#import "PLPoetrySearchMainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(go) withObject:self afterDelay:0];
}
- (void)go {
    PLPoetrySearchMainViewController *search = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:search];
    searchNav.title = @"搜索";
    [searchNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
        //设置title位置偏移
    UIOffset offset1;
    offset1.horizontal = 2;
    offset1.vertical = 13;
    [searchNav.tabBarItem setTitlePositionAdjustment:offset1];
    searchNav.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav.tabBarItem.selectedImage = [UIImage imageNamed:@"pl_ps_tabbar_selected.png"];
        
    PLPoetrySearchMainViewController *search2 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav2 = [[UINavigationController alloc] initWithRootViewController:search2];
    searchNav2.title = @"搜索";
    [searchNav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
        //设置title位置偏移
    UIOffset offset2;
    offset2.horizontal = 2;
    offset2.vertical = 13;
    [searchNav2.tabBarItem setTitlePositionAdjustment:offset2];
    searchNav2.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav2.tabBarItem.selectedImage = [UIImage imageNamed:@"pl_ps_tabbar_selected.png"];
        
    PLPoetrySearchMainViewController *search3 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav3 = [[UINavigationController alloc] initWithRootViewController:search3];
    searchNav3.title = @"搜索";
    [searchNav3.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
        //设置title位置偏移
    UIOffset offset3;
    offset3.horizontal = 2;
    offset3.vertical = 13;
    [searchNav3.tabBarItem setTitlePositionAdjustment:offset3];
    searchNav3.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav3.tabBarItem.selectedImage = [UIImage imageNamed:@"pl_ps_tabbar_selected.png"];
        
    PLPoetrySearchMainViewController *search4 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav4 = [[UINavigationController alloc] initWithRootViewController:search4];
    searchNav4.title = @"搜索";
    [searchNav4.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset4;
    offset4.horizontal = 2;
    offset4.vertical = 13;
    [searchNav4.tabBarItem setTitlePositionAdjustment:offset4];
    searchNav4.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav.tabBarItem.selectedImage = [UIImage imageNamed:@"pl_ps_tabbar_selected.png"];
        
    PLPoetrySearchMainViewController *search5 = [[PLPoetrySearchMainViewController alloc] init];
    UINavigationController *searchNav5 = [[UINavigationController alloc] initWithRootViewController:search5];
    searchNav5.title = @"搜索";
    [searchNav5.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置title位置偏移
    UIOffset offset5;
    offset5.horizontal = 2;
    offset5.vertical = 13;
    [searchNav5.tabBarItem setTitlePositionAdjustment:offset5];
    searchNav5.tabBarItem.image = [[UIImage imageNamed:@"pl_ps_tabbar.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchNav5.tabBarItem.selectedImage = [UIImage imageNamed:@"pl_ps_tabbar_selected.png"];
        
    NSArray *navArr = [NSArray arrayWithObjects:searchNav, searchNav2, searchNav3, searchNav4, searchNav5, nil];
        
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = navArr;
    tabBarController.view.tintColor = [UIColor colorWithRed:0.18 green:0.69 blue:0.33 alpha:1.0];
    tabBarController.view.backgroundColor = [UIColor whiteColor];
    tabBarController.tabBar.translucent = NO;
        
    self.view.window.rootViewController = tabBarController;
}

@end
