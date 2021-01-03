//
//  ViewController.m
//  OC_UI_Basic_12_动态创建按钮
//
//  Created by SimonLiu on 2020/12/30.
//  Copyright © 2020 SimonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//当显示一个界面的时候，首先创建这个界面对应的控制器
//控制器创建好以后，接着创建控制器管理的那个view，当这个view创建好了就继续执行下面的方法。
//当viewDidload方法被执行了，这个view就被创建好了。
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //动态创建我们自己的按钮
    //1. 创建按钮
//    UIButton *button = [[UIButton alloc] init];
//    或者
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //or
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //2. 给按钮设置默认状态文字
    [button setTitle:@"点我吧" forState:UIControlStateNormal];
    //3、 给按钮设置高亮状态文字
    [button setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    //设置按钮文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //4. 背景图
    //加载图片(如果是PNG图片可以省略扩展名)
    UIImage *imgNormal = [UIImage imageNamed:@"cat1.jpg"];
    UIImage *imgHighlighted = [UIImage imageNamed:@"cat2.png"];
    //设置默认背景图
    [button setBackgroundImage:imgNormal forState:(UIControlStateNormal)];
    //设置高亮背景图
    [button setBackgroundImage:imgHighlighted forState:(UIControlStateHighlighted)];
    //5. 设置按钮的frame
   button.frame = CGRectMake(50, 50, 100, 100);
    
    //给按钮注册一个单击事件
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //6. 将按钮加到view里面
    [self.view addSubview:button];
    
}


- (void) buttonClick
{
    NSLog(@"我被点击了");
}
@end
