# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::colorWithHexString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T1["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S1 -->|calls| T1
  S2["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:204"]
  T2["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S2 -->|calls| T2
  S3["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:204"]
  T3["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S3 -->|calls| T3
  S4["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:204"]
  T4["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S4 -->|calls| T4
  S5["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:204"]
  T5["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S5 -->|calls| T5
  S6["method:JobsAppTools::allocWithZone:<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:33"]
  T6["method:JobsAppTools::sharedManager<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:22"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsAppTools::standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsAppTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:20"]
  T10["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S10 -->|calls| T10
  S11["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:20"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T15["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S15 -->|calls| T15
  S16["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSObject::imageByDataURL<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:46"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T18["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S18 -->|calls| T18
  S19["method:NSString::isContainsUrl<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  T20["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:61"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:61"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:67"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:83"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:99"]
  T25["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
