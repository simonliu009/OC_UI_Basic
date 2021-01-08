# OC_UI_Basic_07汤姆猫
本文主要涉及如下内容:

UIImageView帧动画相关属性和方法

### 属性

    - @property(nonatomic, copy) NSArray *animationImages;
        需要播放的序列帧图片数组（里面都是UIImage对象，会按照顺序播放）
    - @property(nonatomic) NSTimeInterval   animationDuration;
        帧动画的持续时间
    - @property(nonatomic) NSInteger   animationRepeatCount;
        帧动画的执行次数（默认为无限循环）

### 方法

    - (void)startAnimating;
        开始执行动画
    - (void)stopAnimating;
        停止执行动画
    - (BOOL)isAnimating;
        是否正在执行动画

<img src="./screenshot/screenshot.png" height="500">