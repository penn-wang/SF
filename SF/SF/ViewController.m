//
//  ViewController.m
//  SF
//
//  Created by penn on 15/9/6.
//  Copyright (c) 2015年 SF. All rights reserved.
//

#import "ViewController.h"
#import "SFDB/SFDBWorker.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *createTableBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.createTableBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.createTableBtn setTitle:@"创建表" forState:UIControlStateNormal];
    self.createTableBtn.frame = CGRectMake(100, 100, 200, 50);
    self.createTableBtn.backgroundColor = [UIColor greenColor];
    [self.createTableBtn addTarget:self action:@selector(createTable:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.createTableBtn];
    
}

- (void)createTable:(__unused id) sender {
    [[SFDBWorker sharedDBWorker] createTable:TableTest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
