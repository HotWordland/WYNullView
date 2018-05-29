//
//  NullView.h
//  HeiPa
//
//  Created by wyman on 2017/3/14.
//  Copyright © 2017年 tykj. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NULL_WIDTH 90
#define NULL_HEIGHT 200

@interface NullView : UIView

@property (nonatomic, copy) NSString *nullIconImageName;

@property (nonatomic, copy) NSString *desText;

@property (nonatomic, weak) UILabel *actLbl;


/**
 偏移量Y
 */
@property (assign, nonatomic) CGFloat offsetY;

@end

