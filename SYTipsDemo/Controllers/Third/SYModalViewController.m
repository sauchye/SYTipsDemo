//
//  SYModalViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 9/4/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//

#import "SYModalViewController.h"

@implementation SYModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = VString(@"ModalVC");
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, (kCURRENT_SCREEN_HEIGHT-40)/2, kCURRENT_SCREEN_WIDTH-40, 40.0);
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    [button setTitleColor:kNAVIGATION_BAR_COLOR forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked{
    
    if (_didClickedDissmissBlock) {
        _didClickedDissmissBlock(self);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
