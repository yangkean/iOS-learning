//
//  AppDelegate.m
//  TodoApp
//
//  Created by 杨少 on 2020/12/22.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

// 辅助函数，返回保存用户任务数据的文件路径
NSString *docPath()
{
    // 返回相应域中相应目录的路径
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@implementation AppDelegate

#pragma mark - 应用委托对象的回调方法

// 在程序能够和用户交互前就完成的初始化工作应该在这个方法里完成
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建并设置 UIWindow 对象
    // CGRect 是 C 结构，其下的两个成员也是 C 结构：origin(x,y) 和 size(width,height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    [self.window setRootViewController:[[ViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 读取已有的任务数据或创建一个新的
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        self.myViewController.tasks = [plist mutableCopy];
    } else {
        self.myViewController.tasks = [NSMutableArray array];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // 退出应用或进入后台时保存任务数据
    [self.myViewController.tasks writeToFile:docPath() atomically:YES];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
