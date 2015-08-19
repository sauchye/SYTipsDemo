//
//  SYHUDView.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/12/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "MBProgressHUD.h"

/***  SYHUDView 封装MBProgressHUD */
@interface SYHUDView : MBProgressHUD

/** 纯文字提示+默认中间显示 */
+ (SYHUDView *)showToView:(UIView *)view
                     text:(NSString *)text
                     hide:(NSTimeInterval)time;

/** 纯文字提示+底部显示 */
+ (SYHUDView *)showToBottomView:(UIView *)view
                           text:(NSString *)text
                           hide:(NSTimeInterval)time;


/** 是否返回成功图片显示+文字提示 */
+ (SYHUDView *)showToView:(UIView *)view
                  success:(BOOL)isSuccess
                     text:(NSString *)text
                     hide:(NSTimeInterval)time;

/** 自定义返回的图片+文字提示 */
+ (SYHUDView *)showToView:(UIView *)view
              customImage:(UIImage *)image
                     text:(NSString *)text
                     hide:(NSTimeInterval)time;

/** 菊花加载+文字提示+也可添加在Window上 */
+ (SYHUDView *)showToView:(UIView *)view;

/** 背景色灰掉+菊花加载 */
//- (SYHUDView *)showToGradient:(UIView *)view;


//暂时未完成 o(╯□╰)o
///** 加载实心圆形进度条+文字提示 */
//+ (SYHUDView *)showToDeterminateView:(UIView *)view;
//
///** 加载空心圆形进度条+文字提示 */
//+ (SYHUDView *)showToAnnularDeterminateView:(UIView *)view;
//
///** 加载水平进度条 */
//+ (SYHUDView *)showToDeterminateHorizontalBar:(UIView *)view;


@end
