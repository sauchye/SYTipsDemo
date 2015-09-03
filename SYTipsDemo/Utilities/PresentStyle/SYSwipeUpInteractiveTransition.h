//
//  SYSwipeUpInteractiveTransition.h
//  SYTipsDemo
//
//  Created by Sauchye on 9/4/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  Author:http://sauchye.com/
//  GitHub:https://github.com/sauchye/SYTipsDemo


#import <UIKit/UIKit.h>

@interface SYSwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;

@end
