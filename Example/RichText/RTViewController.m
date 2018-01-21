//
//  RTViewController.m
//  RichText
//
//  Created by cheng4741@qq.com on 01/21/2018.
//  Copyright (c) 2018 cheng4741@qq.com. All rights reserved.
//

#import "RTViewController.h"
#import <RichText/RichText.h>

@interface RTViewController () <RTParser>

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation RTViewController

- (NSString *)pattern {
    return @"http://[^\\s]*.com";
}
- (id<RTTextConvertible>)parse:(NSString *)text {
    return @"链接".whole.color([UIColor blueColor]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//     Style把多个属性放一起，方便复用
    RTStyle *style = [RTStyle create:^(RTStyle *style) {
        style.font = UIFont.bold(16);
        style.color = [UIColor darkGrayColor];
        style.underline = [UIColor darkGrayColor];
    }];
    
    //    self.testLabel.richText = @"String"; // 兼容NSString
    //    self.testLabel.richText = @"RichText".whole.style(style) // 整体设置style
    //                        .range(0,4).color([UIColor redColor]) // 0~4设为红色
    //                        .matches(@"R").font(UIFont.bold(30)); // 给“R”设置字体
    

    RTImageParser *parser = [RTImageParser parser];
    NSString *text = @"人生真是寂寞如雪啊[simle(30,30)]插个图片http://baidu.com人生真是寂寞如雪啊";
    self.testLabel.richText = text.parseWith(parser).style(style).parseWith(self);
}

@end
