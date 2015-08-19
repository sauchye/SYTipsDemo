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
        self.title = VString(@"FirstPage");
        [self showBackButton:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showBackButton:NO];
    //设置角标
    self.rdv_tabBarItem.badgeValue = VString(@"2");

    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"rightBtn" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"leftBtn" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = leftBtn;
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
- (void)rightAction{
    SYDetailViewController *detailVC = [[SYDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)leftAction{
    
    [SYHUDView showToView:self.view text:@"Success" hide:2.0];
    [SYHUDView showToView:self.view success:YES text:@"Success" hide:2.0];
    [SYHUDView showToBottomView:self.view text:@"bottom Success" hide:2.0];
    [SYHUDView showToView:self.view customImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage" hide:2.0];
    
    SYHUDView *hud = [SYHUDView showToView:self.view];
    [hud hide:YES afterDelay:2.0];
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
