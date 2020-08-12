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
    
    _poemLabel.textAlignment = NSTextAlignmentCenter;
    
    _backImageView.frame = CGRectMake(5, ([UIScreen mainScreen].bounds.size.height / 2 - [widthNumber floatValue] / 1.5), [widthNumber floatValue], [widthNumber floatValue] * 1.3);
            _backImageView.contentMode = UIViewContentModeScaleAspectFill;
//    _backImageView.image = [UIImage imageNamed:@"recommandBackGround6.JPG"];
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:_backImageView.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake([widthNumber floatValue] / 2, [widthNumber floatValue] / 2)];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    maskLayer.frame = _backImageView.bounds;
    maskLayer.path=maskPath.CGPath;
    _backImageView.layer.mask=maskLayer;
    
    

    
    
    
    [_poemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@(200));
        make.top.equalTo(self.backImageView.mas_top).offset(-70);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    _poemLabel.numberOfLines = 0;
    _poemLabel.adjustsFontSizeToFitWidth = YES;
    _poemLabel.minimumScaleFactor = 18;
    [_poemLabel sizeToFit];
}

@end
