//
//  ZHViewController.m
//  ZHRichText
//
//  Created by cheng4741@qq.com on 01/16/2018.
//  Copyright (c) 2018 cheng4741@qq.com. All rights reserved.
//

#import "ZHViewController.h"
#import <ZHRichText/ZHRichText.h>

@interface ZHViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Style把多个属性放一起，方便复用
    ZHRichTextStyle *style = [ZHRichTextStyle create:^(ZHRichTextStyle *style) {
        style.font = UIFont.bold(16);
        style.color = [UIColor darkGrayColor];
        style.underline = [UIColor redColor];
    }];
    
    self.testLabel.richText = @"String"; // 兼容NSString
    self.testLabel.richText = @"RichText".whole.style(style) // 整体设置style
                        .range(0,4).color([UIColor redColor]) // 0~4设为红色
                        .matches(@"R").font(UIFont.bold(30)); // 给“R”设置字体
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
