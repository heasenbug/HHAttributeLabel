//
//  ViewController.m
//  HHAttributeLable
//
//  Created by 田俊杰 on 14-7-10.
//  Copyright (c) 2014年 田俊杰. All rights reserved.
//

#import "ViewController.h"
#import "HHAttributeLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    HHAttributeLabel *label = [[HHAttributeLabel alloc]initWithFrame:CGRectMake(10, 100, 320, 200)];
    
    label.fontColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16];
    
    label.specialColor = [UIColor greenColor];
    label.specialFont = [UIFont systemFontOfSize:32];
    
    label.text = @"no (zuo) no die, why(you)try?";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
