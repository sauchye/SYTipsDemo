//
//  SYDefineHeader.h
//  SYTipsDemo
//
//  Created by Sauchye on 8/12/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#ifndef SYTipsDemo_SYDefineHeader_h
#define SYTipsDemo_SYDefineHeader_h



//系统相关
#define kCheckAppLastestVersion @"checkAppLastestVersion"
//app的版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//app build版本号
#define kAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

//app的显示名称
#define kAppDisplayName [[NSBundle mainBundle].localizedInfoDictionary objectForKey:@"CFBundleDisplayName"]

//app的identifier
#define kAppBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define VString(x)      NSLocalizedString(x, nil) //IOS8里String已经作为字符串类

//自定义NSLog
#ifdef DEBUG
#define SYLog(s, ... )   NSLog(@"<%p %@ %s:(%d)>%@",self,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__FUNCTION__,__LINE__,[NSString stringWithFormat:(s),##__VA_ARGS__])
#else
#define SYLog( s, ... )
#endif

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])


//尺寸相关
#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kCURRENT_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kCURRENT_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//图片默认高度
#define kdefaultPhoneHeight 200
// 系统控件默认高度
#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)
#define kTopBarHeight           (44.f)
#define kSTATUS_HEIGHT (20.0f)
#define kTAB_BAR_HEIGHT (49.0f)
#define kNAVIGATION_BAR_HEIGHT (64.0f)
#define kIMAGE_COUNT (4.0f)



//UI相关
#define kNAVIGATION_BAR_COLOR [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


#define kSYAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]


//其他
#define ESWeak(var, weakVar) __weak __typeof(&*var) weakVar = var
#define ESStrong_DoNotCheckNil(weakVar, _var) __typeof(&*weakVar) _var = weakVar
#define ESStrong(weakVar, _var) ESStrong_DoNotCheckNil(weakVar, _var); if (!_var) return;

#define ESWeak_(var) ESWeak(var, weak_##var);
#define ESStrong_(var) ESStrong(weak_##var, _##var);

/** defines a weak `self` named `__weakSelf` */
#define ESWeakSelf      ESWeak(self, __weakSelf);
/** defines a strong `self` named `_self` from `__weakSelf` */
#define ESStrongSelf    ESStrong(__weakSelf, _self);



#endif
