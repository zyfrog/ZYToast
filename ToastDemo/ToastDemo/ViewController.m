//
//  ViewController.m
//  ToastDemo
//
//  Created by Xinling on 26/1/15.
//  Copyright (c) 2015 Xinling. All rights reserved.
//

#import "ViewController.h"
#import "ZYToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(toastShow:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"显示" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 80, 40);
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toastShow:(UIButton *)button
{
    ZYToast* toast = [ZYToast showWithContent:@"保存功能"
                                      gravity:ToastGravityMake(ZYToastHorizontalGravityBottom, ZYToastVerticalGravityRight)];
    [toast setIndicateImage:[UIImage imageNamed:@"SucceedNoticeIcon"]];
}


@end
