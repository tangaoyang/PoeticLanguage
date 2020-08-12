//
//  PLFaceRecogitionViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLFaceRecogitionViewController.h"
#import "PLFaceRecognitionView.h"
#import "PLFaceRecognitionModel.h"

@interface PLFaceRecogitionViewController ()

@end

@implementation PLFaceRecogitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    
    _myView = [[PLFaceRecognitionView alloc] init];
    [self.view addSubview: _myView];
    _myView.frame = self.view.bounds;
    _myView.poem = _myModel;
    int m = 0;  //用于记录换行个数
    NSMutableString *all = [NSMutableString stringWithString:_myModel.poet.content];
    for (int i = 0; i < _myModel.poet.content.length - 1; i++) {
        unichar str =   [_myModel.poet.content characterAtIndex:i];
        NSString *str1 = [NSString stringWithFormat:@"%C", str];
        unichar str2 = [_myModel.poet.content characterAtIndex:i + 1];
        NSString *str3 = [NSString stringWithFormat:@"%C", str2];
        if ([str1 isEqualToString:@"。"] && ![str3 isEqualToString:@"\n"]) {
            [all insertString:@"\n" atIndex:i + m + 1];
            m++;
        }
        if ([str1 isEqualToString:@"。"]) {
            _myView.number++;
        }
    }
    _myModel.poet.content = all;
    
    [_myView labelInit];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.topItem.title = _myModel.poet.title;
    [self.navigationItem.backBarButtonItem setImage:[UIImage imageNamed:@"pl_ps_back_button.png"]];
    [self.navigationItem.backBarButtonItem setTitle:@""];
    
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
