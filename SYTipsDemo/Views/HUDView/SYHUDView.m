//
//  SYHUDView.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/12/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYHUDView.h"

@implementation SYHUDView

#define kHudDetailFontSize 14.0
#define kHudFontSize 15.0
#define kHudFont(fontSize) [UIFont systemFontOfSize:fontSize]
#define Image(imageName) [UIImage imageNamed:imageName]
#define kSYHUDViewAnimationTime 1.6


//中间纯文字提示
+ (SYHUDView *)showTo:(UIView *)view hide:(NSTimeInterval)time{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.labelFont = kHudFont(kHudDetailFontSize);
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationZoom;
    [hud hide:YES afterDelay:time];
    return hud;
}

//底部纯文字提示
+ (SYHUDView *)showToBottomView:(UIView *)view hide:(NSTimeInterval)time{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.labelFont = kHudFont(kHudDetailFontSize);
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.0f;
    CGFloat bottomSpaceY = 0.0;
    if (kCURRENT_SCREEN_HEIGHT == 480) {
        bottomSpaceY = 150.0f;
    }else if(kCURRENT_SCREEN_HEIGHT == 568){
        bottomSpaceY = 180.0f;
    }else{
        bottomSpaceY = 200.0f;
    }
    hud.yOffset = bottomSpaceY;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationZoom;
    [hud hide:YES afterDelay:time];
    return hud;
}


//加载框+文字提示
+ (SYHUDView *)showToView:(UIView *)view{
    SYHUDView *hud = [SYHUDView showHUDAddedTo:view animated:YES];
    hud.labelFont = kHudFont(kHudDetailFontSize);
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

//是否加载成功+文字提示
+ (SYHUDView *)showToLoadSuccess:(UIView *)view isLoadSuccess:(BOOL)isSuccess{
    SYHUDView *hud = [[SYHUDView alloc] initWithView:view];
    [view addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.labelFont = kHudFont(kHudFontSize);
    hud.hidden = time;
    if (isSuccess == YES) { //加载成功
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hub_success"]];
    }else{
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hub_error"]];
    }
    return hud;
}

//自定义图片显示+文字提示
+ (SYHUDView *)showToLoadSuccess:(UIView *)view Image:(UIImage *)image{
    
    SYHUDView *hud = [[SYHUDView alloc] initWithView:view];
    [view addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.labelFont = kHudFont(kHudFontSize);
    hud.hidden = time;
    return hud;
}


//自定义图片 玩的不够6  如：成功图片+文字提示，您可以封装在此，多谢
#if 0
- (NSTimeInterval)delayTime:(NSString *)string{
    if (string.length>25) { //大于40个字就返回2.5s
        return 2.0;
    }else if(string.length>40) { //大于40个字就返回2.6s
        return 2.6;
    }
    return kSYHUDViewAnimationTime;
}

-  (void)setImage:(NSString *)imageName
             text:(NSString *)text
            delay:(CGFloat)time{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:Image(imageName)];
    self.customView = imageView;
    self.mode = MBProgressHUDModeCustomView;
    self.labelText = text;
    self.labelFont = [UIFont systemFontOfSize:kHudFontSize];
    self.detailsLabelFont = [UIFont systemFontOfSize:kHudDetailFontSize];
    [self hide:YES afterDelay:time];
}

-  (void)setImage:(NSString *)imageName
             text:(NSString *)text
           detail:(NSString *)detail
            delay:(CGFloat)time{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:Image(imageName)];
    self.customView = imageView;
    self.mode = MBProgressHUDModeCustomView;
    self.labelText = text;
    self.labelFont = [UIFont systemFontOfSize:kHudFontSize];
    self.detailsLabelFont = [UIFont systemFontOfSize:kHudDetailFontSize];
    self.detailsLabelText = detail;
    [self hide:YES afterDelay:time];
}

-  (void)setImage:(NSString *)imageName
             text:(NSString *)text{
    [self setImage:imageName text:text delay:[self delayTime:text]];
}

-  (void)showSuccessedLabelText:(NSString *)text{
    [self setImage:@"hub_success" text:text];
}

-  (void)showFailurLabelText:(NSString *)text{
    [self setImage:@"hub_error" text:text];
}

-  (void)showFailurLabelText:(NSString *)text
                      detail:(NSString *)detail{
    [self setImage:@"hub_error" text:text detail:detail delay:[self delayTime:detail]];
}

#endif

@end
