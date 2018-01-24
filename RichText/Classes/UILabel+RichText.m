//
//  UILabel+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "UILabel+RichText.h"
#import "RTText.h"
#import "NSAttributedString+RichText.h"

@interface RTText ()
@property (nonatomic,strong) NSMutableAttributedString *attrString;
@end

@implementation UILabel(RichText)

- (void)setRichText:(id<RTTextConvertible>)richText {
    self.attributedText = richText.rt.attrString;
}

- (id<RTTextConvertible>)richText {
    return self.attributedText.rt;
}

@end
