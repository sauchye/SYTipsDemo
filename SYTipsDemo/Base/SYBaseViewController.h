//
//  SYBaseViewController.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 com.sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

/***  SYBaseViewController 基类控制*/
@interface SYBaseViewController : UIViewController

/**
 *  是否显示返回按钮
 *
 *  @param isShow
 */
- (void)showBackButton:(BOOL)isShow;

/**
 *  隐藏tableView 多余的线
 *
 *  @param tableView tableView
 */
- (void)setExtraCellLineHidden: (UITableView *)tableView;

/**
 *  判断是否为有效手机号码
 *
 *  @param mobileNumber 手机号码
 *
 *  @return Yes or No
 */
- (BOOL)isMobileNumber:(NSString *)mobileNumber;

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

/**
 *  获取当前屏幕高度
 *
 *  @return 高度
 */
- (NSInteger )getCurrentVersionScreenHight;

@end
