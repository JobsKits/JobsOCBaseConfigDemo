# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::jobsCanOpenUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:52"]
  T1["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S1 -->|calls| T1
  S2["method:NSString::urlProtect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:65"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSString::jobsURLProtect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:69"]
  T3["method:NSString::remove200BMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:418"]
  S3 -->|calls| T3
  S4["method:NSString::byHttp<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:80"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSString::jobsByHttp<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:84"]
  T5["method:NSString::jobsURLProtect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:69"]
  S5 -->|calls| T5
  S6["method:NSString::byHttps<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:93"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSString::jobsByHttps<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:97"]
  T7["method:NSString::jobsURLProtect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:69"]
  S7 -->|calls| T7
  S8["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  T8["method:ASPhotosFrameworkImageRequest::requestWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPhotosFrameworkImageRequest.mm:96"]
  S8 -->|calls| T8
  S9["method:UIBezierPath::bezierPathWithText:font:andWithDirection:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:12"]
  T9["function:JobsAttributedStringByAttributes<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:37"]
  S9 -->|calls| T9
  S10["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:11"]
  T10["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:302"]
  S10 -->|calls| T10
  S11["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:11"]
  T11["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:311"]
  S11 -->|calls| T11
  S12["function:jobsMakeButton<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.h:139"]
  T12["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S12 -->|calls| T12
  S13["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  T13["method:UIButton::longPressGestureBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:589"]
  S13 -->|calls| T13
  S14["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  T14["method:UIButton::clickBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:579"]
  S14 -->|calls| T14
  S15["method:UIButton::initByCustomType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:58"]
  T15["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S15 -->|calls| T15
  S16["method:UIButton::initBySysType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:62"]
  T16["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S16 -->|calls| T16
  S17["method:UIButton::initByDetailDisclosureType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:66"]
  T17["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S17 -->|calls| T17
  S18["method:UIButton::initByInfoLightType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:70"]
  T18["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S18 -->|calls| T18
  S19["method:UIButton::initByInfoDarkType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:74"]
  T19["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S19 -->|calls| T19
  S20["method:UIButton::initByContactAddType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:78"]
  T20["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S20 -->|calls| T20
  S21["method:UIButton::initByPlainType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:82"]
  T21["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S21 -->|calls| T21
  S22["method:UIButton::initByCloseType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:86"]
  T22["method:UIButton::initByType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:50"]
  S22 -->|calls| T22
  S23["method:UIButton::initByTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T23["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T24["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S24 -->|calls| T24
  S25["method:UIButton::initByTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T25["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
