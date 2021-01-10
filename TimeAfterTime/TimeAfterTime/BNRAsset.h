//
//  BNRAsset.h
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/25.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
// 强引用循环可能导致内存泄露
// weak 表示这是一个弱引用，当某个由弱引用指向的对象被释放时，相应的指针变量会被归零，即赋为 nil
// 总的来说：强引用会保留对象的拥有方，使其不被释放。而弱引用则不会保留，因此标为弱引用的实例变量与属性指向的对象可能会消失
@property (nonatomic, weak) BNREmployee *holder;
@property (nonatomic) unsigned int resaleValue;

@end
