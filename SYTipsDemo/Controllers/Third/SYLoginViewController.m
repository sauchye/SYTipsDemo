//
//  SYLoginViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/18/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo

#import <QuartzCore/QuartzCore.h>
#import "SYLoginViewController.h"
#import "SYRegisterViewController.h"

@interface SYLoginViewController ()
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *pwdTextField;
@property (nonatomic, strong) UIButton *loginBtn;
//@property (nonatomic, strong) UIButton *registerBtn;


@end

@implementation SYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = VString(@"Login");
    UIBarButtonItem *registerBtn = [[UIBarButtonItem alloc] initWithTitle:@"Register" style:UIBarButtonItemStylePlain target:self action:@selector(registerBtnClicked:)];
    self.navigationItem.rightBarButtonItem = registerBtn;

    [self configreView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)configreView{
    CGFloat sapceHeight = 20;
    CGFloat txtHeight = 40;
    CGFloat currentWidth = self.view.frame.size.width;
    _userTextField = [[UITextField alloc] init];
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userTextField.placeholder = @"   please set username:";
    [self.view addSubview:_userTextField];
    
    _pwdTextField = [[UITextField alloc] init];
    _pwdTextField.placeholder = @"   please set six digit password:";
    _pwdTextField.borderStyle = UITextBorderStyleRoundedRect;
    _pwdTextField.secureTextEntry = YES;
    [self.view addSubview:_pwdTextField];
    
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    [_loginBtn setTintColor:[UIColor grayColor]];
    
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius = 5.0;
    _loginBtn.layer.borderColor = kNAVIGATION_BAR_COLOR.CGColor;
    _loginBtn.layer.borderWidth = 1.0;
    
#pragma mark - 核心代码
    [_userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(currentWidth-20, txtHeight));
        //        make.top.mas_equalTo(sapceHeight);
        make.top.equalTo(self.view.mas_top).offset(sapceHeight);
        make.left.mas_equalTo(@10);
    }];
    
    [_pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userTextField.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(currentWidth-20, txtHeight));
        make.left.mas_equalTo(@10);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pwdTextField.mas_bottom).offset(txtHeight);
        make.size.mas_equalTo(CGSizeMake(kCURRENT_SCREEN_WIDTH-20, txtHeight));
        make.left.mas_equalTo(@10);
    }];
    
    //成为第一响应者
    [_userTextField becomeFirstResponder];
    _userTextField.tintColor = _pwdTextField.tintColor= kNAVIGATION_BAR_COLOR;
    _userTextField.clearButtonMode = _pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userTextField.keyboardType = _pwdTextField.keyboardType = UIKeyboardTypeDefault;
    _userTextField.backgroundColor = _pwdTextField.backgroundColor = [UIColor colorWithRed:238.0 green:238.0 blue:244.0 alpha:1.0];
    
    _userTextField.layer.borderWidth = 1;
    _pwdTextField.layer.borderWidth = 1;
    _pwdTextField.layer.borderColor = [UIColor clearColor].CGColor;
    
    
    ViewRadius(_userTextField, 5.0);
    ViewRadius(_pwdTextField, 5.0);

    _userTextField.text = VString(@"sauchye");
    _userTextField.layer.borderColor = [UIColor clearColor].CGColor;
    _pwdTextField.layer.borderColor = [UIColor clearColor].CGColor;
    ViewRadius(_userTextField, 5.0);
    ViewRadius(_pwdTextField, 5.0);
    [_loginBtn setBackgroundColor:kNAVIGATION_BAR_COLOR];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //placeholder color
//    [_userTextField setValue:kNAVIGATION_BAR_COLOR forKeyPath:@"_placeholderLabel.textColor"];
    
    //RAC
//    RAC(self.loginBtn, enabled) = [RACSignal combineLatest:@[self.userTextField.rac_textSignal, self.pwdTextField.rac_textSignal] reduce:^id(NSString *userName, NSString *password) {
//        return @(userName.length > 0  && password.length >= 6 );
//    }];
    
//    [_userTextField addTarget:self action:@selector(updateLoginButton) forControlEvents:UIControlEventEditingChanged];
//    [_pwdTextField addTarget:self action:@selector(updateLoginButton) forControlEvents:UIControlEventEditingChanged];
}




#pragma mark - button Action


- (void)shakeView{
    _pwdTextField.text = nil;
    [self shakeAnimationForView:_pwdTextField isVerticalShake:NO];
    [self shakeAnimationForView:_userTextField isVerticalShake:NO];
    _pwdTextField.layer.borderColor = [UIColor redColor].CGColor;
    _userTextField.layer.borderColor = [UIColor redColor].CGColor;
}

#pragma mark - 抖动效果
- (void)shakeAnimationForView:(UIView *)view isVerticalShake:(BOOL)isVerticalShake{
    
    CALayer *layer = [view layer];
    CGPoint posLbl = [layer position];
    CGPoint x, y;
    
    if (!isVerticalShake) {
        
        y = CGPointMake(posLbl.x - 10, posLbl.y);
        x = CGPointMake(posLbl.x + 10, posLbl.y);
    }else{
        y = CGPointMake(posLbl.x, posLbl.y - 5);
        x = CGPointMake(posLbl.x, posLbl.y + 5);
    }
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.09];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}


#pragma mark - button Action
- (void)loginBtnClicked:(UIButton *)sender{
    
    [sender resignFirstResponder];
    [self.view endEditing:YES];
    if (![_pwdTextField.text isEqualToString:@"Sauchye"]) {
        _pwdTextField.text = @"";
        [self shakeAnimationForView:_pwdTextField isVerticalShake:NO];
        _pwdTextField.layer.borderColor = [UIColor redColor].CGColor;
        [SYHUDView showToView:self.view.window isSuccess:NO text:@"Login Failed" hide:2.0];
    }else{
        _pwdTextField.layer.borderColor = [UIColor clearColor].CGColor;
        [SYHUDView showToView:self.view.window isSuccess:YES text:@"Login Success" hide:2.0];
        [self performSelector:@selector(dissmiss) withObject:nil afterDelay:2.0];
    }
}

#if 0
#pragma mark - borderColor 颜色改变提示
- (void)loginBtnClicked:(UIButton *)sender{
    
    [sender resignFirstResponder];
    [self.view endEditing:YES];
    if (![_pwdTextField.text isEqualToString:@"Sauchye"]) {
        _pwdTextField.layer.borderColor = [UIColor redColor].CGColor;
        _userTextField.layer.borderColor = [UIColor redColor].CGColor;
        _pwdTextField.text = nil;
        [SYHUDView showToView:self.view success:NO text:@"Login Failed" hide:2.0];
    }else{
        
        _pwdTextField.layer.borderColor = [UIColor clearColor].CGColor;
        _userTextField.layer.borderColor = [UIColor clearColor].CGColor;
        [SYHUDView showToView:self.view success:YES text:@"Login Success" hide:2.0];
        [self performSelector:@selector(dissmiss) withObject:nil afterDelay:2.0];
    }
}
#endif



- (void)registerBtnClicked:(UIButton *)sender{
    SYRegisterViewController *registerVC = [[SYRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - backClickedAction
- (void)backClickedAction:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - dealloc
- (void)dealloc{
    //避免延时导致内存泄露
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
