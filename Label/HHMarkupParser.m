//
//  HHMarkupParser.m
//  testCoreText
//
//  Created by 田俊杰 on 14-7-2.
//  Copyright (c) 2014年 田俊杰. All rights reserved.
//

#import "HHMarkupParser.h"
#import <CoreText/CoreText.h>

typedef enum {
    HHMarkupTypeNormal,
    HHMarkupTypeSpecial
}HHMarkupType;

@implementation HHMarkupParser
@synthesize font, color, strokeColor, strokeWidth, fontSize;
@synthesize specialFont,specialColor,specialFontSize;
-(id)init
{
    self = [super init];
    if (self) {
        self.font = @"Heiti SC";
        self.color = [UIColor blackColor];
        self.fontSize = 24.0f;
        self.strokeColor = [UIColor whiteColor];
        self.strokeWidth = 0.0;
        
        self.specialFontSize = 24.0f;
        self.specialColor = [UIColor greenColor];
        self.specialFont = @"Heiti SC";
    }
    return self;
}

/**
 *  对于匹配到的内容进行定制颜色字体
 *  例如: ab(cd)efg  其中cd 将被设置为指定颜色
 *  a(bcd)e(fg)   'bcd'与'fg'将被匹配为指定颜色
 *  ab(cde(fg)h)ijk  嵌套内容将匹配最内层内容，这里‘fg’将被指定为指定颜色
 *  @param markup 被匹配的字符串
 *
 *  @return
 */
-(NSAttributedString*)attrStringFromMarkup:(NSString*)markup
{
    NSMutableAttributedString* aString = [[NSMutableAttributedString alloc] initWithString:@""];
    
//    //匹配括号内的内容
    NSRegularExpression *regular = [[NSRegularExpression alloc]initWithPattern:@"\\([^()]+\\)" options:NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSArray *matchResult = [regular matchesInString:markup options:NSMatchingReportCompletion range:NSMakeRange(0, markup.length)];
    
    UInt16 pos = 0;//处理到字符串的下标位置
    for (NSTextCheckingResult *result in matchResult) {
        if (pos < result.range.location) {//如果第一个字符就是匹配到的内容就不需要处理匹配之前的内容了
            NSString *preStr = [markup substringWithRange:NSMakeRange(pos, result.range.location-pos)];
            [aString appendAttributedString:[self parseAttString:preStr type:HHMarkupTypeNormal]];
        }
        if (result.range.length > 2) {//除了空括号()以外
            NSString *matchStr = [markup substringWithRange:NSMakeRange(result.range.location + 1, result.range.length - 2)];
            [aString appendAttributedString:[self parseAttString:matchStr type:HHMarkupTypeSpecial]];
        }
        pos = result.range.location + result.range.length;//指针指向偏移的地方
    }
    if (pos < markup.length) {
        NSString *lastStr = [markup substringWithRange:NSMakeRange(pos, markup.length-pos)];
        [aString appendAttributedString:[self parseAttString:lastStr type:HHMarkupTypeNormal]];
    }
    return aString;
}

/**
 *  将指定字符按照HHMarkupType 进行组装对应颜色属性
 *
 *  @param str  要处理的字符
 *  @param type 处理类型
 *
 *  @return 组装后的多属性字符串
 */
-(NSAttributedString*)parseAttString:(NSString*)str type:(HHMarkupType)type{
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)(type == HHMarkupTypeNormal?font:specialFont),(type == HHMarkupTypeNormal?fontSize:specialFontSize), NULL);

    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (id)(type==HHMarkupTypeNormal?color.CGColor:specialColor.CGColor), kCTForegroundColorAttributeName,
                           (__bridge id)fontRef, kCTFontAttributeName,
                           nil];
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:str attributes:attrs];
    CFRelease(fontRef);
    return attStr;
}

-(void)dealloc
{
    self.font = nil;
    self.color = nil;
    self.strokeColor = nil;
}
@end
