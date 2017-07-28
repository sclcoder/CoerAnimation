//
//  YJFCATransitionViewController.m
//  CAAnimation
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 yunjifen. All rights reserved.
//

#import "YJFCATransitionViewController.h"

@interface YJFCATransitionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) NSArray *images;

@end

@implementation YJFCATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[
                    [UIImage imageNamed:@"1.jpg"],
                    [UIImage imageNamed:@"2.jpg"],
                    [UIImage imageNamed:@"3.jpg"],
                    [UIImage imageNamed:@"4.jpg"],
                    [UIImage imageNamed:@"5.jpg"],

                    ];
    self.imageView.image = self.images[0];
}


- (IBAction)swiftAct:(id)sender {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    UIImage *currentImage = self.imageView.image;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index+1) % self.images.count;
    self.imageView.image = self.images[index];
}

@end
