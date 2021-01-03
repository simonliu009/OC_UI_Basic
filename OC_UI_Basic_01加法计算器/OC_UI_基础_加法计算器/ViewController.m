//
//  ViewController.m
//  OC_UI_基础_加法计算器
//
//  Created by SimonLiu on 2021/1/1.
//  Copyright © 2021 SimonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextField *input2;
@property (weak, nonatomic) IBOutlet UILabel *result;
- (IBAction)calculate:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)calculate:(id)sender {
    NSString *num1txt = self.input1.text;
    NSString *num2txt = self.input2.text;
    int num1 = [num1txt intValue];
    int num2 = num2txt.intValue;
    int re = num1 + num2;
    self.result.text = [NSString stringWithFormat:@"%d",re];
    //隐藏键盘 方法1 辞去第一响应者，需要所有可能叫出键盘的控件都辞去第一响应者
//    [self.input1 resignFirstResponder];
//    [self.input2 resignFirstResponder];
    //隐藏键盘 方法2 让控制器管理的view停止编辑
    [self.view endEditing:YES];
}
@end
