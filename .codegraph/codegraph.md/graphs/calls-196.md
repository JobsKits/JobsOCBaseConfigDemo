# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T1["method:FMBannerAdsModel::byHighlightImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1667"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T2["method:UIButtonModel::byHighlightBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1730"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T4["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S4 -->|calls| T4
  S5["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S5 -->|calls| T5
  S6["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T6["method:NSString::isContainsUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:266"]
  S6 -->|calls| T6
  S7["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T7["method:NSObject::imageByDataURL<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:45"]
  S7 -->|calls| T7
  S8["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S8 -->|calls| T8
  S9["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S9 -->|calls| T9
  S10["method:NSString::widthBy<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:13"]
  T10["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S10 -->|calls| T10
  S11["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T11["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:18"]
  S11 -->|calls| T11
  S12["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T12["method:NSObject::byViewModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:197"]
  S12 -->|calls| T12
  S13["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T13["method:UIBackgroundConfiguration::byImage<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:65"]
  S13 -->|calls| T13
  S14["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T14["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S14 -->|calls| T14
  S15["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T15["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S15 -->|calls| T15
  S16["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T16["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S16 -->|calls| T16
  S17["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T17["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S17 -->|calls| T17
  S18["method:JobsBasePopupView::jobsRichViewByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:35"]
  T18["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S18 -->|calls| T18
  S19["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:56"]
  T19["function:JobsMainScreen_WIDTH<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:304"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:56"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:56"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T22["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T23["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T24["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T25["method:UITextView::byTextAlignment<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
