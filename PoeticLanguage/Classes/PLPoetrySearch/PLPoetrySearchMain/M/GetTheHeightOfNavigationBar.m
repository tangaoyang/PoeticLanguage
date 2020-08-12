//
//  GetTheHeightOfNavigationBar.m
//  PoeticLanguage
//
//  Created by 蒲悦蓉 on 2020/8/11.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "GetTheHeightOfNavigationBar.h"
#import <sys/utsname.h>//要导入头文件

@implementation GetTheHeightOfNavigationBar

- (NSString *)getCurrentDeviceModel{
   struct utsname systemInfo;
   uname(&systemInfo);
   
   NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([deviceModel isEqualToString:@"iPhone12,8"])   return @"iPhone SE2";
//    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
//    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
//    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
//    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
//    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
//    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
//    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
//    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
//    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
//    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
//    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
//    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
//    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
//    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
//    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
//    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
//    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
//    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
//    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
//    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
//    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
//    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
//    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
//
//    if ([deviceModel isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
//    if ([deviceModel isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
//    if ([deviceModel isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
//    if ([deviceModel isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
//
//    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
//    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceModel;
}

- (NSMutableDictionary*)getTheHeightOfNavigationBar {
    NSString *phoneTypeStr = [self getCurrentDeviceModel];
    NSMutableArray *firstArray = [NSMutableArray arrayWithObjects:@"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5 (GSM+CDMA)", @"iPhone 5c (GSM)", @"iPhone 6", @"iPhone 6s", @"iPhone SE", @"iPhone 7", @"iPhone_8", @"iPhone SE2", nil];
    NSMutableArray *secondArray = [NSMutableArray arrayWithObjects:@"iPhone 6 Plus", @"iPhone 6s Plus", @"iPhone 7 Plus", @"iPhone_8_Plus", @"iPhone X", @"iPhone XR", @"iPhone XS", @"iPhone XS Max", @"iPhone 11", @"iPhone 11 Pro", @"iPhone 11 Pro Max", nil];
    if ([firstArray containsObject:phoneTypeStr]) {
        NSMutableDictionary *heightDictionary = [NSMutableDictionary dictionaryWithCapacity:2];
        [heightDictionary setObject:[NSNumber numberWithInt:88] forKey:@"navigationHeight"];
        [heightDictionary setObject:[NSNumber numberWithInt:98] forKey:@"tabbarHeight"];
        return heightDictionary;
    }
    if ([secondArray containsObject:phoneTypeStr]) {
        NSMutableDictionary *heightDictionary = [NSMutableDictionary dictionaryWithCapacity:2];
        [heightDictionary setObject:[NSNumber numberWithInt:132] forKey:@"navigationHeight"];
        [heightDictionary setObject:[NSNumber numberWithInt:147] forKey:@"tabbarHeight"];
        return heightDictionary;
    }
    return nil;
}
@end
