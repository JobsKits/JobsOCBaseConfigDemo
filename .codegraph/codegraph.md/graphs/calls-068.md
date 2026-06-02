# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S8 -->|calls| T8
  S9["method:NSObject::byData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T9["function:KindOfDicCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:67"]
  S9 -->|calls| T9
  S10["method:NSObject::byData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T10["function:KindOfArrCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:59"]
  S10 -->|calls| T10
  S11["method:NSObject::makeNormaleWebViewByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+HTML/NSObject+HTML.m:73"]
  T11["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSObject::isSizeZero<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T12["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S12 -->|calls| T12
  S13["method:NSObject::isPointZero<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T13["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S13 -->|calls| T13
  S14["method:NSObject::isRectZero<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T14["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S14 -->|calls| T14
  S15["method:NSObject::jobsPushToSysConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:58"]
  T15["method:NSObject::jobsOpenURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:63"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsOpenURL:successCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:74"]
  T16["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsOpenURL:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:84"]
  T17["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsOpenURL:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:94"]
  T18["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S18 -->|calls| T18
  S19["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSObject::logOutPopupVM<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+PopViewToLogOut/NSObject+PopViewToLogOut.m:14"]
  T24["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S24 -->|calls| T24
  S25["method:NSObject::logOutPopupView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+PopViewToLogOut/NSObject+PopViewToLogOut.m:33"]
  T25["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
