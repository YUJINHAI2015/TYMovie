//
//  UIColor+ZSLAdd.h
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TYAdd)

/**
 *
 *
 *  @return 背景色和导航底色
 */
+ (UIColor *)ty_BackGroundColor;

/**
 *
 *
 *  @return TableView背景色
 */
+ (UIColor *)ty_TableViewBackGroundColor;

/**
 *
 *
 *  @return 蓝色
 */
+ (UIColor *)ty_BlueColor;

/**
 *
 *
 *  @return textField字体颜色
 */
+ (UIColor *)ty_TextFieldColor;
/**
 *
 *
 *  @return 标签颜色
 */
+ (UIColor *)ty_TagTextColor;
/**
 *
 *
 *  @return 内容颜色
 */
+ (UIColor *)ty_ContentTextColor;
/**
 *
 *
 *  @return 橘色
 */
+ (UIColor *)ty_OrangeColor;
/**
 *
 *
 *  @return 绿色
 */
+ (UIColor *)ty_GreenColor;
/**
 *
 *
 *  @return 红色
 */
+ (UIColor *)ty_RedColor;

/**
 *  金色
 *
 *  @return 金色色块
 */
+ (UIColor *)ty_goldColor;
/**
 *  亮黑色
 *
 *  @return 黑色色块
 */
+ (UIColor *)ty_lightBlackColor;


+ (UIColor *)ty_GrayColor;

+ (UIColor *)ty_greenColor;

+ (UIColor *)ty_tabbarSelectColor;

/**
 *  hex 16进制颜色带透明度
 *
 *  @param colorValue 色值
 *  @param alphaValue 透明度
 *
 *  @return 色块
 */
+ (UIColor *)ty_hexColorWithColorValue : (NSInteger )colorValue andAlpha : (CGFloat)alphaValue;


/**
 *  RGB 颜色
 *
 *  @param red   红色
 *  @param green 绿色
 *  @param blue  蓝色
 *
 *  @return 色块
 */
+ (UIColor *)ty_RgbWithRed : (NSInteger)red andGreen : (NSInteger )green andBlue : (NSInteger)blue;




@end
