### About SYTipsDemo

a lot of iOS Project Tips



### TODO(you can gain a little useful skill)

- setStatusBarStyle(自定义状态栏) </br>

 ```
 AppDelegat
[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
		 
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

SYBaseNavigationController

    [self.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTranslucent:NO];    
   ```  
    plist添加：
    1.View controller-based status bar appearance 设置为NO;
    2.Status bar is initially hidden 设置成YES
    详情:请参考SYTipsDemo
     
* set PanGestureRecognizer back(设置全屏手势右滑返回) 

   		- (void)setPan{

   		 id target = self.interactivePopGestureRecognizer.delegate;    
  		  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
  	  pan.delegate = self;
    
  	  [self.view addGestureRecognizer:pan];
  		self.interactivePopGestureRecognizer.enabled = NO;
  	  }

		- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
  	 	 if (self.childViewControllers.count == 1) {
  	     	 return NO;
 	 	    }
  	 	 return YES;
		}  

    
   
   详情:<a href = "https://github.com/sauchye/SYTipsDemo/blob/master/SYTipsDemo/Base/SYBaseNavigationController.m">设置全屏手势右滑返回</a>
    	参考:<a href = "http://www.jianshu.com/p/bc85a3d37519">戳</a>
    
* package MBProgrssHUD(封装MBProgressHUD，更易用)<br/>

	
		+ (SYHUDView *)showToView:(UIView *)view text:(NSString *)text hide:(NSTimeInterval)time;

		+ (SYHUDView *)showToBottomView:(UIView *)view text:(NSString *)text hide:(NSTimeInterval)time;
       
		+ (SYHUDView *)showToView:(UIView *)view success:(BOOL)isSuccess  text:(NSString *)text hide:(NSTimeInterval)time;

		+ (SYHUDView *)showToView:(UIView *)view customImage:(UIImage *)image text:(NSString *)text hide:(NSTimeInterval)time;
		
		+ (SYHUDView *)showToView:(UIView *)view;
	
	Example, easy use:
	
	 	
	 	[SYHUDView showToView:self.view text:@"Success" hide:2.0];
	
		[SYHUDView showToView:self.view success:YES text:@"Success" hide:2.0];
    
    	[SYHUDView showToBottomView:self.view text:@"bottom Success" hide:2.0];
    
    	[SYHUDView showToView:self.view customImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage" hide:2.0];
    
    	SYHUDView *hud = [SYHUDView showToView:self.view];
    
    	[hud hide:YES afterDelay:2.0]; 

    And has many not finished...

* welcome to star, fork, pull request or issues.



### Expection

a skill and and more and more you can get(such as a project style...)

### Libraries

<a href="https://github.com/robbdimitrov/RDVTabBarController">RDVTabBarController</a>

<a href="https://github.com/SnapKit/Masonry">Masonry</a>

<a href="https://github.com/jdg/MBProgressHUD">MBProgressHUD</a>



<a href="https://github.com/ReactiveCocoa/ReactiveCocoa">ReactiveCocoa</a>

<a href="https://github.com/TTTAttributedLabel/TTTAttributedLabel">TTTAttributedLabel</a>

<a href="https://github.com/michaeltyson/TPKeyboardAvoiding">TPKeyboardAvoiding</a></br>

<a href="https://github.com/jaydee3/JDStatusBarNotification">JDStatusBarNotification</a>



### License

SYTipsDemo is licensed under the MIT License.