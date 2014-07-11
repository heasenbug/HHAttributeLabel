


```
    HHAttributeLabel *label = [[HHAttributeLabel alloc]initWithFrame:CGRectMake(10, 100, 320, 200)];
    //普通文本字体颜色
    label.fontColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16];
    //（）括起来的指定字体颜色
    label.specialColor = [UIColor greenColor];
    label.specialFont = [UIFont systemFontOfSize:32];
    
    label.text = @"no (zuo) no die, why (you) try?";
    [self.view addSubview:label];
```
效果如下:

![img](HHAttributeLabel.png)