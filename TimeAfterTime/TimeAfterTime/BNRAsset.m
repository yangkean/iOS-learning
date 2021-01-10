//
//  BNRAsset.m
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/25.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

// description 方法会返回一个描述类实例的字符串
- (NSString *)description
{
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>", self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d, unassigned>", self.label, self.resaleValue];
    }
}

// 当类的实例被释放时，就会执行 dealloc 方法
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
