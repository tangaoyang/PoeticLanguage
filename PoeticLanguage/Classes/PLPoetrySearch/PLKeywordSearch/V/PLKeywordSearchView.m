//
//  PLKeywordSearchView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordSearchView.h"
#import "Masonry.h"
#import "PLPoetrySearchTableViewCell.h"
#import "PoetryContent.h"

@implementation PLKeywordSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _searchTableView = [[UITableView alloc] init];
        [self addSubview:_searchTableView];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        _searchTableView.backgroundColor = [UIColor clearColor];
        [_searchTableView registerClass:[PLPoetrySearchTableViewCell class] forCellReuseIdentifier:@"searchCell"];
        [_searchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(50);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-90);
            make.left.and.right.mas_equalTo(self);
        }];
        
        _poetryArray = [[NSMutableArray alloc] init];
        
        PoetryContent *poetry1 = [[PoetryContent alloc] init];
        poetry1.name = @"题龙阳县青草湖";
        poetry1.content = @"醉后不知天在水，满船清梦压星河。";
        poetry1.dynasty = @"晚唐人";
        poetry1.poet = @"唐温如";
        poetry1.imageName = @"pl_ps_tableview_exphoto.jpeg";
        [_poetryArray addObject:poetry1];
        
        PoetryContent *poetry2 = [[PoetryContent alloc] init];
        poetry2.name = @"蝶恋花·阅尽天涯离别苦";
        poetry2.content = @"最是人间留不住，朱颜辞镜花辞树";
        poetry2.dynasty = @"清代";
        poetry2.poet = @"王国维";
        poetry2.imageName = @"pl_ps_tableview_exphoto2.jpeg";
        [_poetryArray addObject:poetry2];
        
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    for (int i = 0; i < _poetryArray.count; i++) {
        PoetryContent *poetry = _poetryArray[i];
        cell.poetLabel.text = poetry.poet;
        cell.contectTextView.text = poetry.content;
        cell.timeLabel.text = poetry.dynasty;
        [cell.photoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", poetry.imageName]]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _poetryArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNotification *noti = [NSNotification notificationWithName:@"poetry" object:self userInfo:@{@"index":_poetryArray[indexPath.section]}];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
