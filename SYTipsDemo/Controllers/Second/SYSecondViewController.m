//
//  SYSecondViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYSecondViewController.h"

@interface SYSecondViewController ()

@end

@implementation SYSecondViewController

#pragma mark - life cycle
- (instancetype)init{
    self = [super init];
    
    if (self) {
        self.title = VString(@"Second");
        [self showBackButton:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
