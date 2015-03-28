//
//  ViewController.m
//  通知的使用
//
//  Created by qianfeng on 15/3/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "ZYLNSNotification.h"
#import "ZYLNSNotificationCenter.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)buttonClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注册监听通知
    [[ZYLNSNotificationCenter defaultCerter] addObserver:self selector:@selector(returnValueFromOtherVC:) name:@"NOTIFICATION" object:nil];
    
}

- (void)returnValueFromOtherVC:(ZYLNSNotification *)noti {
    
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    
    //1创建控制器对象
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //2属性传值
    secondVC.textValue = self.textField.text;
    //3跳转页面
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

- (void)dealloc
{
    //从通知中心将自己的信息移除
    [[ZYLNSNotificationCenter defaultCerter] removeObserver:self name:@"NSNOTIFICATION" object:nil];
    
}
@end
