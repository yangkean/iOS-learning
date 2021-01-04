//
//  BNREmployee.h
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/20.
//  Copyright © 2020年 重八. All rights reserved.
//

// 头文件中声明的属性、实例变量、方法的访问权限相当于其他语言中的 public

#import "BNRPerson.h"
// 告诉编译器程序有一个名为 BNRAsset 的类
// 当使用 @class 而不是 #import 时，编译器不会查看文件的全部内容，处理速度更快
// 之所以只需要用 @class 是因为编译器不需要知道实现细节就能处理文件中的所有声明
@class BNRAsset;

// BNREmployee 继承自类 BNRPerson
@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
//// 告诉其他类，询问 assets 会得到不可变对象，但是内部添加是用的 NSMutableArray 的 _assets
//@property (nonatomic, copy) NSArray *assets;

// 用无序集合存储员工物品是更好的方式，操作速度比数组更快
@property (nonatomic, copy) NSSet *assets;
- (double)yearOfEmployment;
- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end
