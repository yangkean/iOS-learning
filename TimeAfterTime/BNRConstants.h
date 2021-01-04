//
//  BNRConstants.h
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/29.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义全局变量
// const 表示的是 BNRFuck 指针在程序整个运行过程中的值都不会发生变化
// extern 表示的是 BNRFuck 是存在的，但是会在另一个文件中定义
extern NSString const *BNRFuck;

// 定义枚举常量
typedef enum {
    BlenderSpeedOne = 1,
    BlenderSpeedTwo = 2,
    BlenderSpeedThree = 3,
} BlenderSpeed;

@interface BNRConstants : NSObject

@end
