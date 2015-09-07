//
//  SYRootViewController.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYBaseNavigationController.h"
#import "SYFirstViewController.h"
#import "SYSecondViewController.h"
#import "SYThirdViewController.h"

/**
 *  SYRootViewController Root控制器
 */
@interface SYRootViewController : RDVTabBarController<RDVTabBarControllerDelegate>

@property (nonatomic, strong)SYBaseNavigationController *firstNav;
@property (nonatomic, strong)SYBaseNavigationController *secondNav;
@property (nonatomic, strong)SYBaseNavigationController *thirdNav;


@end
