//
//  PhoneDevice.m
//  testMasonary
//
//  Created by NC on 16/10/27.
//  Copyright © 2016年 Bella. All rights reserved.
//

/*
 * iPhone & iPod Touch 第一代、第二代、第三代 320*480 px
 * iPhone4~4S 640*960 px
 * iPhone5~5C~5S 640*1136 px
 * iPhone6 750*1334 px
 * iPhone6 plus物理版 1080*1920 px
 * iPhone6 plus放大版 1125*2001 px
 * iPhone6 plus设计版 1242*2208 px
 */

#import "PhoneDevice.h"
#import <sys/utsname.h>

typedef NS_ENUM(NSInteger, iOS_DeveiceType) {
    iPhone_2G = 0,
    iPhone_3G,
    iPhone_3GS,
    iPhone_4,
    iPhone_4S,
    iPhone_5,
    iPhone_5C,
    iPhone_5S,
    iPhone_6,
    iPhone_6_plus,
    iPhone_6s,
    iPhone_6s_plus,
    iPhone_SE,
    iPhone_7,
    iPhone_7_plus,
    iPod_Touch_1G,
    iPod_Touch_2G,
    iPod_Touch_3G,
    iPod_Touch_4G,
    iPod_TOuch_5G,
    iPad_1G,
    iPad_2,
    iPad_3,
    iPad_4,
    iPad_Air,
    iPad_Mini_1G,
    iPad_Mini_2G,
    iPhone_Simulator
};

@implementation PhoneDevice

- (iOS_DeveiceType)iPhone_DeviceType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) {
        return iPhone_2G;
    }
    if ([platform isEqualToString:@"iPhone1,2"]) {
        return iPhone_3G;
    }
    if ([platform isEqualToString:@"iPhone2,1"]) {
        return iPhone_3GS;
    }
    if ([platform isEqualToString:@"iPhone3,1"] || [platform isEqualToString:@"iPhone3,2"] || [platform isEqualToString:@"iPhone3,3"]) {
        return iPhone_4;
    }
    if ([platform isEqualToString:@"iPhone4,1"]) {
        return iPhone_4S;
    }
    if ([platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"]) {
        return iPhone_5;
    }
    if ([platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"]) {
        return iPhone_5C;
    }
    if ([platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"]) {
        return iPhone_5S;
    }
    if ([platform isEqualToString:@"iPhone7,1"]) {
        return iPhone_6_plus;
    }
    if ([platform isEqualToString:@"iPhone7,2"]) {
        return iPhone_6;
    }
    if ([platform isEqualToString:@"iPhone8,1"]) {
        return iPhone_6s;
    }
    if ([platform isEqualToString:@"iPhone8,2"]) {
        return iPhone_6s_plus;
    }
    if ([platform isEqualToString:@"iPhone8,4"]) {
        return iPhone_SE;
    }
    if ([platform isEqualToString:@"iPhone9,1"]) {
        return iPhone_7;
    }
    if ([platform isEqualToString:@"iPhone9,2"]) {
        return iPhone_7_plus;
    }
    if ([platform isEqualToString:@"iPod1,1"]) {
        return iPod_Touch_1G;
    }
    if ([platform isEqualToString:@"iPod2,1"]) {
        return iPod_Touch_2G;
    }
    if ([platform isEqualToString:@"iPod3,1"]) {
        return iPod_Touch_3G;
    }
    if ([platform isEqualToString:@"iPod4,1"]) {
        return iPod_Touch_4G;
    }
    if ([platform isEqualToString:@"iPod5,1"]) {
        return iPod_TOuch_5G;
    }
    if ([platform isEqualToString:@"iPad1,1"]) {
        return iPad_1G;
    }
    if ([platform isEqualToString:@"iPad2,1"] || [platform isEqualToString:@"iPad2,2"] || [platform isEqualToString:@"iPad2,3"] || [platform isEqualToString:@"iPad2,4"]) {
        return iPad_2;
    }
    if ([platform isEqualToString:@"iPad2,5"] || [platform isEqualToString:@"iPad2,6"] || [platform isEqualToString:@"iPad2,7"]) {
        return iPad_Mini_1G;
    }
    if ([platform isEqualToString:@"iPad3,1"] || [platform isEqualToString:@"iPad3,2"] || [platform isEqualToString:@"iPad3,3"]) {
        return iPad_3;
    }
    if ([platform isEqualToString:@"iPad3,4"] || [platform isEqualToString:@"iPad3,5"] || [platform isEqualToString:@"iPad3,6"]) {
        return iPad_4;
    }
    if ([platform isEqualToString:@"iPad4,1"] || [platform isEqualToString:@"iPad4,2"] || [platform isEqualToString:@"iPad4,3"]) {
        return iPad_Air;
    }
    if ([platform isEqualToString:@"iPad4,4"] || [platform isEqualToString:@"iPad4,5"] || [platform isEqualToString:@"iPad4,6"]) {
        return iPad_Mini_2G;
    }
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        return iPhone_Simulator;
    }
    return -1;
}

@end
