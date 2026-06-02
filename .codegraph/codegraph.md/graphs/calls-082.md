# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T8["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  S8 -->|calls| T8
  S9["method:UIView::getFrameWithFreeHight:maxWidth:textSpace:lineSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:150"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T12["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S12 -->|calls| T12
  S13["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  T13["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  S13 -->|calls| T13
  S14["method:UIView::cleanSubviewBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:22"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::tipsLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:51"]
  T15["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S15 -->|calls| T15
  S16["method:UIView::tipsLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:51"]
  T16["method:UILabel::makeLabelByShowingType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:58"]
  S16 -->|calls| T16
  S17["method:UIView::tipsLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:51"]
  T17["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S17 -->|calls| T17
  S18["method:UIView::tipsTitle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:77"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S18 -->|calls| T18
  S19["method:UIView::JobsRichViewByModel2<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:34"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::JobsRichViewByModel2<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:34"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T22["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T24["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
