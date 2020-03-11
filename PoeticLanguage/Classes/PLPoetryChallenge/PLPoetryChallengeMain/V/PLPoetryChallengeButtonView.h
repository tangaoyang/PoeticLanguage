//
//  PLPoetryChallengeButtonView.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/3/1.
//  Copyright © 2020 cinderella. All rights reserved.
//

#define UNDERLINETAG 2000
#define UNDERLINEDISTANCE 20
#define UNDERLINEHEIGHT 5

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLPoetryChallengeButtonView : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic) NSInteger selectedIndex;

- (instancetype) initWithItems:(NSArray *) items;

@end

NS_ASSUME_NONNULL_END
