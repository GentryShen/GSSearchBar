//
//  UIView+GSExt.m
//  qiqi
//
//  Created by GentryShen on 2018/7/3.
//  Copyright © 2018年 GentryShen. All rights reserved.
//

#import "UIView+GSExt.h"

YYSYNTH_DUMMY_CLASS(UIView_GSExt)

@implementation UIView (GSExt)

// 构造方法: xib
+ (instancetype)xib:(nullable NSString *)xib {
    
    if (xib == nil) {
        xib = [NSStringFromClass(self) componentsSeparatedByString:@"."].lastObject;
    }
    return [[NSBundle mainBundle] loadNibNamed:xib owner:nil options:nil].firstObject;
}


@end
