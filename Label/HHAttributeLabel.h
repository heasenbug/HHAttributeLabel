//
//  PPAttrubteLabel.h
//  testCoreText
//
//  Created by 田俊杰 on 14-7-2.
//  Copyright (c) 2014年 田俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  用（）括起来的字符将使用指定字体与颜色渲染
 */
@interface HHAttributeLabel : UIView

@property (retain, nonatomic) NSAttributedString* attString;

@property (nonatomic,strong) UIFont *font;
@property (nonatomic,strong) UIColor *fontColor;

@property (nonatomic,strong) UIFont *specialFont;
@property (nonatomic,strong) UIColor *specialColor;

@property (nonatomic,strong) NSString *text;

@end
