//
//  SYSecondViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYSecondViewController.h"
#import "SYPresentViewController.h"
#import <JTMaterialTransition.h>
#import "SYPresentHead.h"
#import "SYModalViewController.h"

@interface SYSecondViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *presentControllerButton;

@property (nonatomic) JTMaterialTransition *transition;
//@property (nonatomic, strong) SYModalViewController *modelVC;
@property (nonatomic, strong) SYPresentViewController *presentVC;
//
@property (nonatomic, strong) SYBouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) SYNormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) SYSwipeUpInteractiveTransition *transitionController;

@end

@implementation SYSecondViewController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        _presentAnimation = [SYBouncePresentAnimation new];
//        _dismissAnimation = [SYNormalDismissAnimation new];
//        _transitionController = [SYSwipeUpInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createPresentControllerButton];
    [self createTransition];
    
}


- (void)createPresentControllerButton
{
    CGFloat y = 300;
    CGFloat width = 50;
    CGFloat height = width;
    CGFloat x = (CGRectGetWidth(self.view.frame) - width) / 2.;
    
    self.presentControllerButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    self.presentControllerButton.layer.cornerRadius = width / 2.;
    self.presentControllerButton.backgroundColor = [UIColor colorWithRed:86./256. green:188./256. blue:138./256. alpha:1.];
    
    [self.presentControllerButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    
    [self.presentControllerButton addTarget:self action:@selector(didPresentControllerButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.presentControllerButton];
}


- (void)didPresentControllerButtonTouch {
    self.presentVC = [[SYPresentViewController alloc] init];
     self.presentVC.modalTransitionStyle = UIModalPresentationCustom;
     self.presentVC.transitioningDelegate = self;
    [self presentViewController: self.presentVC animated:YES completion:nil];
}



#pragma mark - Transition

- (void)createTransition
{
    self.transition = [[JTMaterialTransition alloc] initWithAnimatedView:self.presentControllerButton];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
