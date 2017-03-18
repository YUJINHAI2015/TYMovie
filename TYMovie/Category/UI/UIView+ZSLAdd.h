//
//  UIView+ZSLAdd.h
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZSLAdd)

/***********   view位移   ***********************/
/**
*  view移动
*
*  @param horizontal x轴移动距离
*  @param vertical   y轴移动距离
*/
- (void)zsl_moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical;
/**
 *  view的移动和view的大小
 *
 *  @param horizontal  x轴移动距离
 *  @param vertical    y轴移动距离
 *  @param widthAdded  添加view宽度
 *  @param heightAdded 添加view高度
 */
- (void)zsl_moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical addWidth:(CGFloat)widthAdded addHeight:(CGFloat)heightAdded;
/**
 *  view移动到
 *
 *  @param horizontal x轴屏幕的坐标
 *  @param vertical   y轴屏幕的坐标
 */
- (void)zsl_moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical;
/**
 *
 *
 *  @param horizontal x轴移动到的值
 *  @param vertical   y轴移动到的值
 *  @param width      设置view的宽度
 *  @param height     设置view的高度
 */
- (void)zsl_moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical setWidth:(CGFloat)width setHeight:(CGFloat)height;

/***********    view设置圆角     ***********/
/**
 *  设置圆角 无线框 
 *
 *  @param radius 圆角值
 */
- (void)zsl_setCornerRadius:(CGFloat)radius;

/**
 *  设置圆角并带有线框
 *
 *  @param radius      圆角值
 *  @param borderColor 线框颜色
 *  @param width       线框宽度
 */
- (void)zsl_setCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor withWidth : (CGFloat )width;

/**
 *  有线框 无圆角
 *
 *  @param borderColor 线框颜色
 *  @param width       线框宽度
 */
- (void)zsl_setlineWithColor : (UIColor *)borderColor withWidth : (CGFloat)width;


@end
