//
//  NSAttributedString+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "NSAttributedString+RichText.h"
#import "RTText.h"

@implementation NSAttributedString(ZHRichText)

rt1(matches, NSString*)
rt1(parseWith, id<RTParser>)
rt1(join, id<RTTextConvertible>)
rt2(range, NSInteger, NSInteger)

- (RTText *)rt {
    RTText *rt = [[RTText alloc] initWithAttributedString:self];
    return rt.range(0, self.length);
}

- (RTText *)whole {
    return self.rt;
}

@end
