//
//  PLDIYBabyM.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/1/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLDIYBabyM.h"

@implementation PLDIYBabyM

- (void)LoadData {
    _allTypeArray = [[NSMutableArray alloc] init];
    _masonryDictionary = [[NSMutableDictionary alloc] init];
    
    /* 图片名称 */
    NSMutableArray *countArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:2], [NSNumber numberWithInt:8], [NSNumber numberWithInt:5], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:5], nil];
    NSMutableArray *typeArray = [NSMutableArray arrayWithObjects:@"look", @"hair", @"skirt", @"background", @"down", @"shoes", @"decoration", @"background", nil];
    for (int i = 0; i < 8; i++) {
        NSMutableArray *detailArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [countArray[i] intValue]; j++) {
            [detailArray addObject:[NSString stringWithFormat:@"%@%d.jpeg", typeArray[i], j + 1]];
        }
        [_allTypeArray addObject:detailArray];
    }
    
    /* 布局大小 */
    while(1) {
# pragma 头发布局
        NSMutableArray *hairWidthArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat: 0.4 * _width], [NSNumber numberWithFloat:0.8 * _width], nil];
        NSMutableArray *hairHightArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.4 * _width + 20], [NSNumber numberWithFloat:0.928 * _width], nil];
        NSMutableArray *hairLeftArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.19 * _width], [NSNumber numberWithFloat:-0.05 * _width], nil];
        NSMutableArray *hairTopArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.218  * _hight], [NSNumber numberWithFloat:0.19  * _hight], nil];
        NSMutableDictionary *hairDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:hairWidthArray,@"width", hairHightArray, @"hight", hairLeftArray, @"left", hairTopArray, @"top", nil];
        [_masonryDictionary setObject:hairDictionary forKey:@"hair"];
#pragma 服装布局
        NSMutableArray *clothesWidthArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.93 * _width], [NSNumber numberWithFloat:0.95 * _width], [NSNumber numberWithFloat:0.85 * _width], [NSNumber numberWithFloat:1.3 * _width], [NSNumber numberWithFloat:_width], [NSNumber numberWithFloat:1.35 * _width], [NSNumber numberWithFloat:0.55 * _width], [NSNumber numberWithFloat:0.8 * _width], nil];
        NSMutableArray *clothesHightArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:1.33 * _width], [NSNumber numberWithFloat:1.691 * _width], [NSNumber numberWithFloat:1.2631 * _width], [NSNumber numberWithFloat:1.3 * _width], [NSNumber numberWithFloat:1.272 * _width], [NSNumber numberWithFloat:1.35 * _width], [NSNumber numberWithFloat:1.11375 * _width], [NSNumber numberWithFloat:1.2136 * _width], nil];
        NSMutableArray *clothesLeftArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:-0.03 * _width], [NSNumber numberWithFloat:-0.06 * _width], [NSNumber numberWithFloat:0.111 * _width], [NSNumber numberWithFloat:-0.19 * _width], [NSNumber numberWithFloat:-0.128 * _width], [NSNumber numberWithFloat:-0.29 * _width], [NSNumber numberWithFloat:0.08 * _width], [NSNumber numberWithFloat:0.215 * _width], nil];
        NSMutableArray *clothesTopArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:-0.015 * _hight], [NSNumber numberWithFloat:-0.095 * _hight], [NSNumber numberWithFloat:-0.01 * _hight], [NSNumber numberWithFloat:-0.05 * _hight], [NSNumber numberWithFloat:-0.006 * _hight], [NSNumber numberWithFloat:-0.065 * _hight], [NSNumber numberWithFloat:-0.004 * _hight], [NSNumber numberWithFloat:-0.048 * _hight], nil];
        NSMutableDictionary *clothesDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:clothesWidthArray,@"width", clothesHightArray, @"hight", clothesLeftArray, @"left", clothesTopArray, @"top", nil];
        [_masonryDictionary setObject:clothesDictionary forKey:@"clothes"];
        break;
        
    }
}


@end
