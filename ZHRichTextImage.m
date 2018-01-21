//
//  ZHRichTextImage.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import "ZHRichTextImage.h"
#import "ZHRichText.h"

@implementation ZHRichTextImage

- (NSUInteger)length {
    return 1;
}

+ (instancetype)imageNamed:(NSString *)name size:(CGSize)size {
    ZHRichTextImage *image = [[ZHRichTextImage alloc] init];
    image.image = [UIImage imageNamed:name];
    image.size = size;
    
    return image;
}

- (ZHRichText *)rt {
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, 0, _size.width, _size.height);
    attach.image = _image;
    NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attach];
    return [[ZHRichText alloc] initWithAttributedString:attrString];
}

- (ZHRichText *(^)(id<ZHRichTextConvertible>))join {
    return ^(id<ZHRichTextConvertible> text) {
        return self.rt.join(text);
    };
}

@end
