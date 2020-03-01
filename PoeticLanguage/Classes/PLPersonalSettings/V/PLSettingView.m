//
//  PLSettingView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/27.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLSettingView.h"
#import <Masonry.h>
#import "PLSettingTableViewCell.h"
#import "PLSettingPersonalTableViewCell.h"

@implementation PLSettingView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mainTableView = [[UITableView alloc] init];
        [self addSubview:_mainTableView];
        [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(20);
            make.bottom.mas_equalTo(self).offset(-50);
            make.left.and.right.mas_equalTo(self);
        }];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[PLSettingPersonalTableViewCell class] forCellReuseIdentifier:@"personal"];
        [_mainTableView registerClass:[PLSettingTableViewCell class] forCellReuseIdentifier:@"cell"];
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"exit"];
        
        UIView *view = [[UIView alloc] init];
        _mainTableView.tableFooterView = view;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        
        PLSettingPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personal" forIndexPath:indexPath];
        cell.selectionStyle = UIAccessibilityTraitNone;
        
        [cell.personalImageView setImage:[UIImage imageNamed:@"pl_pset_ex_personal.jpg"]];
        
        cell.nameLabel.text = @"月亮";
        cell.nameLabel.font = [UIFont systemFontOfSize:20];
        
        cell.writerLabel.text = @"";
        cell.writerLabel.font = [UIFont systemFontOfSize:12];
        
        cell.contentLabel.text = @"纵拥千千晚星";
        cell.contentLabel.font = [UIFont systemFontOfSize:15];
        
        return cell;
        
    } else if (indexPath.section == 1){
        PLSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UIAccessibilityTraitNone;
        
        NSArray *nameArr = @[@"我收藏的", @"我的等级", @"个人设置", @"关于诗语"];
        cell.nameLabel.text = nameArr[indexPath.row] ;
        cell.nameLabel.font = [UIFont systemFontOfSize:15] ;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img%ld.png", indexPath.row + 2]] ;
        cell.iimageView.image = image ;
        
        return cell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exit" forIndexPath:indexPath];
        cell.selectionStyle = UIAccessibilityTraitNone;
        
        NSArray *nameArr = @[@"切换账号", @"退出登陆"];
        cell.textLabel.text = nameArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else if (section == 1){
        return 4;
    } else {
        return 2;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 130;
    } else if (indexPath.section == 2) {
        return 60;
    } else {
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 1 || section == 2) {
        return @" ";
    } else {
        return @"";
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
