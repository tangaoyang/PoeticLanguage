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

@property PLDIYBabyOthersView *diyView;
@property UIScrollView *detailScrollView;
@property NSInteger width;
@property NSInteger hight;
@property NSInteger firstClickBtnTag;
@property UIButton *firstClickBtn;
@property NSInteger tagForChange;
@property UIButton *nowClickedBtn;
@property PLDIYBabyM *model;

@end

@implementation PLDIYBabyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;
    
    self.title = @"DIY娃娃";
    _model = [[PLDIYBabyM alloc] init];
    [_model LoadData];
    
    
    _diyView = [[PLDIYBabyOthersView alloc] initWithFrame:[UIScreen mainScreen].bounds];
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
    
    
    _detailScrollView = [[UIScrollView alloc] init];
    _detailScrollView.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    _detailScrollView.clipsToBounds = YES;
    _detailScrollView.layer.cornerRadius = 5;
    _detailScrollView.scrollEnabled = YES;
    _detailScrollView.bounces = NO;
    
# pragma mark
    _diyView.babyView.lookImageView.image = [UIImage imageNamed:@"look1.png"];
    _diyView.babyView.clothesImageView.image = [UIImage imageNamed:@"skirt1.png"];
    _diyView.babyView.hairImageView.image = [UIImage imageNamed:@"hair1.png"];
    // 340*250  0.888 0.557 0.015 0.03 --
    float width0 = 0.93 * _width;
    float hight0 = 0.557 * _hight;
    float top = 0.015 * _hight;
    float left = 0.03 * _width;
    [_diyView.babyView.clothesImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.diyView.babyView).offset(-left);
        make.top.equalTo(self.diyView.babyView.lookImageView.mas_bottom).offset(-top);
    }];
    width0 = 0.4 * _width;
    hight0 = 0.15 * _hight;
    top = 0.218  * _hight;
    left = 0.19 * _width;
    [_diyView.babyView.hairImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0 + 20));
        make.left.equalTo(self.diyView.babyView).offset(left);
        make.top.equalTo(self.diyView.babyView).offset(top);
    }];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:1], [NSNumber numberWithFloat:2], [NSNumber numberWithFloat:3], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:5], nil];
 //   dictionary
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
}
- (void)PressShowDetailClick:(UIButton *)btn {
    _tagForChange = 0;
    _nowClickedBtn = btn;
    if ([_diyView.clickTime isEqualToString:@"FirstClick"]){
        [_detailScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
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
        
        long scrollViewWidth = scrollViewImageHight * [_model.allTypeArray[btn.tag - 1] count] + [_model.allTypeArray[btn.tag - 1] count] * 10 - (scrollViewImageHight - scrollViewImageHight / 1.75) + 10;
        _detailScrollView.contentSize = CGSizeMake(scrollViewWidth, hight0);
        
        for (int i = 0; i < [_model.allTypeArray[btn.tag - 1] count]; i++) {
            left = scrollViewImageHight * i + 10 * (i + 1);
            if (i == 4) {
                NSLog(@"%d", left);
            }
            UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", _model.allTypeArray[btn.tag - 1][i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.contentMode = UIViewContentModeScaleToFill;
            [btn setImage: image forState:UIControlStateNormal];
            
            [_detailScrollView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(scrollViewImageHight / 1.75));
                make.height.equalTo(@(scrollViewImageHight));
                make.left.equalTo(self.detailScrollView.mas_left).offset(left);
                make.top.equalTo(self.detailScrollView.mas_top).offset(5);
            }];
            btn.tag = ++(_tagForChange);
            [btn addTarget:self action:@selector(PressChange:) forControlEvents:UIControlEventTouchUpInside];
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
            long scrollViewWidth = (btn.tag) * [_model.allTypeArray[btn.tag - 1] count] + (btn.tag + 1) * 10;
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
            for (int i = 0; i < [_model.allTypeArray[btn.tag - 1] count]; i++) {
                left = scrollViewImageHight * i + 10 * (i + 1);
                UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", _model.allTypeArray[btn.tag - 1][i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIButton *choseToChangeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                btn.contentMode = UIViewContentModeScaleToFill;
                [choseToChangeBtn setImage: image forState:UIControlStateNormal];
                
                [_detailScrollView addSubview:choseToChangeBtn];
                [choseToChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(scrollViewImageHight / 1.75));
                    make.height.equalTo(@(scrollViewImageHight));
                    make.left.equalTo(self.detailScrollView.mas_left).offset(left);
                    make.top.equalTo(self.detailScrollView.mas_top).offset(5);
                }];
                choseToChangeBtn.tag = ++(_tagForChange);
                [choseToChangeBtn addTarget:self action:@selector(PressChange:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            _firstClickBtn = btn;
        }
    }
}

- (void)PressChange:(UIButton*)btn {
    if (_nowClickedBtn.tag == 1) {
        _diyView.babyView.lookImageView.image = [UIImage imageNamed:_model.allTypeArray[_nowClickedBtn.tag - 1][btn.tag - 1]];
    }
    if (_nowClickedBtn.tag == 8) {
        _diyView.backgroundImageView.image = [UIImage imageNamed:_model.allTypeArray[_nowClickedBtn.tag - 1][btn.tag - 1]];
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
