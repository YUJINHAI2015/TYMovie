//
//  UIView+ZSLAdd.m
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import "UIView+ZSLAdd.h"

@implementation UIView (ZSLAdd)

- (void)zsl_moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x + horizontal, origionRect.origin.y + vertical, origionRect.size.width, origionRect.size.height);
    self.frame = newRect;
}

- (void)zsl_moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical addWidth:(CGFloat)widthAdded addHeight:(CGFloat)heightAdded
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x + horizontal,
                                origionRect.origin.y + vertical,
                                origionRect.size.width + widthAdded,
                                origionRect.size.height + heightAdded);
    self.frame = newRect;
}

- (void)zsl_moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(horizontal, vertical, origionRect.size.width, origionRect.size.height);
    self.frame = newRect;
}

- (void)zsl_moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical setWidth:(CGFloat)width setHeight:(CGFloat)height
{
    CGRect newRect = CGRectMake(horizontal, vertical, width, height);
    self.frame = newRect;
}

- (void)zsl_setWidth:(CGFloat)width height:(CGFloat)height
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x, origionRect.origin.y, width, height);
    self.frame = newRect;
}

- (void)zsl_setCornerRadius:(CGFloat)radius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)zsl_setCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor withWidth : (CGFloat )width{
    [self zsl_setCornerRadius:radius];
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}

- (void)zsl_setlineWithColor : (UIColor *)borderColor withWidth : (CGFloat)width{
    [self zsl_setCornerRadius:0];
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}


@end
