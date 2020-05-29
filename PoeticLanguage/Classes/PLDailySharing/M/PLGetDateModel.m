//
//  PLGetDateModel.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/5/28.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLGetDateModel.h"

@implementation PLGetDateModel

- (NSString*)getChineseCalendarWithDate:(NSDate *)date{
    
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子年", @"乙丑年", @"丙寅年",    @"丁卯年",    @"戊辰年",    @"己巳年",    @"庚午年",    @"辛未年",    @"壬申年",    @"癸酉年",
                             @"甲戌年",    @"乙亥年",    @"丙子年",    @"丁丑年", @"戊寅年",    @"己卯年",    @"庚辰年",    @"辛己年",    @"壬午年",    @"癸未年",
                             @"甲申年",    @"乙酉年",    @"丙戌年",    @"丁亥年",    @"戊子年",    @"己丑年",    @"庚寅年",    @"辛卯年",    @"壬辰年",    @"癸巳年",
                             @"甲午年",    @"乙未年",    @"丙申年",    @"丁酉年",    @"戊戌年",    @"己亥年",    @"庚子年",    @"辛丑年",    @"壬寅年",    @"癸丑年",
                             @"甲辰年",    @"乙巳年",    @"丙午年",    @"丁未年",    @"戊申年",    @"己酉年",    @"庚戌年",    @"辛亥年",    @"壬子年",    @"癸丑年",
                             @"甲寅年",    @"乙卯年",    @"丙辰年",    @"丁巳年",    @"戊午年",    @"己未年",    @"庚申年",    @"辛酉年",    @"壬戌年",    @"癸亥年", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSLog(@"%d_%d_%d  %@",localeComp.year,localeComp.month,localeComp.day, localeComp.date);
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@_%@_%@",y_str,m_str,d_str];
    
    //[localeCalendar release];
    
    return chineseCal_str;
}
- (NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    //NSTimeZone *localTime = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : strFormat];
    
    NSDate *dateTime = [formatter dateFromString:strDate];
    
    return dateTime;
}

@end


