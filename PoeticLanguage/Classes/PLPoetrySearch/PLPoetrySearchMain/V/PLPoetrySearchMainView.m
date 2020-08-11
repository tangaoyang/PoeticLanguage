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
#import "SearchRecommandTableViewCell.h"
#import "GetTheHeightOfNavigationBar.h"
#import "SearchRecommandTableViewCell.h"

#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

static int choiceForBackImage;

@implementation PLPoetrySearchMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.94f green:0.92f blue:0.91f alpha:1.00f];
//
        
        
        

        
        
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
        
        _searchRecommandTableView = [[UITableView alloc] init];
        [self addSubview:_searchRecommandTableView];
        GetTheHeightOfNavigationBar *getHeightModel = [[GetTheHeightOfNavigationBar alloc] init];
        _getHeightDict = [NSMutableDictionary dictionaryWithCapacity:2];
        _getHeightDict = [getHeightModel getTheHeightOfNavigationBar];
        if (!_getHeightDict) {
            if ([UIScreen mainScreen].bounds.size.width > 390) {
                NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:88], [NSNumber numberWithInt:82], nil] forKeys:[NSArray arrayWithObjects:@"navigationHeight", @"tabbarHeight" , nil]];
                _getHeightDict = dict1;
            } else {
                NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:64], [NSNumber numberWithInt:49], nil] forKeys:[NSArray arrayWithObjects:@"navigationHeight", @"tabbarHeight" , nil]];
                _getHeightDict = dict1;
            }
        }
        _searchRecommandTableView.backgroundColor = [UIColor clearColor];
        [_searchRecommandTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchTextField.mas_bottom);
            make.bottom.equalTo(self.mas_bottom).offset(-[self.getHeightDict[@"navigationHeight"] intValue]);
            make.width.equalTo(self.mas_width);
        }];
        [_searchRecommandTableView registerClass:[SearchRecommandTableViewCell class] forCellReuseIdentifier:@"SearchRecommandCell"];
        _searchRecommandTableView.delegate = self;
        _searchRecommandTableView.dataSource = self;
        _searchRecommandTableView.pagingEnabled = YES;
        
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
    
    SearchRecommandTableViewCell *searchRecommandCell = [_searchRecommandTableView dequeueReusableCellWithIdentifier:@"SearchRecommandCell" forIndexPath:indexPath];
    choiceForBackImage = choiceForBackImage + 3;
    searchRecommandCell.backImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"recommandBackGround%d.JPG", choiceForBackImage % 10]];
//    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return searchRecommandCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.searchRecommandTableView.bounds.size.height;
//    [UIScreen mainScreen].bounds.size.height - self.searchTextField.bounds.size.height - [_getHeightDict[@"tabbarHeight"] intValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
//    NSNotification *poem = [NSNotification notificationWithName:@"poem" object:self userInfo:@{@"poem":_poetryArray[indexPath.row]}];
//    [[NSNotificationCenter defaultCenter] postNotification:poem];
}

- (void)collect:(PLPSCellButton *) button {
    if ([_plpsCellDelegate respondsToSelector:@selector(passButton:)]) {
        [_plpsCellDelegate passButton:button];
    }
}


@end
