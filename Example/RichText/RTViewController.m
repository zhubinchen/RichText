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
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RTViewController
{
    RTStyle *style1;
    RTStyle *style2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"RichText Samples";
    
    style1 = [RTStyle create:^(RTStyle *style) {
        style.font = [UIFont boldSystemFontOfSize:18];
        style.color = [UIColor darkGrayColor];
    }];
    
    style2 = [RTStyle create:^(RTStyle *style) {
        style.font = [UIFont systemFontOfSize:16];
        style.color = UIColor.blueColor;
        style.underlineColor = UIColor.blueColor;
        style.lineSpacing = 20;
        style.hyphenationFactor = 1;
        style.firstLineHeadIndent = 20;
        style.paragraphSpacingBefore = 40;
    }];
    
    [self setupLabel1];
    [self setupLabel2];
    [self setupLabel3];
    [self setupButton];
    [self setupTextView];
}

- (void)setupLabel1 {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 3);
    shadow.shadowColor = UIColor.orangeColor;
    shadow.shadowBlurRadius = 2;
    
    self.label1.richText = @"RichText"
    .setKern(5) //设置字间距
    .setColor(UIColor.magentaColor) //设置颜色
    .setFont([UIFont boldSystemFontOfSize:30]) // 设置字体
    .setStrokeColor(UIColor.blueColor) // 设置描边颜色
    .setStrokeWidth(-3) // 设置描边宽度
    .setShadow(shadow) // 设置阴影
    .setObliqueness(0.4) // 设置倾斜度0.4
    .range(0,4) // 选中范围
    .setColor(UIColor.orangeColor) // 0~4设为红色
    .matches(@"R") // 匹配指定范围
    .setExpansion(0.5) // 拉伸或压缩
    .setFont([UIFont boldSystemFontOfSize:50]);
}

- (void)setupLabel2 {
    UIImage *image = [UIImage imageNamed:@"smile"];
    self.label2.richText = @"Join text to".join(image).join(@"image!").setStyle(style2);
}

- (void)setupLabel3 {
    RTText *html = [[RTText alloc] initWithHTML:@"<h1>Init with HTML</h1> <p style=\"font-family:verdana;color:red\"> This text is in Verdana and red</p><p style=\"font-family:times;color:green\">This text is in Times and green</p>"];
    self.label3.richText = html;
}

- (void)setupButton {
    // 设置style后，每次setTitle都会应用对应的style
    [self.button setStyle:style1 forState:UIControlStateNormal];
    [self.button setStyle:style2 forState:UIControlStateHighlighted];
    [self.button setTitle:@"Style for UIControlStateNormal" forState:UIControlStateNormal];
    [self.button setTitle:@"Style for UIControlStateHighlighted" forState:UIControlStateHighlighted];
}

- (void)setupTextView {
    self.textView.style = style2;
    self.textView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ";
}

@end
