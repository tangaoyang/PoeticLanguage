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

@implementation PLPoetrySearchMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _existTag = 0;
        
        _photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_photoButton];
        [_photoButton setImage:[[UIImage imageNamed:@"pl_ps_camera.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_photoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(40);
            make.left.mas_equalTo(self.mas_left).offset(10);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        
        _searchTextField = [[UITextField alloc] init];
        [self addSubview:_searchTextField];
        //设置placeholder字体居中
        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        _searchTextField.attributedPlaceholder = [NSAttributedString.alloc initWithString:@"搜索"attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
        _searchTextField.delegate = self;
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
        
        _searchTableView = [[UITableView alloc] init];
        [self addSubview:_searchTableView];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        _searchTableView.backgroundColor = [UIColor clearColor];
        [_searchTableView registerClass:[PLPoetrySearchTableViewCell class] forCellReuseIdentifier:@"searchCell"];
        [_searchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self -> _searchTextField.mas_bottom).offset(10);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-90);
            make.left.and.right.mas_equalTo(self);
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
    
    
    NSLog(@"_existTag == %li", (long)_existTag);
//    NSLog(@"_cancelButton.isHidden == %i", _cancelButton.isHidden);
//    if (!_existTag) {
//        _cancelButton.hidden = NO;
//        NSLog(@"_cancelButton.isHidden == %i", _cancelButton.isHidden);
        _existTag = 1;
    
//    }
    if (_searchTextField.text.length >= 0) {
        [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width).offset(-140);
            make.height.mas_equalTo(@(40));
            make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
            make.top.mas_equalTo(self.mas_top).offset(40);
        }];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self -> _searchTextField.mas_right).offset(10);
            make.width.equalTo(@(60));
            make.top.mas_equalTo(self.mas_top).offset(40);
            make.height.mas_equalTo(@(40));
        }];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"str == %@", string);
    if (_searchTextField.text.length > 0) {
        NSLog(@"45sdghfgjkh64");
        [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width).offset(-140);
            make.height.mas_equalTo(@(40));
            make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
            make.top.mas_equalTo(self.mas_top).offset(40);
        }];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self -> _searchTextField.mas_right).offset(10);
            make.width.equalTo(@(60));
            make.top.mas_equalTo(self.mas_top).offset(40);
            make.height.mas_equalTo(@(40));
        }];
    }
    NSLog(@"6546");
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UIAccessibilityTraitNone;
    cell.nameLabel.text = @"唐温如";
    cell.contectTextView.text = @"醉后不知天在水，满船清梦压星河。";
    cell.timeLabel.text = @"晚唐人";
    [cell.photoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pl_ps_tableview_exphoto.jpeg"]]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchTextField endEditing:YES];
    NSLog(@"_existTag == %li", (long)_existTag);
//    _cancelButton.hidden = YES;
    _existTag = 0;
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width).offset(-70);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.mas_top).offset(40);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(0));
        make.top.and.bottom.equalTo(@(0));
    }];
}

@end
