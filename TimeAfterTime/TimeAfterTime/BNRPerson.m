//
//  BNRPerson.m
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/20.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "BNRPerson.h"

// 实现 BNRPerson 类
@implementation BNRPerson
//// 使用属性的话可以省略手动书写存取方法实现
//- (float)heightInMeters
//{
//    return _heightInMeters;
//}
//
//- (void)setHeightInMeters:(float)h
//{
//    _heightInMeters = h;
//}
//
//- (int)weightInKilos
//{
//    return _weightInKilos;
//}
//
//- (void)setWeightInKilos:(int)w
//{
//    _weightInKilos = w;
//}

- (float)bodyMassIndex
{
    return _weightInKilos / (_heightInMeters * _heightInMeters);
    
//    // 这里 self 是局部变量，是一个指针，指向运行当前方法的对象
//    float h = [self heightInMeters];
//    return [self weightInKilos] / (h * h);
}
@end
