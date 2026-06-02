# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::addNewlines<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::cor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T2["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S2 -->|calls| T2
  S3["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T3["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S3 -->|calls| T3
  S4["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T4["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S4 -->|calls| T4
  S5["method:NSString::substringByRange<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T5["method:NSString::substringWithRange<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S5 -->|calls| T5
  S6["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T6["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S6 -->|calls| T6
  S7["method:NSString::range<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T7["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S7 -->|calls| T7
  S8["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T8["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S8 -->|calls| T8
  S9["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSString::URLRequest<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T10["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T11["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSString::urlProtect<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T12["method:NSString::containsString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S12 -->|calls| T12
  S13["method:BaseButton::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:31"]
  T13["method:BaseButton::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:31"]
  S13 -->|calls| T13
  S14["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:43"]
  T14["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:43"]
  S14 -->|calls| T14
  S15["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:53"]
  T15["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:53"]
  S15 -->|calls| T15
  S16["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:53"]
  T16["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  S16 -->|calls| T16
  S17["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:53"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:76"]
  T18["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:76"]
  S18 -->|calls| T18
  S19["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:76"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:76"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:76"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T22["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S22 -->|calls| T22
  S23["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T23["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S23 -->|calls| T23
  S24["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T24["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S24 -->|calls| T24
  S25["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T25["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
