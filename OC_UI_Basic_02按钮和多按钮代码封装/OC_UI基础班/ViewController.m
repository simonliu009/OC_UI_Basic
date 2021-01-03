//
//  ViewController.m
//  OC_UI基础班
//
//  Created by SimonLiu on 2020/12/28.
//  Copyright © 2020 SimonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnicon;
- (IBAction)movebtn:(UIButton *)sender;
- (IBAction)zoom:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)movebtn:(UIButton *)sender {
    CGRect frame = self.btnicon.frame;
    //也可以通过center修改位置
//    CGPoint point = self.btnicon.center;
//   修改 point.x point.y
    //通过origin坐标更改位置
    switch (sender.tag) {
        case 1:
            frame.origin.y -= 5;
            
            NSLog(@"向上移动按钮。");
            break;
        case 2:
            frame.origin.y += 5;
            
            NSLog(@"向下移动按钮。");
            break;
        case 3:
            frame.origin.x -= 5;
            
            NSLog(@"向左移动按钮。");
            break;
        case 4:
            frame.origin.x += 5;
            
            NSLog(@"向右移动按钮。");
            break;
        
        default:
            break;
    }
    //无动画
//    self.btnicon.frame = frame;
    //有动画(注意教程里面的 UIView beginAnimation已经取消了)
    [UIView animateWithDuration:0.5 animations:^{
        self.btnicon.frame = frame;
    }];
}

- (IBAction)zoom:(UIButton *)sender {
    
    //通过frame修改大小
    CGRect frame = self.btnicon.frame;
    switch (sender.tag) {
        case 5:
            frame.size = CGSizeMake(frame.size.width + 10,frame.size.height + 10);
            break;

        default:
            frame.size = CGSizeMake(frame.size.width - 10,frame.size.height - 10);
            break;
    }
    self.btnicon.frame = frame;
    
    //block方式的动画过渡
        [UIView animateWithDuration:0.5 animations:^{
            self.btnicon.frame = frame;
        }];
    
    
    //通过bounds修改大小
//    CGRect originBounds = self.btnicon.bounds;
    
//    NSLog(@"%@",NSStringFromCGRect(originBounds));
//    if (sender.tag == 5)
//    {
//        originBounds.size.width += 10;
//         originBounds.size.height += 10;
//    }
//    else{
//        originBounds.size.width -= 10;
//        originBounds.size.height -= 10;
//    }
    
//    self.btnicon.bounds = originBounds;
    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.btnicon.bounds = originBounds;
//    }];
}
@end
