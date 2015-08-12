//
//  SYHUDView.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/12/15.
//  Copyright (c) 2015 com.sauchye. All rights reserved.
//

#import "SYHUDView.h"
#define kHUD_FONT_SIZE 14.0
@implementation SYHUDView


//纯文字提示
+ (SYHUDView *)showTo:(UIView *)view hide:(NSTimeInterval)time{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.color = [UIColor grayColor];
    hud.labelFont = [UIFont systemFontOfSize:kHUD_FONT_SIZE];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:time];
    return hud;
}

//加载框+文字提示
+ (SYHUDView *)showToProgressAndMessageTips:(UIView *)view{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.color = [UIColor grayColor];
    hud.labelFont = [UIFont systemFontOfSize:kHUD_FONT_SIZE];
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

//是否加载成功+文字提示
+ (SYHUDView *)showToLoadSuccess:(UIView *)view andShowMessage:(NSString *)message hide:(NSTimeInterval)time loadSuccess:(BOOL)isSuccess{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.color = [UIColor grayColor];

    hud.labelText = message;
    hud.labelFont = [UIFont systemFontOfSize:kHUD_FONT_SIZE];
    hud.hidden = time;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hub_success"]];

//    if (isSuccess == YES) { //加载成功
//        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hub_success"]];
//    }else{
//        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hub_error"]];
//    }
    return hud;
}


@end
