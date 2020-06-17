//
//  PLDIYBabyController.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDIYBabyController.h"

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
@property PLSaveModel *saveModel;
@property NSInteger lookAdded;     //这三个从1开始存
@property NSInteger dressAdded;
@property NSInteger hairAdded;
@end

@implementation PLDIYBabyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _saveModel = [[PLSaveModel alloc] init];
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;
    
    self.title = @"DIY娃娃";
    _model = [[PLDIYBabyM alloc] init];
    _model.width = _width;
    _model.hight = _hight;
    [_model LoadData];
    
    
    _diyView = [[PLDIYBabyOthersView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _diyView.delegate = self;
    [_diyView.lookButton setTitle:@"妆容" forState:UIControlStateNormal];
    [_diyView.hairButton setTitle:@"发型" forState:UIControlStateNormal];
    [_diyView.skirtButton setTitle:@"连衣裙" forState:UIControlStateNormal];
    [_diyView.backgroundButton setTitle:@"背景" forState:UIControlStateNormal];
    [self.view addSubview:_diyView];
    
    
    _detailScrollView = [[UIScrollView alloc] init];
    _detailScrollView.backgroundColor = [UIColor colorWithRed:0.19f green:0.26f blue:0.33f alpha:1.00f];
    _detailScrollView.clipsToBounds = YES;
    _detailScrollView.layer.cornerRadius = 5;
    _detailScrollView.scrollEnabled = YES;
    _detailScrollView.bounces = NO;
    

    _diyView.babyView.lookImageView.image = [UIImage imageNamed:@"look2.jpeg"];
    _diyView.babyView.clothesImageView.image = [UIImage imageNamed:@"skirt2.jpeg"];
    _diyView.babyView.hairImageView.image = [UIImage imageNamed:@"hair2.jpeg"];
    _hairAdded = 2;
    _dressAdded = 2;
    _lookAdded = 2;
    // 340*250  0.888 0.557 0.015 0.03 --
    float width0 = 0.95 * _width;
    float hight0 = 1.691 * _width;
    float left = -0.06 * _width;
    float top = -0.095 * _hight;
    [_diyView.babyView.clothesImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.diyView.babyView).offset(left);
        make.top.equalTo(self.diyView.babyView.lookImageView.mas_bottom).offset(top);
    }];
    width0 = 0.8 * _width;
    hight0 = 0.928 * _width;
    top = 0.19  * _hight;
    left = -0.05 * _width;
    [_diyView.babyView.hairImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.diyView.babyView).offset(left);
        make.top.equalTo(self.diyView.babyView).offset(top);
    }];
    
    
 //   dictionary
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
}
- (void)PressShowDetailClick:(UIButton *)btn {
    _tagForChange = 0;
    _nowClickedBtn = btn;
    if (_nowClickedBtn.tag == 5) {
        [[PLSaveManger sharedManger]getAddSuitMessage:^(PLSaveModel * _Nonnull model) {
            self.saveModel = model;
        } lookID:_lookAdded hairID:_hairAdded dressID:_dressAdded];
        return;
    }
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
            
            if ([_diyView.lookButton.titleLabel.text isEqualToString:@"妆容"]) {
                [_diyView.lookButton setTitle:btn.titleLabel.text forState:UIControlStateNormal] ;
                [btn setTitle:@"妆容" forState:UIControlStateNormal];
            } else {
                if ([btn.titleLabel.text isEqualToString:@"妆容"]) {
                    [btn setTitle:_diyView.lookButton.titleLabel.text forState:UIControlStateNormal];
                    [_diyView.lookButton setTitle:@"妆容" forState:UIControlStateNormal];
                } else {
                    [_firstClickBtn setTitle:_diyView.lookButton.titleLabel.text forState:UIControlStateNormal];
                    [_diyView.lookButton setTitle:btn.titleLabel.text forState:UIControlStateNormal] ;
                    [btn setTitle:@"妆容" forState:UIControlStateNormal];
                }
            }
            
            
            if (![btn.titleLabel.text isEqualToString:@"妆容"]) {
                _firstClickBtn = btn;
            } else {
                btn = _diyView.lookButton;
                _firstClickBtn = _nowClickedBtn;
            }
            
      //      [_diyView addSubview:_detailScrollView];
            long scrollViewWidth = (0.11 *_hight - 10) * [_model.allTypeArray[btn.tag - 1] count] + [_model.allTypeArray[btn.tag - 1] count] * 10 - ((0.11 *_hight - 10) - (0.11 *_hight - 10) / 1.75) + 10;
            _detailScrollView.contentSize = CGSizeMake(scrollViewWidth, hight0);
            [_detailScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
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
            
        }
    }
}

- (void)PressChange:(UIButton*)btn {
    if ((_nowClickedBtn.tag == 1)) {
        _diyView.babyView.lookImageView.image = [UIImage imageNamed:_model.allTypeArray[_nowClickedBtn.tag - 1][btn.tag - 1]];
        _lookAdded = btn.tag;
        return;
        
    }
    if (_nowClickedBtn.tag == 2) {
        _diyView.babyView.hairImageView.image = [UIImage imageNamed:_model.allTypeArray[_nowClickedBtn.tag - 1][btn.tag - 1]];
        _hairAdded = btn.tag;
        [_diyView.babyView.hairImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@([self.model.masonryDictionary[@"hair"][@"width"][btn.tag - 1] floatValue]));
            make.height.equalTo(@([self.model.masonryDictionary[@"hair"][@"hight"][btn.tag - 1] floatValue]));
            make.left.equalTo(self.diyView.babyView).offset([self.model.masonryDictionary[@"hair"][@"left"][btn.tag - 1] floatValue]);
            make.top.equalTo(self.diyView.babyView).offset([self.model.masonryDictionary[@"hair"][@"top"][btn.tag - 1] floatValue]);
        }];
    }
    if (_nowClickedBtn.tag == 3) {
        _diyView.saveButtonColorChange = YES;
        _diyView.babyView.clothesImageView.image = [UIImage imageNamed:_model.allTypeArray[_nowClickedBtn.tag - 1][btn.tag - 1]];
        _dressAdded = btn.tag;
        _chromoplast = [[SOZOChromoplast alloc] initWithImage:_diyView.babyView.clothesImageView.image];
        _diyView.saveButton.backgroundColor = _chromoplast.firstHighlight;
        if (btn.tag == 3) {
            _diyView.saveButtonColorChange = NO;
            _diyView.saveButton.backgroundColor = [UIColor colorWithRed:0.67f green:0.24f blue:0.35f alpha:1.00f];
        }
        if (btn.tag == 5) {
            _diyView.saveButtonColorChange = NO;
            _diyView.saveButton.backgroundColor = [UIColor colorWithRed:0.38f green:0.32f blue:0.33f alpha:1.00f];
        }
        
        [_diyView.babyView.clothesImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@([self.model.masonryDictionary[@"clothes"][@"width"][btn.tag - 1] floatValue]));
            make.height.equalTo(@([self.model.masonryDictionary[@"clothes"][@"hight"][btn.tag - 1] floatValue]));
            make.left.equalTo(self.diyView.babyView).offset([self.model.masonryDictionary[@"clothes"][@"left"][btn.tag - 1] floatValue]);
            make.top.equalTo(self.diyView.babyView.lookImageView.mas_bottom).offset([self.model.masonryDictionary[@"clothes"][@"top"][btn.tag - 1] floatValue]);
        }];
    }
    if (_nowClickedBtn.tag == 4) {
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
/*
 float width0 = 0.9 * _width;
 float hight0 = 1.25 * width0;
 float top = 0.06 * _hight;
 float left = 0.18 * _width;
  || ([_nowClickedBtn.titleLabel.text isEqualToString:@"妆容"])
 */
