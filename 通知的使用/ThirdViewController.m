//
//  ThirdViewController.m
//  通知的使用
//
//  Created by qianfeng on 15/3/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ThirdViewController.h"
#import "ZYLNSNotificationCenter.h"
#import "ZYLNSNotification.h"

@interface ThirdViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;


- (IBAction)buttonClicked:(id)sender;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    
    [[ZYLNSNotificationCenter defaultCerter] postNotificationName:@"NOTIFICATION" object:self.textField.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
