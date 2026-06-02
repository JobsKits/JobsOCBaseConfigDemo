# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T1["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T2["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  S2 -->|calls| T2
  S3["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T4["method:JXCategoryBaseView::byDelegate<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryBaseView/JXCategoryBaseView+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::byShow<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:65"]
  T5["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  S5 -->|calls| T5
  S6["method:UIView::heightForFooterInSectionByModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:105"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:UIView::scrollViewShot<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:385"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::cornerRadii<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:650"]
  T8["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S8 -->|calls| T8
  S9["method:UIView::makeLabelByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:694"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::makeLabelByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:694"]
  T10["method:UILabel::makeLabelByShowingType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:58"]
  S10 -->|calls| T10
  S11["method:UIView::viewByID<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:705"]
  T11["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S11 -->|calls| T11
  S12["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:722"]
  T12["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:722"]
  S12 -->|calls| T12
  S13["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  T13["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S13 -->|calls| T13
  S14["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  T14["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S14 -->|calls| T14
  S15["method:UIView::getImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:892"]
  T15["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S15 -->|calls| T15
  S16["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T16["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S16 -->|calls| T16
  S17["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T17["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S17 -->|calls| T17
  S18["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T18["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S18 -->|calls| T18
  S19["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T19["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S19 -->|calls| T19
  S20["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T20["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S20 -->|calls| T20
  S21["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T21["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S21 -->|calls| T21
  S22["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T22["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S22 -->|calls| T22
  S23["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T23["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S23 -->|calls| T23
  S24["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T24["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S24 -->|calls| T24
  S25["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:917"]
  T25["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
