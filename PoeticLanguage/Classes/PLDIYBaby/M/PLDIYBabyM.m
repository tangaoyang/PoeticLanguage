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
    
    NSMutableArray *countArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:5], nil];
    NSMutableArray *typeArray = [NSMutableArray arrayWithObjects:@"look", @"hair", @"skirt", @"up", @"down", @"shoes", @"decoration", @"background", nil];
    for (int i = 0; i < 8; i++) {
        NSMutableArray *detailArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [countArray[i] intValue]; j++) {
            [detailArray addObject:[NSString stringWithFormat:@"%@%d.jpeg", typeArray[i], j + 1]];
        }
        [_allTypeArray addObject:detailArray];
    }
}


@end
