//
//  ViewController.m
//  TestJSPatch
//
//  Created by 席萍萍 on 16/6/27.
//  Copyright © 2016年 Bob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 因为该代码会第一时间运行，从而会导致脚本无法修复，因此建议程序启动要等到JSPatch加载完脚本后再跳转其他业务
//     [self badMethod];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self badMethod];
}

- (void)badMethod {
    NSArray *array = @[@""];
    NSLog(@"log element at 2 -> %@", array[1]);
}

- (void)badMethod2 {
    NSArray *array = @[@""];
    NSLog(@"log element at 2 -> %@", array[1]);
}

@end
