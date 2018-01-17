//
//  UILabel+ZHRichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "UILabel+ZHRichText.h"
#import "ZHRichText.h"
#import "NSAttributedString+ZHRichText.h"

@interface ZHRichText ()

@property (nonatomic,strong) NSMutableAttributedString *attrStr;

@end

@implementation UILabel(ZHRichText)

- (void)setRichText:(id<ZHRichTextConvertible>)richText {
    self.attributedText = richText.rt.attrStr;
}

- (id<ZHRichTextConvertible>)richText {
    return self.attributedText.rt;
}

@end
