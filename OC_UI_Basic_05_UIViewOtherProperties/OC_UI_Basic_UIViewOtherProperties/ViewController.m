//
//  ViewController.m
//  OC_UI_Basic_UIViewOtherProperties
//
//  Created by SimonLiu on 2021/1/1.
//  Copyright © 2021 SimonLiu. All rights reserved.
//

/*
 ## UIView常见属性
 @propery(nonatomic,readonly) UIView *superview;
 - 获得自己的父控件对象

 @propery(nonatomic,readonly) NSArray *subview;
 - 获得自己的所有子控件对象

 @propery(nonatomic,readonly) NSInteger tag;
 - 控件的标签（标识），父控件可以通过tag来找到对应的子控件

 @propery(nonatomic,readonly) CGAffineTransform transform;
 - 控件的形变属性（可以设置旋转、比例缩放、平移等属性）
 -------

 ## UIView 常见方法
 - (void)addSubview:(UIView *)view;
 增加一个子控件view

 - (void)removeFromSuperview;
 从父控件中移除

 - (UIView *)viewWithTag:(NSInteger)tag;
 根据一个tag标识找出对应的控件
*/

#import "ViewController.h"

@interface ViewController ()
- (IBAction)allgone:(id)sender;
- (IBAction)showsubview:(id)sender;
- (IBAction)change:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)allgone:(id)sender {
    //让所有控件消失 注意firstObject属性
    while (self.view.subviews.firstObject)
    {
        [self.view.subviews.firstObject removeFromSuperview];
    }
}

- (IBAction)showsubview:(id)sender {
    //获取显示当前控制器所管理的view的所有子控件并更改背景颜色
    for (UIView *view in self.view.subviews)
    {
        view.backgroundColor = [UIColor redColor];
    }
}

- (IBAction)change:(id)sender {
    //获取父控件并修改背景颜色为蓝色
    self.txt1.superview.backgroundColor = [UIColor blueColor];
    //通过tag来访问控件属性，tag需要事先手动指定，但是尽量避免这种方式，因为tag可读性很差，尽量通过拖拽方式来进行。
    UITextField *txt = [(UITextField *) self.view viewWithTag:1000];
    txt.text = @"Halo";
    

}
@end
