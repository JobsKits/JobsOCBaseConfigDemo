# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T1["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T2["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:NSString::urlProtect<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T3["method:NSString::containsString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S3 -->|calls| T3
  S4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSURL::normalURLPlus<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSURL::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T6["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIButton::initByTitle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T7["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S7 -->|calls| T7
  S8["method:UIButton::initByAttributedString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T8["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S8 -->|calls| T8
  S9["method:UIButton::initByNormalImage<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T9["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S9 -->|calls| T9
  S10["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T10["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S10 -->|calls| T10
  S11["method:UIButton::initByTitles<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T11["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S11 -->|calls| T11
  S12["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T12["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S12 -->|calls| T12
  S13["method:UIButton::initByTitle_font<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T13["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle1<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T14["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S14 -->|calls| T14
  S15["method:UIButton::initByStyle2<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T15["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S15 -->|calls| T15
  S16["method:UIButton::initByStyle3<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:UIButton::initByStyle4<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T17["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S17 -->|calls| T17
  S18["method:UIButton::initByStyle5<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T18["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsInit<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T19["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S19 -->|calls| T19
  S20["method:UIButton::initByViewModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T20["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S20 -->|calls| T20
  S21["method:UIButton::initByViewModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T21["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S21 -->|calls| T21
  S22["method:UIButton::initByButtonModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T22["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S22 -->|calls| T22
  S23["method:UIButton::initByButtonModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T23["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTextModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:UIButton::initByTextModel<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
