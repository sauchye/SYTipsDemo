//
//  SYRootViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 com.sauchye. All rights reserved.
//

#import "SYRootViewController.h"


@interface SYRootViewController ()

@end

@implementation SYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
}

- (void)setupViewControllers{
    SYFirstViewController *firstVC = [[SYFirstViewController alloc] init];
    SYSecondViewController *secondVC = [[SYSecondViewController alloc] init];
    SYThirdViewController *thirdVC = [[SYThirdViewController alloc] init];
    
    self.firstNav = [[SYBaseNavigationController alloc] initWithRootViewController:firstVC];
    self.secondNav = [[SYBaseNavigationController alloc] initWithRootViewController:secondVC];
    self.thirdNav = [[SYBaseNavigationController alloc] initWithRootViewController:thirdVC];
    [self setViewControllers:@[self.firstNav, self.secondNav, self.thirdNav]];
    
    [self customizeTabBarForController];
}

- (void)customizeTabBarForController{
    
    //tabbar 背景图片 tabbar_background
    UIImage *backgroundImage = [UIImage imageNamed:@""];
    //选项卡图片
    NSArray *tabBarItemImages = @[VString(@"First"), VString(@"Second"),VString(@"Third")];
    
    NSArray *tabBarItemTitles = @[VString(@"First"), VString(@"Second"), VString(@"Third")];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items])
    {
        item.titlePositionAdjustment = UIOffsetMake(0, 2.0);
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImages objectAtIndex:index]]];
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarItemImages objectAtIndex:index]]];
        
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        item.selectedTitleAttributes = @{
                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                         NSForegroundColorAttributeName:kNAVIGATION_BAR_COLOR,
                                         };
        item.unselectedTitleAttributes = @{
                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                           NSForegroundColorAttributeName:RGB(217, 217, 217),
                                           };
        
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        index++;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
