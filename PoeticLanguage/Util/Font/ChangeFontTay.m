//
//  ChangeFontTay.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "ChangeFontTay.h"
#import <CoreText/CoreText.h>

static ChangeFontTay *manger = nil;

@implementation ChangeFontTay

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[ChangeFontTay alloc] init];
        }
    });
    return manger;
}

//下载字体
- (void)downloadWithFontName:(NSString *)fontName withLabel:(UILabel *)label withSize:(int) size{
    //用字体的PostScript名字创建一个 dictionary
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName,kCTFontNameAttribute, nil];
    //创建一个字体描述对象 CTFontDescriptorRef
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    //将字体描述对象放到一个NSMutableArray中
    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
    [descs addObject:(__bridge id _Nonnull)desc];
    CFRelease(desc);
    
    __block BOOL errorDuringDownload = NO;
    
    //下载字体
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descs , NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef  _Nonnull progressParameter) {
        double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
        switch (state) {
            case kCTFontDescriptorMatchingDidBegin:
                //字体已经匹配
                
                break;
            case kCTFontDescriptorMatchingWillBeginDownloading:
                //字体开始下载
                
                break;
            case kCTFontDescriptorMatchingDownloading:
                
                NSLog(@" 下载进度 %.0f",progressValue);
                
                break;
            case kCTFontDescriptorMatchingDidFinishDownloading:
                //字体下载完成
                
                break;
            case kCTFontDescriptorMatchingDidFinish:
            {
                //字体已经下载完成
                if (!errorDuringDownload) {
                    NSLog(@"字体%@ 已经下载完成",fontName);
                    dispatch_async( dispatch_get_main_queue(), ^ {
                        // 可以在这里修改 UI 控件的字体
                        label.font = [UIFont fontWithName:fontName size:size];
                        return ;
                    });
                }
                
            }
                break;
            case kCTFontDescriptorMatchingDidFailWithError:
                //下载错误
            {
                NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
                NSString *errorMessage;
                if (error != nil) {
                    errorMessage = [error description];
                } else {
                    errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
                }
                // 设置标志
                errorDuringDownload = YES;
                NSLog(@" 下载错误: %@", errorMessage);
            }
                break;
                
            default:
                break;
        }
        return YES;
    });
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
