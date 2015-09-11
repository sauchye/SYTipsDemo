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
#import "SYPresentHead.h"
#import "SYModalViewController.h"

@interface SYThirdViewController () <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) SYBouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) SYNormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) SYSwipeUpInteractiveTransition *transitionController;


@end

@implementation SYThirdViewController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        _presentAnimation = [SYBouncePresentAnimation new];
        _dismissAnimation = [SYNormalDismissAnimation new];
        _transitionController = [SYSwipeUpInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置角标
    self.rdv_tabBarItem.badgeValue = VString(@"2");

    UIBarButtonItem *registerBtn = [[UIBarButtonItem alloc] initWithTitle:VString(@"Login") style:UIBarButtonItemStylePlain target:self action:@selector(loginBtnClicked:)];
    self.navigationItem.rightBarButtonItem = registerBtn;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    UILabel *touchLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, (kCURRENT_SCREEN_HEIGHT-30-64)/2, kCURRENT_SCREEN_WIDTH-40, 30)];
    touchLbl.textAlignment = NSTextAlignmentCenter;
    touchLbl.textColor = kNAVIGATION_BAR_COLOR;
    touchLbl.text = VString(@"touch it");
    [self.view addSubview:touchLbl];
    
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


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    SYModalViewController *modalVC = [[SYModalViewController alloc] init];
    modalVC.transitioningDelegate = self;

    __weak typeof(self) weakSelf = self;
    modalVC.didClickedDissmissBlock = ^(UIViewController *vc){
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self.transitionController wireToViewController:modalVC];
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (void)loginBtnClicked:(UIButton *)sender{
    
    SYLoginViewController *loginVC = [[SYLoginViewController alloc] init];
    SYBaseNavigationController *nav = [[SYBaseNavigationController alloc] initWithRootViewController:loginVC];

    [self presentViewController:nav animated:YES completion:nil];
}


#pragma mark - animationControllerForPresentedController
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    return self.presentAnimation;
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

#pragma mark - didReceiveMemoryWarning
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
