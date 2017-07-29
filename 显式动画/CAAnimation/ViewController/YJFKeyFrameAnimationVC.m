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

@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

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
    
    [self updateSliders:nil];
}


- (IBAction)startAct:(id)sender {
    
    // 动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2.0f;
    animation.rotationMode = kCAAnimationRotateAuto;
    //    animation.repeatCount = 5;
    //    animation.autoreverses = YES; // 倒放
    animation.path = _bezierPath.CGPath;
    animation.timeOffset = self.timeSlider.value;
    animation.speed = self.speedSlider.value;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;

    
    
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"keyframe"];

}


- (IBAction)stopAct:(id)sender {
    
    [self.shipLayer removeAnimationForKey:@"keyframe"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    NSLog(@"animationDidStop(finish: %@)",flag?@"YES":@"NO");
}

- (IBAction)updateSliders:(UISlider *)sender {
    
    CFTimeInterval timeoffset = self.timeSlider.value;
    self.timeLabel.text = [NSString stringWithFormat:@"%0.2f",timeoffset];
    
    float speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%0.2f",speed];
    
}





@end
