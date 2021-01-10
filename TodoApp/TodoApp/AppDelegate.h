//
//  AppDelegate.h
//  TodoApp
//
//  Created by 杨少 on 2020/12/22.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

// 声明辅助函数，该函数会返回特定文件的路径，用于保存用户的任务列表信息
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window; // iOS应用的屏幕
@property (weak, nonatomic) ViewController *myViewController;

@end

