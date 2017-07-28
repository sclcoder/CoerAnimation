//
//  YJFRootTableViewController.m
//  CAAnimation
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 yunjifen. All rights reserved.
//

#import "YJFRootTableViewController.h"

@interface YJFRootTableViewController ()

@property(nonatomic,strong) NSArray *dataArray;

@end

@implementation YJFRootTableViewController

- (NSArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = @[ @"01-隐式动画（待补充）",
                        @"02-属性动画之CABase&CAKeyFrame",
                        @"03-属性动画之CAKeyFrameAnim",
                        @"04-组动画CAGroupAnimation",
                        @"05-过渡-CATransition",
                       ];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = nil;
    
    if (indexPath.row == 0) { //CABaseAnimation
        vc = [board instantiateViewControllerWithIdentifier:@"BaseAnim"];
    }else if (indexPath.row == 1) {
        vc = [board instantiateViewControllerWithIdentifier:@"BaseAnim"];
    }else if (indexPath.row == 2) {
        vc = [board instantiateViewControllerWithIdentifier:@"KeyFrameAnim"];
    }else if (indexPath.row == 3){
        vc = [board instantiateViewControllerWithIdentifier:@"GroupAnim"];
    }else if (indexPath.row == 4){
        vc = [board instantiateViewControllerWithIdentifier:@"Transition"];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}


@end
