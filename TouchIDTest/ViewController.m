//
//  ViewController.m
//  TouchIDTest
//
//  Created by Joan Molinas on 19/2/15.
//  Copyright (c) 2015 Joan. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+TouchID.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self useTouchIDWithDescription:@"TouchID" completion:^(BOOL success, NSString *stateMessage, LAError errorResult) {
        NSLog(@"%ld",errorResult);
    }];
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    b.frame = CGRectMake(0, 0, 200, 100);
    [b setTitle:@"TouchID" forState:UIControlStateNormal];
    b.backgroundColor = [UIColor lightGrayColor];
    b.center = self.view.center;
    b.tintColor = [UIColor grayColor];
    b.layer.cornerRadius = 4;
    b.titleLabel.font = [UIFont systemFontOfSize:25];
    [b addTarget:self action:@selector(checkTouchID:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    
        
    
}
-(void)checkTouchID:(id)sender {
    [self useTouchIDWithDescription:@"TouchID" completion:^(BOOL success, NSString *stateMessage, LAError errorResult) {
        NSLog(@"%ld",errorResult);
    }];
}

@end
