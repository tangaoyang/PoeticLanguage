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

@implementation PLPoetrySearchMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _poetryArray = [[NSMutableArray alloc] init];
        PoetryContent *poetry1 = [[PoetryContent alloc] init];
        poetry1.name = @"题龙阳县青草湖";
        poetry1.content = @"醉后不知天在水，满船清梦压星河。";
        poetry1.dynasty = @"晚唐人";
        poetry1.poet = @"唐温如";
        poetry1.imageName = @"pl_ps_tableview_exphoto.jpeg";
        poetry1.all = @"西风吹老洞庭波，一夜湘君白发多。醉后不知天在水，满船清梦压星河。";
        poetry1.poetHistory = @"唐珙，字温如，会稽山阴（今浙江绍兴）人。其父南宋义士、词人唐珏在至元中与林景熙等收拾宋陵遗骨，重新安葬，并在上面移植南宋故宫冬青树为标志。珙豪于诗。 生平仅略见于《御选元诗》卷首《姓名爵里》、《元诗选补遗》小传。";
        [_poetryArray addObject:poetry1];
        
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
    for (int i = 0; i < _poetryArray.count; i++) {
        PoetryContent *poetry = _poetryArray[i];
        cell.poetLabel.text = poetry.poet;
        cell.contectTextView.text = poetry.content;
        cell.timeLabel.text = poetry.dynasty;
        [cell.photoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", poetry.imageName]]];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UIAccessibilityTraitNone;
        [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
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
    NSNotification *poem = [NSNotification notificationWithName:@"poem" object:self userInfo:@{@"poem":_poetryArray[indexPath.section]}];
    [[NSNotificationCenter defaultCenter] postNotification:poem];
}

- (void)collect:(PLPSCellButton *) button {
    if ([_plpsCellDelegate respondsToSelector:@selector(passButton:)]) {
        [_plpsCellDelegate passButton:button];
    }
}


@end
