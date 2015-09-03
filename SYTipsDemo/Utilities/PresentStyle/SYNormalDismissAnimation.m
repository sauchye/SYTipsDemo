//
//  SYNormalDismissAnimation.m
//  SYTipsDemo
//
//  Created by Sauchye on 9/4/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  Author:http://sauchye.com/
//  GitHub:https://github.com/sauchye/SYTipsDemo

#import "SYNormalDismissAnimation.h"

@implementation SYNormalDismissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    // 1. Get controllers from transition context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
