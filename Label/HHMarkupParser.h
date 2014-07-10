//
//  HHMarkupParser.h
//  testCoreText
//
//  Created by 田俊杰 on 14-7-2.
//  Copyright (c) 2014年 田俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHMarkupParser : NSObject{
    
    NSString* font;
    UIColor* color;
    UIColor* strokeColor;
    float strokeWidth;
    
    NSMutableArray* images;
}

@property (retain, nonatomic) NSString* font;
@property (nonatomic,assign) float fontSize;
@property (retain, nonatomic) UIColor* color;
@property (retain, nonatomic) UIColor* strokeColor;
@property (assign, readwrite) float strokeWidth;

@property (nonatomic,strong) NSString *specialFont;
@property (nonatomic,assign) float specialFontSize;
@property (nonatomic,strong) UIColor *specialColor;


-(NSAttributedString*)attrStringFromMarkup:(NSString*)str;

@end
