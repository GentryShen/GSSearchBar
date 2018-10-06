//
//  UIView+GSExt.h
//  qiqi
//
//  Created by GentryShen on 2018/7/3.
//  Copyright © 2018年 GentryShen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GSExt)

/**
 *  构造方法: xib
 *
 *  @param xib xib文件名称
 */
+ (instancetype)xib:(nullable NSString *)xib;


@end

NS_ASSUME_NONNULL_END
