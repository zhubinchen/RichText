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
    
    self.testLabel.richText = @"String";
    self.testLabel.richText = @"RichText".rt
                        .color([UIColor darkGrayColor])
                        .font(UIFont.regular(12))
                        .range(0,4)
                        .color([UIColor redColor])
                        .font(UIFont.bold(12))
                        .underline([UIColor redColor])
                        .matches(@"R")
                        .font(UIFont.bold(30));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
