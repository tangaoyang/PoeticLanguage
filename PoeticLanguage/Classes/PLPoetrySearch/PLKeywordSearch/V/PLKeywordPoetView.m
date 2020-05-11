//
//  PLKeywordPoetView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordPoetView.h"
#import <Masonry.h>
#import "PLPoetrySearchTableViewCell.h"
#import "PLPoetrySearchMainModel.h"
#import "PLPSCellButton.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLKeywordPoetView

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        _searchTableView = [[UITableView alloc] init];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        _searchTableView.backgroundColor = [UIColor clearColor];
        [_searchTableView registerClass:[PLPoetrySearchTableViewCell class] forCellReuseIdentifier:@"searchCell"];
        _searchTableView.frame = CGRectMake(0, 0, W, H - 142);
        _poetryArray = array;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    PoetsModel *poetry = _poetryArray[indexPath.row];
    cell.poetLabel.text = poetry.author;
    cell.contectTextView.text = [poetry.paragraphs substringWithRange:NSMakeRange(0, poetry.paragraphs.length - 1)];
    cell.timeLabel.text = poetry.dynasty;
    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_poetryArray.count == 0) {
        return 150;
    } else {
        PoetsModel *poetry = _poetryArray[indexPath.row];
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
        NSLog(@"poetry.paragraphs = %@", poetry.paragraphs);
        //自适应高度
        CGSize size = [poetry.paragraphs boundingRectWithSize:CGSizeMake(W * 0.5, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        NSLog(@"size.height == %f", size.height);
        return size.height + 120;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _poetryArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PoetsModel *poetry = _poetryArray[indexPath.row];
    NSNotification *noti = [NSNotification notificationWithName:@"poetry" object:self userInfo:@{@"key":poetry.sid,@"poemContent":poetry.paragraphs}];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

- (void)collect:(PLPSCellButton *) button {
    NSNotification *buttonNsno = [NSNotification notificationWithName:@"buttonCollection" object:self userInfo:@{@"button":button}];
    [[NSNotificationCenter defaultCenter] postNotification:buttonNsno];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
