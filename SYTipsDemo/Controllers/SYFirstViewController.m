//
//  SYFirstViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 com.sauchye. All rights reserved.
//

#import "SYFirstViewController.h"
#import "SYDetailViewController.h"
#import "RDVTabBarController.h"

@interface SYFirstViewController ()

@end

@implementation SYFirstViewController

#pragma MARK - life cicle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FirstPage";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"PushNextVC" style:UIBarButtonItemStylePlain target:self action:@selector(pushAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
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


- (void)pushAction{
    SYDetailViewController *detailVC = [[SYDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
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
