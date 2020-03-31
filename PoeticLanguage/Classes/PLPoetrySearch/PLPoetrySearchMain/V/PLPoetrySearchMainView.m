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
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@implementation PLPoetrySearchMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.poetryArray = [[NSMutableArray alloc] init];
        self.sizeHeightArray = [[NSMutableArray alloc] init];
        
        PoetryContent *poetry1 = [[PoetryContent alloc] init];
        poetry1.name = @"题龙阳县青草湖";
        poetry1.content = @"醉后不知天在水，满船清梦压星河。";
        poetry1.dynasty = @"晚唐人";
        poetry1.poet = @"唐温如";
        poetry1.imageName = @"pl_ps_tableview_exphoto.jpeg";
        poetry1.all = @"西风吹老洞庭波，一夜湘君白发多。醉后不知天在水，满船清梦压星河。";
        poetry1.poetHistory = @"唐珙，字温如，会稽山阴（今浙江绍兴）人。其父南宋义士、词人唐珏在至元中与林景熙等收拾宋陵遗骨，重新安葬，并在上面移植南宋故宫冬青树为标志。珙豪于诗。 生平仅略见于《御选元诗》卷首《姓名爵里》、《元诗选补遗》小传。";
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:19]};
        //自适应高度
        CGSize size = [poetry1.content boundingRectWithSize:CGSizeMake(W * 0.5, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        [_sizeHeightArray addObject:[NSNumber numberWithFloat:size.width]];
        [_poetryArray addObject:poetry1];
        
        PoetryContent *poetry2 = [[PoetryContent alloc] init];
        poetry2.name = @"蝶恋花·阅尽天涯离别苦";
        poetry2.content = @"最是人间留不住，朱颜辞镜花辞树。";
        poetry2.dynasty = @"清代";
        poetry2.poet = @"王国维";
        poetry2.imageName = @"pl_ps_tableview_exphoto2.jpeg";
        poetry2.all = @"阅尽天涯离别苦，不道归来，零落花如许。花底相看无一语，绿窗春与天俱莫。待把相思灯下诉，一缕新欢，旧恨千千缕。最是人间留不住，朱颜辞镜花辞树。";
        poetry2.poetHistory = @"王国维（1877年12月3日－1927年6月2日），初名国桢，字静安，亦字伯隅，初号礼堂，晚号观堂，又号永观，谥忠悫。汉族，浙江省海宁州（今浙江省嘉兴市海宁）人。王国维是中国近、现代相交时期一位享有国际声誉的著名学者。王国维早年追求新学，接受资产阶级改良主义思想的影响，把西方哲学、美学思想与中国古典哲学、美学相融合，研究哲学与美学，形成了独特的美学思想体系，继而攻词曲戏剧，后又治史学、古文字学、考古学。郭沫若称他为新史学的开山，不止如此，他平生学无专师，自辟户牖，成就卓越，贡献突出，在教育、哲学、文学、戏曲、美学、史学、古文学等方面均有深诣和创新，为中华民族文化宝库留下了广博精深的学术遗产。";
        NSDictionary *attri2 = @{NSFontAttributeName:[UIFont systemFontOfSize:19]};
        //自适应高度
        CGSize size2 = [poetry1.content boundingRectWithSize:CGSizeMake(W * 0.5, H) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        [_sizeHeightArray addObject:[NSNumber numberWithFloat:size2.width]];
        [_poetryArray addObject:poetry2];
        
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
    
    PoetryContent *poetry = _poetryArray[indexPath.row];
    cell.poetLabel.text = poetry.poet;
    cell.contectTextView.text = poetry.content;
    cell.timeLabel.text = poetry.dynasty;
    [cell.photoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", poetry.imageName]]];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UIAccessibilityTraitNone;
    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [_sizeHeightArray[indexPath.row] floatValue];
    return height;
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
    NSNotification *poem = [NSNotification notificationWithName:@"poem" object:self userInfo:@{@"poem":_poetryArray[indexPath.row]}];
    [[NSNotificationCenter defaultCenter] postNotification:poem];
}

- (void)collect:(PLPSCellButton *) button {
    if ([_plpsCellDelegate respondsToSelector:@selector(passButton:)]) {
        [_plpsCellDelegate passButton:button];
    }
}


@end
