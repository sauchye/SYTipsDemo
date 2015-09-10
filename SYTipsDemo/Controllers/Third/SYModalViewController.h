//
//  SYModalViewController.h
//  SYTipsDemo
//
//  Created by Sauchye on 9/4/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//

#import "SYBaseViewController.h"

@class SYModalViewController;

/*** SYModalViewController 自定义Present方式 */
@interface SYModalViewController : UIViewController

@property (nonatomic, copy) void(^didClickedDissmissBlock)(SYModalViewController *viewController);


@end
