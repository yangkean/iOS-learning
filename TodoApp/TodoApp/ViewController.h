//
//  ViewController.h
//  TodoApp
//
//  Created by 杨少 on 2020/12/22.
//  Copyright © 2020年 重八. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic) NSMutableArray *tasks;

@end

