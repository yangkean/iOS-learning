//
//  BNRPerson.h
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/20.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <Foundation/Foundation.h>

// 声明 BNRPerson 类，以 @interface 开始，以 @end 结束
@interface BNRPerson : NSObject
//// 注意要在花括号里声明实例变量
//{
//    // BNRPerson 类拥有两个实例变量
//    // 按照惯例，实例变量的名字以下划线“_”开始
//    float _heightInMeters;
//    int _weightInKilos;
//}

//// BNRPerson 类拥有可以读取并设置实例变量的方法
//// 最前面的 “-” 号表示这是一个实例方法，类方法用 “+” 号
//- (float)heightInMeters;
//- (void)setHeightInMeters:(float)h;
//- (int)weightInKilos;
//- (void)setWeightInKilos:(int)w;

// 使用属性简化存取方法
// 属性以 @property 开头，然后是属性的类型和名称
// nonatomic 在这里是属性的特性，显示在 @property 之后的括号中，属性特性会告诉编译器关于属性行为的更多信息
// nonatomic 表示非原子性，和多线程相关
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;
// readonly 表示创建只读属性
@property (nonatomic, readonly) double circumferenceOfEarth;

// BNRPerson 类拥有计算 Body Mass Index 的方法
- (float)bodyMassIndex;
@end
