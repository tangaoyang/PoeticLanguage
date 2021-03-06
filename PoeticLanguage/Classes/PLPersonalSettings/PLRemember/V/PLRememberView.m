//
//  PLRememberView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLRememberView.h"
#import <Masonry.h>
#import "ChangeFontTay.h"
#import "PLCollectionTableViewCell.h"
#import "PLPoetrySearchMainModel.h"
#import "PLPSCellButton.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLRememberView

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"allBackGroundImage.jpg"]];   //pl_pc_fly.jpg
        [self insertSubview:backImageView atIndex:0];
        [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.mas_width);
            make.left.equalTo(self.mas_left).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(-90);
        }];
        NSLog(@"array = %@", array);
        if (array.count == 0) {
            UILabel *emptyLabel = [[UILabel alloc] init];
            [self addSubview:emptyLabel];
            emptyLabel.text = @"目前还没有背过的诗词！";
            emptyLabel.textAlignment = NSTextAlignmentCenter;
            [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:emptyLabel withSize:25];
            emptyLabel.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - 95 - 50) / 2 - 30, [UIScreen mainScreen].bounds.size.width, 30);
        } else {
            self.rememberTableView = [[UITableView alloc] init];
            _rememberTableView.delegate = self;
            _rememberTableView.dataSource = self;
            _rememberTableView.backgroundColor = [UIColor clearColor];
            [_rememberTableView registerClass:[PLCollectionTableViewCell class] forCellReuseIdentifier:@"rememberCell"];
            _rememberTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            [self addSubview:_rememberTableView];
            
            UIView *whiteView = [[UIView alloc] init];
            _rememberTableView.tableFooterView = whiteView;
            
        }
        _poetryArray = array;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rememberCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    PoetsModel *poetry = _poetryArray[indexPath.row];
    cell.poetLabel.text = poetry.author;
    cell.contectTextView.text = [poetry.paragraphs substringWithRange:NSMakeRange(0, poetry.paragraphs.length - 1)];
    cell.timeLabel.text = poetry.dynasty;
//    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", poetry.header]];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
//    cell.photoImageView.image = [UIImage imageWithData:imageData];
    cell.collectionButton.hidden = YES;
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

//tableView自带的左滑删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 定义编辑样式

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
   return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    //这里做删除操作
      PoetsModel *poetry = _poetryArray[indexPath.row];
      NSNotification *deleteNsno = [NSNotification notificationWithName:@"delete" object:self userInfo:@{@"poemId": poetry.sid}];
      [[NSNotificationCenter defaultCenter] postNotification:deleteNsno];
  }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
   return @"删除，加入收藏";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
