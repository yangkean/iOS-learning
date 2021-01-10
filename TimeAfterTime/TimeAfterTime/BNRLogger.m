//
//  BNRLogger.m
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/29.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString
{
    // 静态变量是贯穿整个程序生命周期的
    // 在这里每次调用都会使用上次保留的值
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

@end
