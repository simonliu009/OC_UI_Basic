//
//  ViewController.m
//  OC_UI_Basic_07汤姆猫
//
//  Created by SimonLiu on 2021/1/6.
//  Copyright © 2021 SimonLiu. All rights reserved.
//

#import "ViewController.h"

#define EAT 40       //吃东西的图片的个数
#define FART 28      //放P的图片的个数
#define DRINK 81     //喝牛奶的图片的个数
#define ARGRY 26     //生气的图片的个数
#define CYMBAL 13    //敲锣的图片的个数
#define PIE 24       //扔东西的图片的个数
#define SCRATCH 56   //挠人的图片的个数
#define KNOCKOUT 81  //敲晕的图片的个数
#define FOOTLEFT 30  //左脚被点的图片个数
#define FOOTRIGHT 30 //右键被点的图片的个数
#define ANGRY 26     //生气时候的图片的个数
 
#define RATE 0.1    //每张图片显示的时间


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewCat;
//所有按键都关联到click这个Action
- (IBAction)click:(UIButton *)sender;
//执行动画封装到一个函数中
- (void)playWithImgName:(NSString *)imgName andImgCount:(int)imgCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark 执行动画的函数封装
/**
 ### 注意：有时候[NSBundle mainBundle] pathForResource:会找不到路径（xcode bug？），那么需要在`Build Phases`中手动把他添加到`Copy Bundle Resource`
 */
- (void)playWithImgName:(NSString *)imgName andImgCount:(int)imgCount
{
    //1. 动态加载图片到一个可变NSArray中(后缀为M一般表示可变)
    NSMutableArray *arrayM = [NSMutableArray array];
    //拼接图片名称
    for (int i=0;i<imgCount;i++)
    {

        NSString *imgFullName = [NSString stringWithFormat:@"%@_%02d.jpg",imgName,i];
//        NSLog(@"imgFullName:%@",imgFullName);
    //生成UIImage对象
    //通过[UIImage imageNamed:imgName];这种方式加载图片，会把图片一直缓存在内存中，而不会自动释放
    //使用这种方式，加载的图片即使没有强类型指针引用，也不会自动销毁
//        UIImage *img = [UIImage imageNamed:imgCompleteName];
    //解决方法：
    //a.获取图片的完整路径
        NSString *imgPath = [[NSBundle mainBundle] pathForResource:imgFullName ofType:nil];
//        NSLog(@"imgPath:%@",imgPath);
    //b.加载路径中的图片
    ////使用这种方式，加载的图片如果没有强类型指针引用，就会自动销毁
        UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    //将UIImage对象加载到Array中
        [arrayM addObject:img];
    }

    //2. 设置UIImageView的animationImages属性，这个属性就包含了所有需要执行动画所包含的图片
     self.imgViewCat.animationImages = arrayM;
    //3. 设置动画持续时间
    self.imgViewCat.animationDuration = self.imgViewCat.animationImages.count * 0.1;
    //4. 设置动画是否需要持续播放
    self.imgViewCat.animationRepeatCount = 1;
    //5. 开启动画
    [self.imgViewCat startAnimating];
    //6. 延迟清空图片。设置图片框在调用setAnimationImages:nil的时候延迟执行。Note：似乎在目前的xcode版本对内存占用没有什么影响，不管是否有这句话，内存占用一直是60M左右。可能是iOS更高版本有了优化。或者与拖入的方式有关？
    [self.imgViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imgViewCat.animationImages.count * 0.1];
}

#pragma mark 单击事件
- (IBAction)click:(UIButton *)sender {
  /**
    //单个按钮的写法，未封装
    //1. 动态加载图片到一个可变NSArray中(后缀为M一般表示可变)
    NSMutableArray *arrayM = [NSMutableArray array];
    //拼接图片名称
    for (int i=0;i<81;i++){
        NSString *imgName = [NSString stringWithFormat:@"drink_%02d.jpg",i];
    //生成UIImage对象
   //通过[UIImage imageNamed:imgName];这种方式加载图片，会把图片一直保存在内存中，而不会自动释放
        UIImage *imgDrink = [UIImage imageNamed:imgName];
    //将UIImage对象加载到Array中
        [arrayM addObject:imgDrink];
    }

    //2. 设置UIImageView的animationImages属性，这个属性就包含了所有需要执行动画所包含的图片
    self.imgViewCat.animationImages = arrayM;
 

    
    //3. 设置动画持续时间
    self.imgViewCat.animationDuration = self.imgViewCat.animationImages.count * 0.1;
    //4. 设置动画是否需要持续播放
    self.imgViewCat.animationRepeatCount = 1;
    //5. 开启动画
    [self.imgViewCat startAnimating];
         */
    
    //多个按钮的写法
    if([self.imgViewCat isAnimating])
    {
        NSLog(@"动画进行中，不响应任何按键");
        return;
    }
    else
    {
        UIButton *button = sender;
        switch (button.tag) {
            case 1:
                [self playWithImgName:@"drink" andImgCount:DRINK];
                break;
            case 2:
            [self playWithImgName:@"eat" andImgCount:EAT];
            break;
                
            case 3:
            [self playWithImgName:@"fart" andImgCount:FART];
            break;
                
            case 4:
            [self playWithImgName:@"scratch" andImgCount:SCRATCH];
            break;
            
            case 5:
            [self playWithImgName:@"pie" andImgCount:PIE];
            break;
            
            case 6:
            [self playWithImgName:@"cymbal" andImgCount:CYMBAL];
            break;
                
            case 7:
            [self playWithImgName:@"knockout" andImgCount:KNOCKOUT];
            break;
            
            case 8:
            [self playWithImgName:@"footRight" andImgCount:FOOTRIGHT];
            break;
                
            case 9:
            [self playWithImgName:@"footLeft" andImgCount:FOOTLEFT];
            break;
                
            case 10:
            [self playWithImgName:@"angry" andImgCount:ANGRY];
            break;
                
            default:
                break;
        }
    }
    
}
@end
