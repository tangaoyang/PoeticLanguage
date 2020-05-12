//
//  PLKeywordAuthorView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLKeywordAuthorView.h"
#import "PLPoetrySearchTableViewCell.h"
#import "PLPoetrySearchMainModel.h"
#import <Masonry.h>
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLKeywordAuthorView

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        _searchTableView = [[UITableView alloc] init];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        _searchTableView.backgroundColor = [UIColor clearColor];
        [_searchTableView registerClass:[PLPoetrySearchTableViewCell class] forCellReuseIdentifier:@"searchCell"];
        _searchTableView.frame = CGRectMake(W, 0,  W, H);
        
        _authorArray = array;
        NSLog(@"array == %@", array);
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLPoetrySearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    AuthorModel *author = _authorArray[indexPath.row];
    cell.poetLabel.text = author.name;
    cell.timeLabel.text = author.dynasty;
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", author.header]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    cell.photoImageView.image = [UIImage imageWithData:imageData];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _authorArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AuthorModel *author = _authorArray[indexPath.row];
    NSNotification *noti = [NSNotification notificationWithName:@"author" object:self userInfo:@{@"key":author.mid}];
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
