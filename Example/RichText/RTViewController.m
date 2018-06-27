//
//  RTViewController.m
//  RichText
//
//  Created by cheng4741@qq.com on 01/21/2018.
//  Copyright (c) 2018 cheng4741@qq.com. All rights reserved.
//

#import "RTViewController.h"
#import <RichText/RichText.h>

@interface RTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RTViewController
{
    RTStyle *style;
}

- (NSString *)pattern {
    return @"\\[.+?\\]";
}

- (id<RTText>)parse:(NSString *)text {
    NSArray *arr = [text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[(,)]"]];
    return [UIImage imageNamed:arr[1]].withSize([arr[2] intValue], [arr[3] intValue]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    style = [RTStyle create:^(RTStyle *style) {
        style.font = [UIFont boldSystemFontOfSize:18];
        style.color = [UIColor darkGrayColor];
    }];
    
    [self setupLabel1];
    [self setupLabel2];
    [self setupButton];
    [self setupTextView];
}

- (void)setupLabel1 {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor = UIColor.blueColor;
    shadow.shadowBlurRadius = 2;
    
    self.label1.richText = @"RichText"
    .setStyle(style) // 整体设置style
    .setStrokeColor(UIColor.greenColor) // 描边颜色
    .setStrokeWidth(-3) // 描边宽度
    .setShadow(shadow) // 设置阴影
    .setObliqueness(0.5) // 倾斜度0.5
    .setUnderline(UIColor.purpleColor)
    .range(0,4) // 选中范围
    .setColor(UIColor.redColor) // 0~4设为红色
    .matches(@"R") // 匹配指定范围
    .setExpansion(1.2) // 拉伸1.2倍
    .setFont([UIFont boldSystemFontOfSize:24]); // 给“R”设置字体
}

- (void)setupLabel2 {
    UIImage *image = [UIImage imageNamed:@"smile"];
    self.label2.richText = rt(@"人生真是",image,@"寂寞如雪啊",nil).setStyle(style);
}

- (void)setupButton {
    // 直接设置richText
    [self.button setRichText:@"我是一只鱼".setColor(UIColor.redColor) forState:UIControlStateHighlighted];
    
    // 设置style后，每次setTitle都会应用对应的style
    [self.button setStyle:style forState:UIControlStateNormal];
    [self.button setTitle:@"我是一只鱼" forState:UIControlStateNormal];
}

- (void)setupTextView {
    self.textView.style = style;
    self.textView.text = @"textView also support style configure";
}

@end
