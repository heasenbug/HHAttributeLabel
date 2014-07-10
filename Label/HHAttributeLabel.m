//
//  PPAttrubteLabel.m
//  testCoreText
//
//  Created by 田俊杰 on 14-7-2.
//  Copyright (c) 2014年 田俊杰. All rights reserved.
//

#import "HHAttributeLabel.h"
#import <CoreText/CoreText.h>
#import "HHMarkupParser.h"

@implementation HHAttributeLabel

@synthesize attString;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont systemFontOfSize:16];//default 16
        self.fontColor = [UIColor blackColor];
        
        self.specialFont = [UIFont systemFontOfSize:16];
        self.specialColor = [UIColor blueColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds );
    
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, [attString length]), path, NULL);
    
    CTFrameDraw(frame, context);
    
    CFRelease(frame);
    
    CFRelease(path);
    CFRelease(framesetter);
}

-(void)setText:(NSString *)text{
    _text = text;
    HHMarkupParser *parser = [[HHMarkupParser alloc]init];
    parser.font = self.font.fontName;
    parser.fontSize = self.font.pointSize;
    parser.color = self.fontColor;
    
    parser.specialFont = self.specialFont.fontName;
    parser.specialFontSize = self.specialFont.pointSize;
    parser.specialColor = self.specialColor;
    
    attString = [parser attrStringFromMarkup:text];
    
    [self setNeedsDisplay];
}

@end
