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
        style.font = [UIFont systemFontOfSize:16];
        style.color = [UIColor darkGrayColor];
        style.underline = [UIColor darkGrayColor];
    }];
    
    [self setupLabel1];
    [self setupLabel2];
    [self setupButton];
    [self setupTextView];
}

- (void)setupLabel1 {
    self.label1.richText = @"RichText"
    .setStyle(style) // 整体设置style
    .range(0,4).setColor(UIColor.redColor) // 0~4设为红色
    .matches(@"R").setFont([UIFont boldSystemFontOfSize:24]); // 给“R”设置字体
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

//- (void)textViewDidChange:(UITextView *)textView {
//    NSRange range = textView.selectedRange;
//    RTText *richText = [[RTText alloc] initWithText:textView.richText];
//    richText.style(style);
//    [richText replaceTextMatchedPattern:@"\\[.+?\\]" withParser:^id<RTText>(NSString *string) {
//        NSArray *arr = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]];
//        if (arr.count > 2) {
//            return [UIImage imageNamed:arr[1]];
//        }
//        return nil;
//    }];
//    textView.richText = richText;
//    textView.selectedRange = range;
//}

@end
