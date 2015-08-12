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
@interface SYHUDView : MBProgressHUD

/**
 *
 *  纯文字提示
 *  @param view
 *
 *  @return hud
 */
+ (SYHUDView *)showTo:(UIView *)view hide:(NSTimeInterval)time;

/**
 *  加载框+文字提示
 *
 *  @param view
 *
 *  @return hud
 */
+ (SYHUDView *)showToProgressAndMessageTips:(UIView *)view;

/**
 *  是否加载成功+文字提示
 *
 *  @param view
 *  @param message
 *
 *  @return hud
 */
+ (SYHUDView *)showToLoadSuccess:(UIView *)view andShowMessage:(NSString *)message hide:(NSTimeInterval)time loadSuccess:(BOOL)isSuccess;



@end
