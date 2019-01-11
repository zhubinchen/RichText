//
//  RTStyle.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "RTStyle.h"

#define AssignProperty(name) self.paragraphStyle.name = self.name

static NSMutableDictionary *stylesPool = nil;

@interface RTStyle()
@property (nonatomic,strong) NSShadow                            *shadow;
@property (nonatomic,strong) NSMutableParagraphStyle             *paragraphStyle;
@end

@implementation RTStyle

+ (void)load {
    [super load];
    stylesPool = @{}.mutableCopy;
}

+ (instancetype)create:(void (^)(RTStyle *))maker {
    RTStyle *style = [[self alloc] init];
    maker(style);
    return style;
}

+ (instancetype)findStyleByIdentifier:(RTStyleIdentifier *)identifier {
    return stylesPool[identifier];
}

- (void)registerWithIdentifier:(RTStyleIdentifier *)identifier {
    stylesPool[identifier] = self;
}

- (instancetype)init {
    if (self = [super init]) {
        
        self.paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    }
    return self;
}

- (NSDictionary *)attributes {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    if (_font) {
        attrs[NSFontAttributeName] = _font;
    }
    if (_color) {
        attrs[NSForegroundColorAttributeName] = _color;
    }
    if (_backgroundColor) {
        attrs[NSBackgroundColorAttributeName] = _backgroundColor;
    }
    if (_underlineColor) {
        attrs[NSUnderlineStyleAttributeName] = @(NSUnderlineStyleSingle);
        attrs[NSUnderlineColorAttributeName] = _underlineColor;
    }
    if (self.shadowColor) {
        self.shadow = [[NSShadow alloc] init];
        self.shadow.shadowColor = self.shadowColor;
    } else {
        self.shadow = nil;
    }
    if (!CGSizeEqualToSize(self.shadowOffset, CGSizeZero)) {
        self.shadow.shadowOffset = self.shadowOffset;
    }
    if (self.shadowBlurRadius) {
        self.shadow.shadowBlurRadius = self.shadowBlurRadius;
    }
    if (self.shadow) {
        attrs[NSShadowAttributeName] = self.shadow;
    }
    if (self.kern) {
        attrs[NSKernAttributeName] = @(self.kern);
    }
    if (self.expansion) {
        attrs[NSExpansionAttributeName] = @(self.expansion);
    }
    if (self.strokeColor) {
        attrs[NSStrokeColorAttributeName] = self.strokeColor;
    }
    if (self.strokeWidth) {
        attrs[NSStrokeWidthAttributeName] = @(self.strokeWidth);
    }
    if (self.obliqueness) {
        attrs[NSObliquenessAttributeName] = @(self.obliqueness);
    }
    AssignProperty(lineSpacing);
    AssignProperty(firstLineHeadIndent);
    AssignProperty(alignment);
    AssignProperty(lineBreakMode);
    AssignProperty(headIndent);
    AssignProperty(tailIndent);
    AssignProperty(minimumLineHeight);
    AssignProperty(maximumLineHeight);
    AssignProperty(paragraphSpacing);
    AssignProperty(paragraphSpacingBefore);
    AssignProperty(lineHeightMultiple);
    AssignProperty(hyphenationFactor);
    attrs[NSParagraphStyleAttributeName] = self.paragraphStyle;
    return attrs;
}

@end
