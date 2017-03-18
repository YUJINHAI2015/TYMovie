//
//  UIColor+ZSLAdd.m
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import "UIColor+TYAdd.h"

@implementation UIColor (TYAdd)

+ (UIColor *)ty_BackGroundColor
{
    return [self ty_hexWithColorValue:(0xeeeeee)];
}


+ (UIColor *)ty_TableViewBackGroundColor
{
    
    return [self ty_hexWithColorValue:(0xf7f7f7)];
}

+ (UIColor *)ty_BlueColor
{
    return [self ty_hexWithColorValue:(0x0088dd)];
}

+ (UIColor *)ty_TextFieldColor
{
    return [self ty_hexWithColorValue:(0xdddddd)];
}

+ (UIColor *)ty_TagTextColor
{
    return [self ty_hexWithColorValue:(0x999999)];
}

+ (UIColor *)ty_ContentTextColor
{
    return [self ty_hexWithColorValue:(0x333333)];
}

+ (UIColor *)ty_OrangeColor
{
    return [self ty_hexWithColorValue:(0xff7300)];
}

+ (UIColor *)ty_GreenColor
{
    return [self ty_hexWithColorValue:(0x11bb11)];
}

+ (UIColor *)ty_RedColor
{
    return [self ty_hexWithColorValue:(0xff0000)];
}

+ (UIColor *)ty_goldColor{
    return [self ty_hexWithColorValue:(0xD1AA81)];
    
}

+ (UIColor *)ty_GrayColor{
    return [self ty_hexWithColorValue:(0xa0a0a0)];
}

+ (UIColor *)ty_greenColor{
    return [self ty_hexWithColorValue:(0x14bc6d)];
}


+ (UIColor *)ty_lightBlackColor{
    return [self ty_hexWithColorValue:(0x38353e)];
    
}

+ (UIColor *)ty_tabbarSelectColor{
    return [self ty_hexWithColorValue:(0xF4A460)];
}

+ (UIColor *)ty_hexColorWithColorValue : (NSInteger )colorValue andAlpha : (CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((colorValue & 0xFF0000) >> 16))/255.0
                           green:((float)((colorValue & 0xFF00) >> 8))/255.0
                            blue:((float)(colorValue & 0xFF))/255.0 alpha:alphaValue];
}


+ (UIColor *)ty_hexWithColorValue:(NSInteger )hexValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1];
}

+ (UIColor *)ty_RgbWithRed : (NSInteger)red andGreen : (NSInteger )green andBlue : (NSInteger)blue
{
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}


@end
