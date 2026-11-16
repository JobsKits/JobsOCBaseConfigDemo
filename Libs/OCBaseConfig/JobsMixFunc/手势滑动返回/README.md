#  <span id="前言">手势滑动返回</span>
## 1、利用rumtime的+load方法，即便不引入头文件，只要Target menbership在工程里，就会起作用； <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
## 2、导航栏的开启还是关闭： <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
    在@implementation BaseViewController的setupNavigationBarHidden决定，
    亦或者在@implementation UIViewController (NavigationBar)的isHiddenNavigationBar属性决定。
    此工具默认导航栏全部隐藏，为了避免一些时机问题带来的冲突
## Disable the onboard gesture recognizer. <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
    self.interactivePopGestureRecognizer.enabled = NO;
    在具体的有Navigation包裹的viewController里面的viewDidLoad周期里面：self.navigationController.interactivePopGestureRecognizer.enabled 
## 相关踩坑： <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
https://blog.csdn.net/zhhelnice/article/details/60580637
https://github.com/forkingdog/FDFullscreenPopGesture/issues/177

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
