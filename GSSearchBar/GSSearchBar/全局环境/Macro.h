//
//  Macro.h
//  GSSearchBar
//
//  Created by GentryShen on 2018/10/6.
//  Copyright © 2018 GentryShen. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 强弱引用
#pragma mark - Synthsize a weak or strong reference.

/**
 *  Example:
 *  weak(self)
 *  [self doSomething^{
 *      strong(self)
 *      ...
 *  }];
 */
#if DEBUG
#define   weak(obj) @autoreleasepool{} __weak __typeof__(obj) weak##obj = obj;
#define strong(obj) @autoreleasepool{}        __typeof__(obj) obj = weak##obj;
#else
#define   weak(obj) @try{} @finally{} {} __weak __typeof__(obj) weak##obj = obj;
#define strong(obj) @try{} @finally{}           __typeof__(obj) obj = weak##obj;
#endif


#endif /* Macro_h */
