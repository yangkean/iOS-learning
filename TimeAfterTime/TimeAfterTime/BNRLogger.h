//
//  BNRLogger.h
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/29.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject

@property (nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;

@end
