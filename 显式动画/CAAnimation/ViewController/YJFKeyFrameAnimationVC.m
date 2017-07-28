//
//  YJFKeyFrameAnimationVC.m
//  CAAnimation
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 yunjifen. All rights reserved.
//

#import "YJFKeyFrameAnimationVC.h"

@interface YJFKeyFrameAnimationVC ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property(nonatomic,strong) CALayer *shipLayer;
@property(nonatomic,strong) UIBezierPath *bezierPath;

@end

@implementation YJFKeyFrameAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 创建路径
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint:CGPointMake(0, 150)];
    [_bezierPath addCurveToPoint:CGPointMake(360, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    // 图层显示路径
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = _bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0;
    [self.view.layer addSublayer:pathLayer];
    
    // ship
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 100, 64, 64);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.view.layer addSublayer:self.shipLayer];
    
    
//    CABasicAnimation *baseAnim = [CABasicAnimation animation];
//    baseAnim.keyPath = @"transform.rotation";
//    baseAnim.byValue = @(M_PI * 2);
//    baseAnim.duration = 2.0f;
//    [shipLayer addAnimation:baseAnim forKey:nil];
    
}


- (IBAction)startAct:(id)sender {
    
    // 动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0f;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.path = _bezierPath.CGPath;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"keyframe"];

}


- (IBAction)stopAct:(id)sender {
    
    [self.shipLayer removeAnimationForKey:@"keyframe"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    NSLog(@"animationDidStop(finish: %@)",flag?@"YES":@"NO");
}


@end
