//
//  YJFGroupAnimationVc.m
//  CAAnimation
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 yunjifen. All rights reserved.
//

#import "YJFGroupAnimationVc.h"

@interface YJFGroupAnimationVc ()

@end

@implementation YJFGroupAnimationVc

- (void)viewDidLoad {
    [super viewDidLoad];


    // 创建路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(360, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    // 图层显示路径
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0;
    [self.view.layer addSublayer:pathLayer];
    
    // ship
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 100, 64, 64);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    // 动画1
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.rotationMode = kCAAnimationRotateAuto;
    animation1.path = bezierPath.CGPath;
    
    // 动画2
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    // 组
    CAAnimationGroup *groupAnim = [CAAnimationGroup animation];
    groupAnim.animations = @[animation1,animation2];
    groupAnim.duration = 4.0f;
    
    [colorLayer addAnimation:groupAnim forKey:nil];
    
}


@end
