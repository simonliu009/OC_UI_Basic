//
//  ViewController.m
//  OC_UI_Basic_transform属性
//
//  Created by SimonLiu on 2020/12/30.
//  Copyright © 2020 SimonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
- (IBAction)move:(id)sender;
- (IBAction)rotate:(id)sender;
- (IBAction)zoom:(id)sender;
- (IBAction)reset:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)move:(id)sender {
    //获取原始的结构体值
//    CGAffineTransform transform = self.btnIcon.transform;
    //修改属性的值
    //Y轴平移+10，注意是针对初始位置，即使运行多次也只是针对初始位置移动10
//    self.btnIcon.transform = CGAffineTransformMakeTranslation(0, 10);
//基于上次的值，进行平移,可以执行多次
    self.btnIcon.transform = CGAffineTransformTranslate(self.btnIcon.transform, 0, 10);
    
    //重新赋值
}

- (IBAction)rotate:(id)sender {
    //基于原位置旋转指定弧度，到了指定位置后不再执行，M_PI_4代表Pi/4个弧度，相当于45度。
    //    self.btnIcon.transform = CGAffineTransformMakeRotation(M_PI_4);
    //基于原位置旋转指定弧度，可以多次执行
    self.btnIcon.transform = CGAffineTransformRotate(self.btnIcon.transform, M_PI_4);
}

- (IBAction)zoom:(id)sender {
    //放大到1.1倍，仅一次
//    self.btnIcon.transform = CGAffineTransformMakeScale(1.1, 1.1);
//放大，可以多次执行
    self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.1, 1.1);
}

- (IBAction)reset:(id)sender {
    self.btnIcon.transform = CGAffineTransformIdentity;
}
@end
