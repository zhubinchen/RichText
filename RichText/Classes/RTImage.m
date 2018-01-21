//
//  RTImage.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import "RTImage.h"
#import "RTText.h"

@implementation RTImage

- (NSUInteger)length {
    return 1;
}

+ (instancetype)imageNamed:(NSString *)name size:(CGSize)size {
    RTImage *image = [[RTImage alloc] init];
    image.image = [UIImage imageNamed:name];
    image.size = size;
    
    return image;
}

- (RTText *)rt {
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, 0, _size.width, _size.height);
    attach.image = _image;
    NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attach];
    return [[RTText alloc] initWithAttributedString:attrString];
}

- (RTText *(^)(id<RTTextConvertible>))join {
    return ^(id<RTTextConvertible> text) {
        return self.rt.join(text);
    };
}

@end
