//
//  main.m
//  TimeAfterTime
//
//  Created by 杨少 on 2020/11/19.
//  Copyright © 2020年 重八. All rights reserved.
//

// OC 命名习惯：变量、方法使用骆驼拼写，类使用首字母大写的骆驼拼写

// #import 会确保预处理器只导入特定的文件一次，#include 则允许多次导入同一个文件

// 引入声明文件时，尖括号告诉编译器该文件可以在苹果库中找到，是预编译的头文件
// 双引号则告诉编译器在当前的项目中寻找该文件
#import <Foundation/Foundation.h>
#import "BNRPerson.h"
#import "BNREmployee.h"
#import "BNRAsset.h"
#import "BNRConstants.h"
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    // 创建 autorelease 池（对象）
    @autoreleasepool {
        // 消息发送指令：写在一对方括号中，必须包含接收方和选择器
        // 接收方：指针，指向接收消息的对象的地址。这里是 NSDate
        // 选择器：方法名，要触发的方法的方法名
        // 下面这条指令是发送消息给类 NSDate 让它执行它的类方法 date，这个方法会将 NSDate 实例初始化为当前日期/时间，然后返回新对象的地址
        NSDate *now = [NSDate date];

        NSLog(@"This NSDate object lives at %p", now); // 输出对象地址
        NSLog(@"The date is %@", now); // %@ 会输出相应对象的描述信息

        // timeIntervalSince1970 是一个实例方法
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);

        // 传递参数：dateByAddingTimeInterval 冒号之后的是实参，传给 dateByAddingTimeInterval 方法
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        // 传递多个参数
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"This is day %lu of the month", (unsigned long)[cal ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitMonth
                                                                            forDate:now]);
        
        // 消息的嵌套发送，系统会先执行最里面的消息，然后按由内至外的顺序依次执行外层消息
        double secondsTwo = [[NSDate date] timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", secondsTwo);
        
        // 补充：ARC(automatic reference counting)：自动引用计数，如果项目开启了 ARC，编译器会自动给项目添加代码来计算每个对象的引用数，当引用数为 0 时，程序就会自动销毁该对象
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        sleep(2);
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is now %p", currentTime);
        
        // @"..." 是 OC 的一个缩写，代表根据给定的字符串创建一个 NSString 对象，创建的实例称为 NSString 字面量
        NSString *lament = @"Why me!? \u2661";
        NSLog(@"%@", lament);
        
        // 动态创建字符串，stringWithFormat:方法后跟着一个格式字符串作为参数，这个格式字符串带有一个格式说明符和一个变量
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", now];
        NSLog(@"%@", dateString);
        
        // 查询字符串字符个数
        NSUInteger charCount = [dateString length];
        NSLog(@"charCount is %lu", charCount);
        
        // 创建三个 NSDate 对象
        NSDate *current = [NSDate date];
        NSDate *tomorrow = [current dateByAddingTimeInterval:24 * 60 * 60];
        NSDate *yesterday = [current dateByAddingTimeInterval:-24 * 60 * 60];
        
        // 用字面量语法创建一个数组包含这三个 NSDate 对象，NSArray 实例创建后无法改变
        NSArray *dateList = @[current, tomorrow, yesterday];
        // 遍历数组
        NSUInteger dateCount = [dateList count];
        for (int i = 0; i < dateCount; i++) {
            NSLog(@"Here is a date: %@", dateList[i]);
        }
        
        // 快速枚举
        for (NSDate *d in dateList) {
            NSLog(@"Here is a date %@", d);
        }
        
        BNRPerson *mikey = [[BNRPerson alloc] init]; // 创建 BNRPerson 实例
        
        // 支持使用点号调用存取方法
//        [mikey setWeightInKilos:63];
//        [mikey setHeightInMeters:1.7];
        mikey.weightInKilos = 63;
        mikey.heightInMeters = 1.7;
//        float height = [mikey heightInMeters];
//        int weight = [mikey weightInKilos];
        float height = mikey.heightInMeters;
        int weight = mikey.weightInKilos;

        NSLog(@"mikey is %.2f meters tall and weights %d kilograms", height, weight);
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey has a BMI of %f", bmi);
        
        // 继承类拥有父类所有东西
        BNREmployee *mikeyTwo = [[BNREmployee alloc] init];
        mikeyTwo.weightInKilos = 63;
        mikeyTwo.heightInMeters = 1.7;
        mikeyTwo.employeeID = 12;
        mikeyTwo.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        NSLog(@"mikeyTwo has a weight of %d", mikeyTwo.weightInKilos);
        NSLog(@"mikeyTwo has a height of %f", mikeyTwo.heightInMeters);
        NSLog(@"Employee %u hired on %@", mikeyTwo.employeeID, mikeyTwo.hireDate);
        // 使用定制的 description 方法打印值
        NSDate *date = mikeyTwo.hireDate;
        // 覆盖 BNREmployee 的 description 方法，让它返回描述 BNREmployee 的字符串
        NSLog(@"%@ hired on %@", mikeyTwo, date);

        float bmiTwo = [mikeyTwo bodyMassIndex];
        double years = [mikeyTwo yearOfEmployment];
        NSLog(@"mikeyTwo has a BMI of %f", bmiTwo);
        NSLog(@"BMI of %.2f has worked with us for %.2f years", bmiTwo, years);
        
        // 创建若干 BNRAsset 对象
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // 创建字典类型对象
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNREmployee *mikeyThree = [[BNREmployee alloc] init];
            mikeyThree.weightInKilos = 90 + i;
            mikeyThree.heightInMeters = 1.8 - i / 10.0;
            mikeyThree.employeeID = i;
            
            [employees addObject:mikeyThree];
            
            if (i == 0) {
                [executives setObject:mikeyThree forKey:@"CEO"];
            }
            
            if (i == 1) {
                [executives setObject:mikeyThree forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            // 设置标签
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            // 生成 0 - 9 之间的随机整数
            NSUInteger randomIndex = random() % [employees count];
            
            // 取出相应的 BNREmployee 对象
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset];
        }
        
        // 数组排序
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        // 使用排序描述对象进行排序
        [employees sortUsingDescriptors:@[voa, eid]];
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        
        NSLog(@"executives: %@", executives);
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        // 断言，表示一个逻辑条件
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        // 对 collection 类型的对象进行过滤，比如数组
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        NSLog(@"Giving up ownership of arrays");
        allAssets = nil;
        employees = nil;
        
        // 打印全局变量
        NSLog(@"so what, %@", BNRFuck);
        NSLog(@"this is speed %d", BlenderSpeedOne);
        
        // 将字符串对象写入文件
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Sam is cool!\n"];
        }
        // 声明一个指向 NSError 对象的指针，当发生错误时，会由 writeToFile 创建相应的 NSError 对象
        NSError *error;
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        // 检查返回的布尔值，如果写入文件失败，就查询 NSError 对象并输出错误描述
        if (success) {
            NSLog(@"done writing /tmp/cool.txt");
        } else {
            NSLog(@"writing failed: %@", [error localizedDescription]);
        }
        
        // 读取文件
        NSString *str2 = [[NSString alloc]
                          initWithContentsOfFile:@"/etc/resolv.conf"
                          encoding:NSASCIIStringEncoding
                          error:&error];
        if (!str2) {
            NSLog(@"read failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"resolv.conf looks like this:\n %@", str2);
        }
        
        // 将 NSData 对象所保存的数据写入文件
        // NSData 对象表示内存中的某块缓冲区，可以保存相应字节数的数据
        NSURL *url = [NSURL URLWithString:
                      @"https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *urlError = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&urlError];
        if (!data) {
            NSLog(@"fetch failed: %@", [urlError localizedDescription]);
            return 1;
        }
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        BOOL written = [data writeToFile:@"/tmp/baidu.png"
                                 options:NSDataWritingAtomic
                                   error:&urlError];
        if (!written) {
            NSLog(@"write failed: %@", [urlError localizedDescription]);
            return 1;
        }
        NSLog(@"download png success!");
        // 从文件读取数据并存入 NSData 对象
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/baidu.png"];
        NSLog(@"The file from the disk has %lu bytes", (unsigned long)[readData length]);
        
        // 目标-动作对机制实现事件回调
        // 操作为：在程序开始等待前，要求“当事件发生时，向指定的对象发送某个特定的消息”，接收消息的是目标（target），消息的选择器（selector）是动作（action）
        BNRLogger *logger = [[BNRLogger alloc] init];
        // __unused 消除“未使用变量”警告，这里的未使用是有意为之
        // 每隔 2 秒 NSTimer 对象会向 logger 发送 updateLastTime 的动作
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        // 使用 @selector 语句来传递动作消息的名称给相应的方法
                                                        // updateLastTime 后面的冒号是方法的一部分，不要遗漏
                                                        // 动作方法总是有一个实参，传入的是发送动作消息的那个对象，在这里就是 NSTimer 对象
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
        // NSRunLoop 实例会持续等待着，在特定的事件发生时触发回调
//        [[NSRunLoop currentRunLoop] run];
        NSLog(@"Who am I?");
    }
    return 0;
}
