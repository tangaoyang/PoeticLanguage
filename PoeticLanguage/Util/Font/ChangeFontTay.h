//
//  ChangeFontTay.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangeFontTay : UIView

+ (instancetype)sharedManger;
- (void)downloadWithFontName:(NSString *)fontName withLabel:(UILabel *)label withSize:(int) size;

@end

NS_ASSUME_NONNULL_END
