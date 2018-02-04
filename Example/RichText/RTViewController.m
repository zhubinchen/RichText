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

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation RTViewController

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
    

    NSString *text = @"人生真是寂寞如雪啊";
    
    UIImage *image = [UIImage imageNamed:@"smile"];
    self.testLabel.richText = text.join(image).join(@"插个图片").style(style);
}

@end
