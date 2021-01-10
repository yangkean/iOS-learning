//
//  BNREmployee.m
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/20.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

// 类扩展（也叫 匿名category）
// 有些属性或方法只是类和类实例才需要使用，其他对象不需要知道，这样的属性、实例变量或方法可以在类扩展中声明
// 类扩展是添加在类实现文件中的，在 @implementation 之上
// 类扩展是一组私有的声明，**只能在当前这个文件中访问**，相当于其他语言中的 private
// PS: OC 中没有类似其他语言中的 protected 的操作
@interface BNREmployee ()
{
//    NSMutableArray *_assets;
    NSMutableSet *_assets;
}

@property (nonatomic) unsigned int officeAlarmCode;

@end;

@implementation BNREmployee
- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    // assets 是否为 nil?
    if (!_assets) {
//        // 创建数组
//        _assets = [[NSMutableArray alloc] init];
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    a.holder = self;
}

- (unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (double)yearOfEmployment
{
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0; // 每年的秒数
    } else {
        return  0;
    }
}

// 覆盖父类方法
- (float)bodyMassIndex
{
//    return 19.0;
    
    // 利用父类实现
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
