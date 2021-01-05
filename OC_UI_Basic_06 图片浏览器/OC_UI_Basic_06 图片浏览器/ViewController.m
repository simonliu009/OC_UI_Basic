//
//  ViewController.m
//  OC_UI_Basic_06 图片浏览器
//
//  Created by SimonLiu on 2021/1/3.
//  Copyright © 2021 SimonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)next;
- (IBAction)previous;
- (void)setData;
@property (nonatomic, strong) NSArray *pic;
//自己写一个索引来控制当前显示的是第几个图片
//这个属性一开始没有赋值，默认值为0
@property (nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UILabel *lblindex;
@property (weak, nonatomic) IBOutlet UILabel *lbltitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgicon;

@property (weak, nonatomic) IBOutlet UIButton *btnnext;

@property (weak, nonatomic) IBOutlet UIButton *btnprevious;

@end

@implementation ViewController


//重写pic属性的get方法
- (NSArray *)pic
{
    if (_pic == nil)
    {
//        写代码加载pic.plist文件中的数据到pic,这叫做懒加载的方式,懒加载的好处是不用的时候不占内存。
//        1. 获取plist文件的路径
//        获取plist文件的路径赋值给path变量, NSBundle mainBundle是程序安装在设备上面时候的根路径，然后在根目录下搜索"pic.plist"
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
//        另外一种写法
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@".plist"];
//        2. 读取文件
//        因为整体是一个array类型
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
//        此时读出来的是一个个字典
        NSLog(@"array count:%ld",array.count);
        NSLog(@"%@",array);
        _pic = array;
    }
    return _pic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.index = -1;
     [self next];
}

- (void)setData{
//    从数组中获取图片数据
        NSDictionary *dict = self.pic[self.index];
    //    将数据设置给界面上的控件
        self.lblindex.text = [NSString stringWithFormat:@"%d/%ld",self.index + 1, self.pic.count];
        //设置图片
        self.imgicon.image = [UIImage imageNamed:dict[@"icon"]];
        //设置图片标题
        self.lbltitle.text = dict[@"title"];
        //设置上一张按钮能否点击
        self.btnprevious.enabled = (self.index != 0);
        //设置下一张按钮能否点击
        self.btnnext.enabled = (self.index != (self.pic.count -1));
}

- (IBAction)next {
//    1. 索引++
    self.index ++;
    [self setData];
//
}

- (IBAction)previous {
    //    1. 索引++
        self.index --;
        [self setData];
}


@end
