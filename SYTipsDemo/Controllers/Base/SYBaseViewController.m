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

- (void)showBackButton{
    //系统返回按钮
    //    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backActionClicked:)];
    //        temporaryBarButtonItem.title = @"返回";
    
    //自定义返回按钮
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickedAction:)];
    temporaryBarButtonItem.title = _backBtnTitle;
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)backClickedAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - isMobileNumber
- (BOOL)isMobileNumber:(NSString *)mobileNumber{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNumber] == YES)
        || ([regextestcm evaluateWithObject:mobileNumber] == YES)
        || ([regextestct evaluateWithObject:mobileNumber] == YES)
        || ([regextestcu evaluateWithObject:mobileNumber] == YES)){
        
        return YES;
    }else{
        return NO;
    }
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

#pragma mark - getVersionCurrentScreenHight
- (NSInteger )getCurrentVersionScreenHight{
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0){
        return 64.0f;
    }else{
        return 44.0f;
    }
}

#pragma mark - trimWhitespace 解决空格判断
- (NSString *)trimWhitespace{
    NSMutableString *str = [self mutableCopy];
    CFStringTrimWhitespace((__bridge CFMutableStringRef)str);
    return str;
}

- (BOOL)isEmptyString:(NSString *)string{
    
    return [[self trimWhitespace] isEqualToString:@""];
}

#pragma mark - showStatusLoading
- (void)showStatusLoading{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)hideStatusLoading{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
