//
//  SecondViewController.m
//  通知的使用
//
//  Created by qianfeng on 15/3/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SecondViewController.h"
#import "ZYLNSNotification.h"
#import "ZYLNSNotificationCenter.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)buttonClicked:(id)sender;

- (IBAction)pushToBextVC:(id)sender;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //将我们传过来的值赋给文本框
    self.textField.text = self.textValue;
    //注册监听通知
    [[ZYLNSNotificationCenter defaultCerter] addObserver:self selector:@selector(returnValueFromThirdVC:) name:@"NOTIFICATION" object:nil];
}

- (void)returnValueFromThirdVC:(ZYLNSNotification *)noti {
   //从第三页传过来的值
    _textField.text = (NSString *)noti.object;
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClicked:(id)sender {
    
    //取到我们要传到第一个控制器里面的值
    NSString *value = self.textField.text;
    //发送广播通知
    [[ZYLNSNotificationCenter defaultCerter] postNotificationName:@"NOTIFICATION" object:value];
    //返回到第一个控制器
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

- (IBAction)pushToBextVC:(id)sender {
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
    
}

- (void)dealloc {
    
    //从通知中心移除通知
    [[ZYLNSNotificationCenter defaultCerter] removeObserver:self name:@"NOTIFICATION" object:nil];
}
@end
