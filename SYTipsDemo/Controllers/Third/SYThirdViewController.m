//
//  SYThirdViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYThirdViewController.h"
#import "SYLoginViewController.h"

@interface SYThirdViewController ()

@end

@implementation SYThirdViewController

#pragma mark - life cycle
- (instancetype)init{
    self = [super init];
    
    if (self) {
        self.title = VString(@"ThirdPage");
        [self showBackButton:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *registerBtn = [[UIBarButtonItem alloc] initWithTitle:VString(@"Login") style:UIBarButtonItemStylePlain target:self action:@selector(registerBtnClicked:)];
    self.navigationItem.rightBarButtonItem = registerBtn;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

}

- (void)registerBtnClicked:(UIButton *)sender{
    
    SYLoginViewController *loginVC = [[SYLoginViewController alloc] init];
    SYBaseNavigationController *nav = [[SYBaseNavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
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
