# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T3["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S3 -->|calls| T3
  S4["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  T4["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  S4 -->|calls| T4
  S5["method:UIView::cleanSubviewBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:22"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::tipsLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:51"]
  T6["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S6 -->|calls| T6
  S7["method:UIView::tipsLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:51"]
  T7["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S7 -->|calls| T7
  S8["method:UIView::tipsTitle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:77"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S8 -->|calls| T8
  S9["method:UIView::JobsRichViewByModel2<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:34"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::JobsRichViewByModel2<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:34"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T12["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:48"]
  T14["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T16["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T17["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  S17 -->|calls| T17
  S18["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T19["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T20["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  S20 -->|calls| T20
  S21["method:UIView::scrollViewShot<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:385"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::makeLabelByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:694"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::viewByID<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:705"]
  T23["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S23 -->|calls| T23
  S24["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:722"]
  T24["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:722"]
  S24 -->|calls| T24
  S25["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  T25["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
