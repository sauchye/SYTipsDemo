//
//  SYBaseViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYBaseViewController.h"


@interface SYBaseViewController ()

@end

@implementation SYBaseViewController

#pragma mark - life cycle
- (instancetype)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)showBackButtonTitle:(NSString *)title{
    //系统返回按钮
    //    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backActionClicked:)];
    //        temporaryBarButtonItem.title = @"返回";
    
    //自定义返回按钮
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickedAction:)];
    temporaryBarButtonItem.title = title;
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)showRightBarItemTitle:(NSString *)title{
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClickAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)showLeftBarItemTitle:(NSString *)title{
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBarClickAction)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)showLeftBarItemImage:(UIImage *)normal highLighted:(UIImage *)highLighted{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [btn addTarget:self action:@selector(rightBarClickAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:highLighted forState:UIControlStateHighlighted];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
    
}

- (void)showRightBarItemImage:(UIImage *)normal highLighted:(UIImage *)highLighted{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [btn addTarget:self action:@selector(leftBarClickAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    [btn setImage:highLighted forState:UIControlStateHighlighted];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barItem;
    
}

#pragma mark - button action
- (void)backClickedAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)leftBarClickAction{
    
}

- (void)rightBarClickAction{
    
}


#pragma mark - dataPath
- (NSString *)dataPath:(NSString *)file{
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"badge"];
    BOOL bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSAssert(bo,@"创建目录失败");
    
    NSString *result = [path stringByAppendingPathComponent:file];
    return result;
}

#pragma mrak - 隐藏TableView 多余的线
- (void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


#pragma mark - clickedPastedContent
- (void)clickedPastedContent:(NSString *)content{
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = content;
}


#pragma mark - showStatusLoading
- (void)showStatusLoading{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)hideStatusLoading{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


#pragma mark - 抖动效果
- (void)shakeAnimationForView:(UIView *)view isVerticalShake:(BOOL)isVerticalShake{
    
    CALayer *layer = [view layer];
    CGPoint posLbl = [layer position];
    CGPoint x, y;
    
    if (!isVerticalShake) {
        
        y = CGPointMake(posLbl.x - 10, posLbl.y);
        x = CGPointMake(posLbl.x + 10, posLbl.y);
    }else{
        y = CGPointMake(posLbl.x, posLbl.y - 5);
        x = CGPointMake(posLbl.x, posLbl.y + 5);
    }
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.09];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
