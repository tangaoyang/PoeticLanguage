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
        poetry1.all = @"西风吹老洞庭波，一夜湘君白发多。醉后不知天在水，满船清梦压星河。";
        poetry1.poetHistory = @"唐珙，字温如，会稽山阴（今浙江绍兴）人。其父南宋义士、词人唐珏在至元中与林景熙等收拾宋陵遗骨，重新安葬，并在上面移植南宋故宫冬青树为标志。珙豪于诗。 生平仅略见于《御选元诗》卷首《姓名爵里》、《元诗选补遗》小传。";
        [_poetryArray addObject:poetry1];
        
        PoetryContent *poetry2 = [[PoetryContent alloc] init];
        poetry2.name = @"蝶恋花·阅尽天涯离别苦";
        poetry2.content = @"最是人间留不住，朱颜辞镜花辞树。";
        poetry2.dynasty = @"清代";
        poetry2.poet = @"王国维";
        poetry2.imageName = @"pl_ps_tableview_exphoto2.jpeg";
        poetry2.all = @"阅尽天涯离别苦，不道归来，零落花如许。花底相看无一语，绿窗春与天俱莫。待把相思灯下诉，一缕新欢，旧恨千千缕。最是人间留不住，朱颜辞镜花辞树。";
        poetry2.poetHistory = @"王国维（1877年12月3日－1927年6月2日），初名国桢，字静安，亦字伯隅，初号礼堂，晚号观堂，又号永观，谥忠悫。汉族，浙江省海宁州（今浙江省嘉兴市海宁）人。王国维是中国近、现代相交时期一位享有国际声誉的著名学者。王国维早年追求新学，接受资产阶级改良主义思想的影响，把西方哲学、美学思想与中国古典哲学、美学相融合，研究哲学与美学，形成了独特的美学思想体系，继而攻词曲戏剧，后又治史学、古文字学、考古学。郭沫若称他为新史学的开山，不止如此，他平生学无专师，自辟户牖，成就卓越，贡献突出，在教育、哲学、文学、戏曲、美学、史学、古文学等方面均有深诣和创新，为中华民族文化宝库留下了广博精深的学术遗产。";
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
    NSNotification *noti = [NSNotification notificationWithName:@"poetry" object:self userInfo:@{@"key":_poetryArray[indexPath.section]}];
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
