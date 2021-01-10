//
//  ViewController.m
//  TodoApp
//
//  Created by 杨少 on 2020/12/22.
//  Copyright © 2020年 重八. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic) UITableView *taskTable; // 表格视图
@property (nonatomic) UITextField *taskField; // 输入框
@property (nonatomic) UIButton *insertButton; // 按钮

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获得app的 delegate 对象
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // 把 controller 对象赋值给 delegate 对象的属性
    appDelegate.myViewController = self;
    
    self.tasks = [NSMutableArray array];
    
    // Do any additional setup after loading the view, typically from a nib.
    CGRect winFrame = [[UIScreen mainScreen] bounds];

    // 设置三个UI对象的frame属性
    // CGRectMake()函数可以创建CGRect结构，参数是(x,y,width,height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // 创建并设置UITableView对象
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 将当前对象设置为 UITableView 的 dataSource
    self.taskTable.dataSource = self;
    
    // 需要创建新的单元格时，告诉UITableView对象要实例化哪个类
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // 创建并设置UITextField对象，以便用户能够输入新任务。创建并设置UIButton对象，按下时将新任务插入UITableView对象
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"请输入你的任务~点击插入";
    
    // 创建并设置UIButton对象
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    
    // 为按钮设置标题
    [self.insertButton setTitle:@"插入" forState:UIControlStateNormal];
    
    // 设置 Insert 按钮的目标-动作对
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // ViewController 有个基础的 view，这个根 Controller 相当于 HTML 中的 <body>，而 self.window 这个窗口则相当于 HTML 中的 <html>
    // 视觉元素应该添加到 controller 的 view 中
    [self.view addSubview:self.taskTable];
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.insertButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)addTask:(id)sender {
    // 获取新任务的文字描述
    NSString *text = [self.taskField text];

    if ([text length] == 0) {
        return;
    }

    [self.tasks addObject:text];
    
    // 刷新表格视图，显示新加入的任务
    [self.taskTable reloadData];
    
    // 清空 taskField
    [self.taskField setText:@""];
    // 取消输入框的第一响应状态，关闭键盘
    [self.taskField resignFirstResponder];
}

#pragma mark - 管理表格视图

// 根据指定表格段索引返回相应表格段所包含的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

// 根据指定表格段索引和行索引给出相应的UITableViewCell对象
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 检查是否有重用的UITableViewCell对象，没有则创建新的
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    // 根据 model 对象重新设置 UITableViewCell 对象
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    
    // 返回设置好的 UITableViewCell 对象
    return c;
}


@end
