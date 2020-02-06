//
//  PLPhotoRecogitionView.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/2/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPhotoRecogitionView.h"
#import <Masonry.h>
#import "ChangeFontTay.h"

@implementation PLPhotoRecogitionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        self.frame = self.bounds;
        
        self.contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        _contentView.layer.cornerRadius = 10;
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(180));
            make.left.and.right.and.bottom.mas_equalTo(self);
        }];
        
        self.tableView = [[UITableView alloc] init];
        [_contentView addSubview:_tableView];
        _tableView.layer.cornerRadius = 10;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(180));
            make.left.and.right.and.bottom.mas_equalTo(self);
        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        self.toolNameArray = [[NSArray alloc] init];
        _toolNameArray = @[@"拍摄", @"从相册选择", @"取消"];
        
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _toolNameArray[indexPath.row]];
    [[ChangeFontTay sharedManger] downloadWithFontName:@"STKaitiSC-Regular" withLabel:cell.textLabel withSize:20];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UIAccessibilityTraitNone;
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
    self.pickController = [[UIImagePickerController alloc]init];
    if (indexPath.row == 0) {
        [self useCamera];
    } else if (indexPath.row == 1) {
        [self usePhotoLibrary];
    } else {
        [self dismiss];
    }
}

- (void)useCamera {
    NSNotification *camera = [NSNotification notificationWithName:@"camera" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:camera];
}

- (void)usePhotoLibrary {
    NSNotification *photo = [NSNotification notificationWithName:@"photo" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:photo];
}

- (void)dismiss {
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
