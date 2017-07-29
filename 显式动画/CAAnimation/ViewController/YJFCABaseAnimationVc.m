//
//  YJFCABaseAnimationVc.m
//  CAAnimation
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 yunjifen. All rights reserved.
//

#import "YJFCABaseAnimationVc.h"

@interface YJFCABaseAnimationVc ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;

@property(nonatomic,strong) CALayer *colorLayer;

@end

@implementation YJFCABaseAnimationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (IBAction)baseAnimAct:(id)sender {
    
    
//    // arc4random()生成随机整数   INT_MAX int最大值
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue= arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

    
    NSLog(@"\nred:%f\ngreen:%f\nblue:%f",red,green,blue);
    
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    // 颜色变化动画但没真正修改背景色
    animation.toValue = (__bridge id _Nullable)(color.CGColor);
    animation.delegate = self;
    animation.fillMode = kCAFillModeBoth;

    NSLog(@"animation:%@",animation);
//    animation:<CABasicAnimation: 0x60800003ad80>
    
    [self.colorLayer addAnimation:animation forKey:nil];
    
}


- (IBAction)keyFrameAct:(id)sender {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 4.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor
                         ];
    // 计时函数
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 帧与帧之间的技术函数
    animation.timingFunctions = @[fn,fn,fn];
    
    [self.colorLayer addAnimation:animation forKey:nil];
}



- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{

    // anim:<CABasicAnimation: 0x60800003a780>
    // anim是animation的一个深拷贝 并不是同一个值
    NSLog(@"anim:%@",anim);

    
    // 事务
    [CATransaction begin];
    // 关掉隐式动画
    [CATransaction setDisableActions:YES];
    
    // 将背景色设置成最终颜色
    self.colorLayer.backgroundColor = (__bridge CGColorRef _Nullable)(anim.toValue);
    [CATransaction commit];
}




@end
