//
//  PLDIYBabyController.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDIYBabyController.h"
#import "Masonry.h"

@interface PLDIYBabyController ()
@property PLDIYBabyView *diyView;
@property NSMutableArray *allTypeArray;
@property UIScrollView *detailScrollView;
@property NSInteger width;
@property NSInteger hight;
@property NSInteger firstClickBtnTag;
@property UIButton *firstClickBtn;
@end

@implementation PLDIYBabyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;
    
    self.title = @"diy";
    _diyView = [[PLDIYBabyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _diyView.delegate = self;
    [_diyView.lookButton setTitle:@"妆容" forState:UIControlStateNormal];
    [_diyView.hairButton setTitle:@"发型" forState:UIControlStateNormal];
    [_diyView.skirtButton setTitle:@"连衣裙" forState:UIControlStateNormal];
    [_diyView.upButton setTitle:@"上衣" forState:UIControlStateNormal];
    [_diyView.downButton setTitle:@"下衣" forState:UIControlStateNormal];
    [_diyView.shoesButton setTitle:@"鞋子" forState:UIControlStateNormal];
    [_diyView.decorationButton setTitle:@"装饰" forState:UIControlStateNormal];
    [_diyView.backgroundButton setTitle:@"背景" forState:UIControlStateNormal];
    [self.view addSubview:_diyView];
    _allTypeArray = [[NSMutableArray alloc] init];
    
    /*图片名称*/
    NSMutableArray *countArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:5], nil];
    NSMutableArray *typeArray = [NSMutableArray arrayWithObjects:@"look", @"hair", @"skirt", @"up", @"down", @"shoes", @"decoration", @"background", nil];
    for (int i = 0; i < 8; i++) {
        NSMutableArray *detailArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [countArray[i] intValue]; j++) {
            [detailArray addObject:[NSString stringWithFormat:@"%@%d.jpeg", typeArray[i], j + 1]];
        }
        [_allTypeArray addObject:detailArray];
    }
    
    _detailScrollView = [[UIScrollView alloc] init];
    _detailScrollView.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    _detailScrollView.clipsToBounds = YES;
    _detailScrollView.layer.cornerRadius = 5;
    _detailScrollView.scrollEnabled = YES;
    _detailScrollView.bounces = NO;
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
}
- (void)PressShowDetailClick:(UIButton *)btn {
    if ([_diyView.clickTime isEqualToString:@"FirstClick"]){
        _firstClickBtnTag = btn.tag;
        _firstClickBtn = btn;
        /*改变按钮*/
        [_diyView.lookButton setTitle:btn.titleLabel.text forState:UIControlStateNormal];
        [btn setTitle: @"妆容" forState:UIControlStateNormal];
        int width0 = 0.07 * _width;
        int hight0 = 0.11 *_hight;
        _diyView.needRemake = 0;
        [self.diyView.lookButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.right.equalTo(self.diyView).offset(-30);
            make.top.equalTo(self.diyView).offset(50);
        }];
        _diyView.lookButton.layer.cornerRadius = 5;
        /*scrollView建立*/
       
        [_diyView addSubview:_detailScrollView];
        [_detailScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.diyView.lookButton.mas_top);
            make.right.equalTo(self.diyView.lookButton.mas_left).offset(-10);
            make.height.equalTo(self.diyView.lookButton.mas_height);
            make.left.equalTo(self.diyView.mas_left).offset(10);
        }];
        int scrollViewImageHight;
        scrollViewImageHight = hight0 - 10;
        int left;
        
        long scrollViewWidth = scrollViewImageHight * [_allTypeArray[btn.tag - 1] count] + [_allTypeArray[btn.tag - 1] count] * 10 - (scrollViewImageHight - scrollViewImageHight / 1.75) + 10;
        _detailScrollView.contentSize = CGSizeMake(scrollViewWidth, hight0);
        
        for (int i = 0; i < [_allTypeArray[btn.tag - 1] count]; i++) {
            left = scrollViewImageHight * i + 10 * (i + 1);
            if (i == 4) {
                NSLog(@"%d", left);
            }
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _allTypeArray[btn.tag - 1][i]]]];
            [_detailScrollView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(scrollViewImageHight / 1.75));
                make.height.equalTo(@(scrollViewImageHight));
                make.left.equalTo(self.detailScrollView.mas_left).offset(left);
                make.top.equalTo(self.detailScrollView.mas_top).offset(5);
            }];
        }
        _diyView.clickTime = @"second";
    } else {
        int width0 = 0.187 * _width;
        int hight0 = 0.052 * _hight;
        if (btn.tag == 1) {
            [_detailScrollView removeFromSuperview];
            [_firstClickBtn setTitle:btn.titleLabel.text forState:UIControlStateNormal] ;
            [btn setTitle:@"妆容" forState:UIControlStateNormal];
            _diyView.clickTime = @"FirstClick";
            [_diyView.lookButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(width0));
                make.height.equalTo(@(hight0));
                make.top.equalTo(self.diyView).offset(50);
                make.right.equalTo(self.diyView).offset(-30);
            }];
            _diyView.needRemake = 1;
        } else {
            width0 = 0.07 * _width;
            hight0 = 0.11 *_hight;
            [_detailScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [_firstClickBtn setTitle:_diyView.lookButton.titleLabel.text forState:UIControlStateNormal];
            [_diyView.lookButton setTitle:btn.titleLabel.text forState:UIControlStateNormal] ;
            if (![btn.titleLabel.text isEqualToString:@"妆容"]) {
                [btn setTitle:@"妆容" forState:UIControlStateNormal];
            }
            
            [_diyView addSubview:_detailScrollView];
            long scrollViewWidth = (btn.tag) * [_allTypeArray[btn.tag - 1] count] + (btn.tag + 1) * 10;
            _detailScrollView.contentSize = CGSizeMake(scrollViewWidth, hight0);
            [_detailScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.diyView.lookButton.mas_top);
                make.right.equalTo(self.diyView.lookButton.mas_left).offset(-10);
                make.height.equalTo(self.diyView.lookButton.mas_height);
                make.left.equalTo(self.diyView.mas_left).offset(10);
            }];
        
            int scrollViewImageHight;
            scrollViewImageHight = hight0 - 10;
            int left;
            for (int i = 0; i < [_allTypeArray[btn.tag - 1] count]; i++) {
                left = scrollViewImageHight * i + 10 * (i + 1);
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _allTypeArray[btn.tag - 1][i]]]];
                [_detailScrollView addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(scrollViewImageHight / 1.75));
                    make.height.equalTo(@(scrollViewImageHight));
                    make.left.equalTo(self.detailScrollView.mas_left).offset(left);
                    make.top.equalTo(self.detailScrollView.mas_top).offset(5);
                }];
            }
            _firstClickBtn = btn;
        }
    }
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
