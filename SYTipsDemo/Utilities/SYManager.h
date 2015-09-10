//
//  SYManager.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/18/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import <Foundation/Foundation.h>

/***  SYManager 共用管理 */
@interface SYManager : NSObject


/**
 *  空格处理
 *
 *  @return
 */
+ (NSString *)trimWhitespace;
+ (BOOL)isEmptyString:(NSString *)string;

/**
 *  判断是否为有效手机号码
 *
 *  @param mobileNumber 手机号码
 *
 *  @return Yes or No
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNumber;

@end
