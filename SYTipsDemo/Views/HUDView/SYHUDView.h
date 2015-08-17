//
//  SYHUDView.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/12/15.
//  Copyright (c) 2015 com.sauchye. All rights reserved.
//

#import "MBProgressHUD.h"
/**
 *  SYHUDView 封装MBProgressHUD
 */

//自定义图片 玩的不够6  如：成功图片+文字提示，您可以封装在此，多谢

@interface SYHUDView : MBProgressHUD

/**
 *
 *  纯文字提示+中间显示
 *  @param view
 *
 *  @return hud
 */
+ (SYHUDView *)showTo:(UIView *)view hide:(NSTimeInterval)time;


/**
 *
 *  纯文字提示+底部显示
 *  @param view
 *
 *  @return hud
 */
+ (SYHUDView *)showToBottomView:(UIView *)view hide:(NSTimeInterval)time;

/**
 *  菊花+文字提示+也可添加在Window上
 *
 *  @param view
 *
 *  @return hud
 */
+ (SYHUDView *)showToView:(UIView *)view;

/**
 *  图片显示是否加载成功+文字提示
 *
 *  @param view
 *  @param message
 *
 *  @return hud
 */
//+ (SYHUDView *)showToLoadSuccess:(UIView *)view isloadSuccess:(BOOL)isSuccess;

/**
 *  自定义返回的图片+文字提示
 *
 *  @param view
 *  @param image
 *
 *  @return hud
 */
+ (SYHUDView *)showToLoadSuccess:(UIView *)view Image:(UIImage *)image;


@end
