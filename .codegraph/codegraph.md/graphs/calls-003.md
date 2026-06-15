# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  T1["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  S1 -->|calls| T1
  S2["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  T2["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  S2 -->|calls| T2
  S3["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  T3["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  S3 -->|calls| T3
  S4["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  T4["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  S4 -->|calls| T4
  S5["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  T5["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  S5 -->|calls| T5
  S6["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  T6["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  S6 -->|calls| T6
  S7["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  T7["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  S7 -->|calls| T7
  S8["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  T8["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  S8 -->|calls| T8
  S9["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  T9["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  S9 -->|calls| T9
  S10["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  T10["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  S10 -->|calls| T10
  S11["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  T11["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  S11 -->|calls| T11
  S12["method:NSString::substringFromIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T12["method:NSString::substringFromIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S12 -->|calls| T12
  S13["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T13["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S13 -->|calls| T13
  S14["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T14["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S14 -->|calls| T14
  S15["method:NSString::range<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T15["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S15 -->|calls| T15
  S16["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T16["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S16 -->|calls| T16
  S17["method:NSString::toast<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T17["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S17 -->|calls| T17
  S18["method:NSString::jobsUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSString::URLRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T19["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T20["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSURL::URLRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T21["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:68"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:88"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S24 -->|calls| T24
  S25["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T25["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
