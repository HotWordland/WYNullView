//
//  NullView.m
//  HeiPa
//
//  Created by wyman on 2017/3/14.
//  Copyright © 2017年 tykj. All rights reserved.
//

#import "NullView.h"
#import "NSBundle+WY.h"

@interface NullView ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *desLbl;


@end

@implementation NullView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 0.图标
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.image = [NSBundle wy_nullViewImage];
        //        [self addSubview:iconView];
        _iconView = iconView;
        
        // 1.说明
        UILabel *desLbl = [UILabel new];
        desLbl.text = @"当前无内容";
        desLbl.font = [UIFont boldSystemFontOfSize:16];
        desLbl.textColor = [self.class colorWithHex:@"b9b9b9"];
        desLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:desLbl];
        [desLbl sizeToFit];
        _desLbl = desLbl;
        
        // 2.操作说明
        UILabel *actLbl = [UILabel new];
        actLbl.text = @"点击重试";
        actLbl.font = [UIFont systemFontOfSize:15];
        actLbl.textColor = [self.class colorWithHex:@"b9b9b9"];
        actLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:actLbl];
        [actLbl sizeToFit];
        _actLbl = actLbl;
        
    }
    return self;
}
+ (UIColor *)colorWithHex:(NSString *)string
{
    NSString *cleanString = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)setFrame:(CGRect)frame {
    CGRect tempRect = frame;
    //    tempRect.size.width = NULL_WIDTH;
    //    tempRect.size.height = NULL_HEIGHT;
    [super setFrame:tempRect];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect superRect = self.bounds;
    // 图标居中往上
    //    CGFloat iconW = 90;
    //    CGFloat iconH = 128;
    //    CGFloat iconX = superRect.size.width*0.5 - iconW*0.5;
    //    CGFloat iconY = 0;
    //    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 说明
    //    CGFloat desW = iconW;
    //    CGFloat desH = 22;
    //    CGFloat desX = superRect.size.width*0.5 - desW*0.5;
    CGPoint centerLabel =  CGPointMake(superRect.size.width/2, superRect.size.height/2);
    centerLabel.y -= 5;
    self.desLbl.center = centerLabel;
    CGRect desFrame = self.desLbl.frame;
    desFrame.origin.y += self.offsetY;
    self.desLbl.frame = desFrame;
    self.actLbl.center = self.desLbl.center;
    
    CGFloat centerActOffsetY = CGRectGetMaxY(self.desLbl.frame);
    centerActOffsetY += 5;
    CGRect actFrame = self.actLbl.frame;
    actFrame.origin.y = centerActOffsetY;
    self.actLbl.frame = actFrame;
}
-(void)setOffsetY:(CGFloat)offsetY{
    _offsetY = offsetY;
    CGRect desFrame = self.desLbl.frame;
    desFrame.origin.y += offsetY;
    self.desLbl.frame = desFrame;
}
- (void)setNullIconImageName:(NSString *)nullIconImageName {
    _nullIconImageName = nullIconImageName;
    self.iconView.image = [UIImage imageNamed:_nullIconImageName];
}

- (void)setDesText:(NSString *)desText {
    _desText = desText;
    self.desLbl.text = _desText;
    [self.desLbl sizeToFit];
}

@end

