//
//  ViewController.m
//  SQCAlertViewDemo
//
//  Created by sun on 15/5/27.
//  Copyright (c) 2015年 sunqichao. All rights reserved.
//

#import "ViewController.h"
#import "SQCAlertViewManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showYESRight:(id)sender {
    [SQCAlertViewManager showAlertViewWithLeftYESTitle_:@"老婆大人" message:@"老婆大人，给您请安！" confirmButtonTitle:@"YES" confirmButtonBlock:^{
        NSLog(@"YES");
        
    } cancelButtonTitle:@"NO" cancelButtonBlock:^{
        NSLog(@"NO");

    }];
    
}

- (IBAction)showYESLeft:(id)sender {
    [SQCAlertViewManager showAlertViewWithLeftYESTitle_:@"老婆大人" message:@"老婆大人，给您请安！" confirmButtonTitle:@"NO" confirmButtonBlock:^{
        NSLog(@"NO");

    } cancelButtonTitle:@"YES" cancelButtonBlock:^{
        NSLog(@"YES");

    }];
    
}

@end
