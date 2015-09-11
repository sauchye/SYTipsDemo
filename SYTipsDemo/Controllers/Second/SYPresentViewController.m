//
//  SYPresentViewController.m
//  SYTipsDemo
//
//  Created by Saucheong Ye on 9/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//

#import "SYPresentViewController.h"

@interface SYPresentViewController ()

@end

@implementation SYPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:54./256. green:70./256. blue:93./256. alpha:1.];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, (kCURRENT_SCREEN_HEIGHT-40)/2, kCURRENT_SCREEN_WIDTH-40, 40.0);
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    [button setTitleColor:kNAVIGATION_BAR_COLOR forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


- (void)buttonClicked{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
