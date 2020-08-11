//
//  SearchRecommandTableViewCell.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/8/10.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "SearchRecommandTableViewCell.h"
#import "Masonry.h"


@implementation SearchRecommandTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _backImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_backImageView];
    
    _poemLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_poemLabel];
            
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor clearColor];
    NSNumber *widthNumber = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width - 10];
    
    _backImageView.frame = CGRectMake(5, ([UIScreen mainScreen].bounds.size.height / 2 - [widthNumber floatValue] / 1.6), [widthNumber floatValue], [widthNumber floatValue] * 1.3);
            _backImageView.contentMode = UIViewContentModeScaleAspectFill;
    _backImageView.image = [UIImage imageNamed:@"recommandBackGround6.JPG"];
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:_backImageView.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake([widthNumber floatValue] / 2, [widthNumber floatValue] / 2)];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    maskLayer.frame = _backImageView.bounds;
    maskLayer.path=maskPath.CGPath;
    _backImageView.layer.mask=maskLayer;
    
    
    _poemLabel.text = @"苏慕遮\n李清照\n燎沉香，消溽暑。\n鸟雀呼晴，侵晓窥檐语。\n叶上初阳干宿雨、水面清圆，一一风荷举。\n故乡遥，何日去。\n家住吴门，久作长安旅。\n五月渔郎相忆否。\n小楫轻舟，梦入芙蓉浦。";
//        poemLabel.numberOfLines = 0;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 20.0f;
    NSDictionary *dic;
    NSAttributedString *attributeStr;
    dic = @{NSFontAttributeName:[UIFont fontWithName:@"TpldKhangXiDict" size:18], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@5.0f};
    attributeStr = [[NSAttributedString alloc] initWithString:_poemLabel.text attributes:dic];
    _poemLabel.attributedText = attributeStr;
    
    [_poemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@(200));
        make.top.equalTo(self.backImageView.mas_top).offset(-100);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    _poemLabel.numberOfLines = 0;
    _poemLabel.adjustsFontSizeToFitWidth = YES;
    _poemLabel.minimumScaleFactor = 18;
    [_poemLabel sizeToFit];
}

@end
