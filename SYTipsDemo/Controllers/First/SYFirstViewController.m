//
//  SYFirstViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYFirstViewController.h"
#import "SYDetailViewController.h"

@interface SYFirstViewController ()

@end

@implementation SYFirstViewController

#pragma mark - life cycle
- (instancetype)init{
    self = [super init];
    
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showLeftBarItemTitle:VString(@"Left")];
    [self showRightBarItemTitle:VString(@"Right")];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


#pragma mark - Button Action
- (void)rightBarClickAction{
    SYDetailViewController *detailVC = [[SYDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)leftBarClickAction{
    [SYHUDView showToView:self.view customImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage" hide:2.0];
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
