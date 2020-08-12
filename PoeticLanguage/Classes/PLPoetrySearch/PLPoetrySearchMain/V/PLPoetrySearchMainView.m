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
        
        
        _poemMutableArray = [NSMutableArray array];
        [_poemMutableArray addObject:@"清平调·其一\n\n李白\n\n云想衣裳花想容，春风拂槛露华浓。\n\n若非群玉山头见，会向瑶台月下逢。"];
        [_poemMutableArray addObject:@"春夜喜雨\n杜甫\n好雨知时节，当春乃发生。\n随风潜入夜，润物细无声。\n野径云俱黑，江船火独明。\n晓看红湿处，花重锦官城。"];
        [_poemMutableArray addObject:@"雨霖铃\n刘永\n寒蝉凄切，对长亭晚，骤雨初歇。\n都门帐饮无绪，留恋处，兰舟催发。\n执手相看泪眼，竟无语凝噎。\n念去去，千里烟波，暮霭沉沉楚天阔。\n多情自古伤离别，更那堪，冷落清秋节！\n今宵酒醒何处？\n杨柳岸，晓风残月。\n此去经年，应是良辰好景虚设。\n便纵有千种风情，更与何人说？\n"];
        [_poemMutableArray addObject:@"一剪梅·红藕香残玉簟秋\n李清照\n红藕香残玉簟秋，轻解罗裳，独上兰舟。\n云中谁寄锦书来？\n雁字回时，月满西楼。\n花自飘零水自流，一种相思，两处闲愁。\n此情无计可消除，才下眉头，却上心头。"];
        [_poemMutableArray addObject:@"池鹤二首\n白居易\n高竹笼前无伴侣，乱鸡群里有风标。\n低头乍恐丹砂落，晒翅常疑白雪消。\n转觉鸬鹚毛色下，苦嫌鹦鹉语声娇。\n临风一唳思何事，怅望青田云水遥。\n池中此鹤鹤中稀，恐是辽东老令威。\n带雪松枝翘膝胫，放花菱片缀毛衣。\n低回且向林间宿，奋迅终须天外飞。\n若问故巢知处在，主人相恋未能归。"];
        [_poemMutableArray addObject:@"天净沙·秋思\n马致远\n枯藤老树昏鸦，小桥流水人家，古道西风瘦马。\n夕阳西下，断肠人在天涯。"];
        
        
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
    
    searchRecommandCell.poemLabel.text = _poemMutableArray[indexPath.row];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 20.0f;
    NSDictionary *dic;
    NSAttributedString *attributeStr;
    dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:18], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
    attributeStr = [[NSAttributedString alloc] initWithString:searchRecommandCell.poemLabel.text attributes:dic];
    searchRecommandCell.poemLabel.attributedText = attributeStr;
    
    searchRecommandCell.backImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"recommandBackGround%ld.JPG", (long)indexPath.row + 1]];
//    [cell.collectionButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    return searchRecommandCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.searchRecommandTableView.bounds.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
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
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    NSNotification *poem = [NSNotification notificationWithName:@"poem" object:self userInfo:@{@"poem":_poetryArray[indexPath.row]}];
//    [[NSNotificationCenter defaultCenter] postNotification:poem];
}

- (void)collect:(PLPSCellButton *) button {
    if ([_plpsCellDelegate respondsToSelector:@selector(passButton:)]) {
        [_plpsCellDelegate passButton:button];
    }
}


@end
