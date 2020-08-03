//
//  PLPoetrySearchMainView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchMainView.h"
#import "Masonry.h"
#import "PLPoetrySearchTableViewCell.h"
#import "PLKeywordSearchViewController.h"
#import "PoetryContent.h"
#import "PLPSCellButton.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLPoetrySearchMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.94f green:0.92f blue:0.91f alpha:1.00f];
//
        NSNumber *widthNumber = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width - 10];
        NSNumber *centerY = [NSNumber numberWithInt:([UIScreen mainScreen].bounds.size.height) * 0.05];

        UIButton * button =[UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:button];//一定要先添加到视图上
        button.frame = CGRectMake(5, ([UIScreen mainScreen].bounds.size.height / 2 - [widthNumber floatValue] / 2), [widthNumber floatValue], [widthNumber floatValue] * 1.3);
        button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [button setBackgroundImage:[UIImage imageNamed:@"recommandBackGround6.JPG"] forState:UIControlStateNormal];
        UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:button.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake([widthNumber floatValue] / 2, [widthNumber floatValue] / 2)];
        CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
        maskLayer.frame=button.bounds;
        maskLayer.path=maskPath.CGPath;
        button.layer.mask=maskLayer;
        
        UILabel *poemLabel = [[UILabel alloc] init];
        poemLabel.text = @"苏慕遮\n李清照\n燎沉香，消溽暑。\n鸟雀呼晴，侵晓窥檐语。\n叶上初阳干宿雨、水面清圆，一一风荷举。\n故乡遥，何日去。\n家住吴门，久作长安旅。\n五月渔郎相忆否。\n小楫轻舟，梦入芙蓉浦。";
//        poemLabel.numberOfLines = 0;
        [self addSubview:poemLabel];
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        paraStyle.lineSpacing = 20.0f;
        NSDictionary *dic;
        NSAttributedString *attributeStr;
        dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:18], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
        attributeStr = [[NSAttributedString alloc] initWithString:poemLabel.text attributes:dic];
        poemLabel.attributedText = attributeStr;
        
        [poemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@(200));
            make.top.equalTo(button.mas_top).offset(-100);
            make.left.equalTo(self.mas_left).offset(20);
            make.right.equalTo(self.mas_right).offset(-20);
        }];
        poemLabel.numberOfLines = 0;
        poemLabel.adjustsFontSizeToFitWidth = YES;
        poemLabel.minimumScaleFactor = 18;
        [poemLabel sizeToFit];
        
        
        _photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_photoButton];
        [_photoButton setImage:[[UIImage imageNamed:@"pl_ps_camera.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_photoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(43);
            make.left.mas_equalTo(self.mas_left).offset(10);
            make.width.equalTo(@(35));
            make.height.equalTo(@(30));
        }];
        
        _searchTextField = [[UITextField alloc] init];
        [self addSubview:_searchTextField];
        _searchTextField.textAlignment = NSTextAlignmentCenter;
        //设置placeholder字体居中
        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        _searchTextField.attributedPlaceholder = [NSAttributedString.alloc initWithString:@"搜索"attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
        _searchTextField.delegate = self;
        _searchTextField.returnKeyType = UIReturnKeySearch;
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.layer.cornerRadius = 25;
        _searchTextField.layer.borderWidth = 2;
        _searchTextField.keyboardType = UIKeyboardTypeDefault;
        _searchTextField.layer.borderColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1].CGColor;
        [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width).offset(-70);
            make.height.mas_equalTo(@(40));
            make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
            make.top.mas_equalTo(self.mas_top).offset(40);
        }];
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_cancelButton];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        _cancelButton.tintColor = [UIColor whiteColor];
        _cancelButton.layer.masksToBounds = YES;
        _cancelButton.layer.borderWidth = 2;
        _cancelButton.layer.cornerRadius = 15;
        _cancelButton.layer.borderColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1].CGColor;
        
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [_searchTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width).offset(-140);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.mas_top).offset(40);
    }];
    [_cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self -> _searchTextField.mas_right).offset(10);
        make.width.equalTo(@(60));
        make.top.mas_equalTo(self.mas_top).offset(40);
        make.height.mas_equalTo(@(40));
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    
    PoetryContent *poetry = _poetryArray[indexPath.row];
    cell.poetLabel.text = poetry.poet;
    cell.contectTextView.text = poetry.content;
    cell.timeLabel.text = poetry.dynasty;
    [cell.photoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", poetry.imageName]]];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [_sizeHeightArray[indexPath.row] floatValue];
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _poetryArray.count;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _searchTextField.text = @"";
    [_searchTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width).offset(-70);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.mas_top).offset(40);
    }];
    [_searchTextField endEditing:YES];
    [_cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(0));
        make.top.and.bottom.equalTo(@(0));
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSNotification *nsno = [NSNotification notificationWithName:@"search" object:self userInfo:@{@"key":_searchTextField.text}];
    [[NSNotificationCenter defaultCenter] postNotification:nsno];
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNotification *poem = [NSNotification notificationWithName:@"poem" object:self userInfo:@{@"poem":_poetryArray[indexPath.row]}];
    [[NSNotificationCenter defaultCenter] postNotification:poem];
}

- (void)collect:(PLPSCellButton *) button {
    if ([_plpsCellDelegate respondsToSelector:@selector(passButton:)]) {
        [_plpsCellDelegate passButton:button];
    }
}


@end
