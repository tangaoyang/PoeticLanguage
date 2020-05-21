
//
//  PLRecitePoemsView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/3.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRecitePoemsView.h"
#import <Masonry.h>
#import "ChangeFontTay.h"
#import "PLPoetrySearchTableViewCell.h"
#import "PLPSCellButton.h"
#import "PLPoetrySearchMainModel.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width


@implementation PLRecitePoemsView

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pl_pc_fly.jpg"]];
        [self insertSubview:backImageView atIndex:0];
        NSLog(@"array = %@", array);
        if (array.count == 0) {
            UILabel *emptyLabel = [[UILabel alloc] init];
            [self addSubview:emptyLabel];
            emptyLabel.text = @"目前还没有收藏的诗词！";
            emptyLabel.textAlignment = NSTextAlignmentCenter;
            [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:emptyLabel withSize:25];
            emptyLabel.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - 95 - 50) / 2 - 30, [UIScreen mainScreen].bounds.size.width, 30);
        } else {
            self.reciteTableView = [[UITableView alloc] init];
            _reciteTableView.delegate = self;
            _reciteTableView.dataSource = self;
            _reciteTableView.backgroundColor = [UIColor clearColor];
            [_reciteTableView registerClass:[PLPoetrySearchTableViewCell class] forCellReuseIdentifier:@"reciteCell"];
            _reciteTableView.frame = CGRectMake(0, 0, W, H - 165);
            
        }
        _poetryArray = array;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"_poetryArray =  %@", _poetryArray);
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reciteCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    PoetsModel *poetry = _poetryArray[indexPath.row];
    cell.poetLabel.text = poetry.author;
    cell.contectTextView.text = [poetry.paragraphs substringWithRange:NSMakeRange(0, poetry.paragraphs.length - 1)];
    cell.timeLabel.text = poetry.dynasty;
    cell.collectionButton.tag = [poetry.sid integerValue];
    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_poetryArray.count == 0) {
        return 150;
    } else {
        PoetsModel *poetry = _poetryArray[indexPath.row];
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
        //自适应高度
        CGSize size = [poetry.paragraphs boundingRectWithSize:CGSizeMake(W * 0.5, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        return size.height + 120;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _poetryArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PoetsModel *poetry = _poetryArray[indexPath.row];
    NSNotification *noti = [NSNotification notificationWithName:@"recitePoem" object:self userInfo:@{@"key":poetry.sid,@"poemContent":poetry.paragraphs}];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}


- (void)collect:(PLPSCellButton *) button {
    NSNotification *buttonNsno = [NSNotification notificationWithName:@"buttonClick" object:self userInfo:@{@"button":button}];
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
