//
//  SYLoginViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/18/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo

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
    UIBarButtonItem *registerBtn = [[UIBarButtonItem alloc] initWithTitle:@"register" style:UIBarButtonItemStylePlain target:self action:@selector(registerBtnClicked:)];
    self.navigationItem.rightBarButtonItem = registerBtn;

    [self showBackButton:YES];
    [self configreUI];
}

- (void)configreUI{
    CGFloat sapceHeight = 20;
    CGFloat txtHeight = 40;
    CGFloat currentWidth = self.view.frame.size.width;
    _userTextField = [[UITextField alloc] init];
    _userTextField.layer.borderColor = [UIColor orangeColor].CGColor;
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userTextField.placeholder = @"please set username:";
    [self.view addSubview:_userTextField];
    
    _pwdTextField = [[UITextField alloc] init];
    _pwdTextField.placeholder = @"please set six digit password:";
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
    //placeholder color  
//    [_userTextField setValue:kNAVIGATION_BAR_COLOR forKeyPath:@"_placeholderLabel.textColor"];
//    [_pwdTextField setValue:kNAVIGATION_BAR_COLOR forKeyPath:@"_placeholderLabel.textColor"];
    
    
    //RAC 
    __weak UIButton *loginBtn = self.loginBtn;
    RAC(self.loginBtn, enabled) = [RACSignal combineLatest:@[self.userTextField.rac_textSignal, self.pwdTextField.rac_textSignal] reduce:^id(NSString *userName, NSString *password) {
        return @(userName.length > 0  && password.length >= 6 );
        [loginBtn setBackgroundColor:kNAVIGATION_BAR_COLOR];
    }];
}

#pragma mark - button Action
- (void)loginBtnClicked:(UIButton *)sender{
    [sender resignFirstResponder];
    [self.view endEditing:YES];
    SYHUDView *hud = [SYHUDView showToView:kKeyWindow];
    hud.labelText = VString(@"please waitting");
    [hud hide:YES afterDelay:2.0];
}

- (void)registerBtnClicked:(UIButton *)sender{
    SYRegisterViewController *registerVC = [[SYRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}


#pragma mark - backClickedAction
- (void)backClickedAction:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
