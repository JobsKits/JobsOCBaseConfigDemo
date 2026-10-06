# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T1["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T2["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T3["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S3 -->|calls| T3
  S4["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T4["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S4 -->|calls| T4
  S5["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T5["method:FMBannerAdsModel::byNormalImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1649"]
  S5 -->|calls| T5
  S6["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T6["method:FMBannerAdsModel::byHighlightImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1667"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T7["method:UIButtonModel::byHighlightBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1730"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T9["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S9 -->|calls| T9
  S10["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S10 -->|calls| T10
  S11["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T11["method:NSString::isContainsUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:266"]
  S11 -->|calls| T11
  S12["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T12["method:NSObject::imageByDataURL<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:45"]
  S12 -->|calls| T12
  S13["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S13 -->|calls| T13
  S14["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S14 -->|calls| T14
  S15["method:NSString::widthBy<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:13"]
  T15["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S15 -->|calls| T15
  S16["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T16["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:18"]
  S16 -->|calls| T16
  S17["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T17["method:NSObject::byViewModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:197"]
  S17 -->|calls| T17
  S18["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T18["method:UIBackgroundConfiguration::byImage<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:65"]
  S18 -->|calls| T18
  S19["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T19["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T20["method:JobsBitsMonitorSuspendLab::byText<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab/JobsBitsMonitorSuspendLab.m:160"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T21["method:JobsBitsMonitorSuspendLab::byText<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab/JobsBitsMonitorSuspendLab.m:160"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T22["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T23["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T24["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T25["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
