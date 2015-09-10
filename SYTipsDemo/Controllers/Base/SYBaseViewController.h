//
//  SYBaseViewController.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import <UIKit/UIKit.h>

/***  SYBaseViewController 基类控制*/
@interface SYBaseViewController : UIViewController


@property (nonatomic, copy) NSString *backBtnTitle;
/**
 *  是否显示返回按钮
 *
 *  @param isShow
 */
- (void)showBackButton;


/**
 *  返回按钮事件  控制presnet还是push
 *
 *  @param sender
 */
- (void)backClickedAction:(UIButton *)sender;

/**
 *  隐藏tableView 多余的线
 *
 *  @param tableView tableView
 */
- (void)setExtraCellLineHidden: (UITableView *)tableView;


/**
 *  存储文件
 *
 *  @param file 文件名
 *
 *  @return 返回存储路径
 */
- (NSString *)dataPath:(NSString *)file;

/**
 *  点击文本内容复制
 *
 *  @param content 文本内容，出文字
 */
- (void)clickedPastedContent:(NSString *)content;


/*** 显示状态栏加载菊花显示 */
- (void)showStatusLoading;

/*** 隐藏状态栏加载菊花显示 */
- (void)hideStatusLoading;


/**
 *  左右上下 抖动
 *
 *  @param view            view
 *  @param isVerticalShake 水平还是竖直
 */
- (void)shakeAnimationForView:(UIView *)view isVerticalShake:(BOOL)isVerticalShake;

@end
