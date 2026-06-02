# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByStyle3<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T1["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S1 -->|calls| T1
  S2["method:UIButton::initByStyle4<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T2["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S2 -->|calls| T2
  S3["method:UIButton::initByStyle5<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T3["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsInit<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T4["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S4 -->|calls| T4
  S5["method:UIButton::initByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T5["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S5 -->|calls| T5
  S6["method:UIButton::initByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T6["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S6 -->|calls| T6
  S7["method:UIButton::initByButtonModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T7["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S7 -->|calls| T7
  S8["method:UIButton::initByButtonModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T8["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S8 -->|calls| T8
  S9["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T13["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S13 -->|calls| T13
  S14["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T14["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S14 -->|calls| T14
  S15["method:UIButton::selectedAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:454"]
  T15["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S15 -->|calls| T15
  S16["method:UIButton::normalStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:463"]
  T16["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S16 -->|calls| T16
  S17["method:UIButton::highlightedStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  T17["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S17 -->|calls| T17
  S18["method:UIButton::disabledStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:481"]
  T18["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S18 -->|calls| T18
  S19["method:UIButton::selectedStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:490"]
  T19["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S19 -->|calls| T19
  S20["method:UIButton::focusedStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:499"]
  T20["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S20 -->|calls| T20
  S21["method:UIButton::applicationStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:508"]
  T21["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S21 -->|calls| T21
  S22["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T22["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S22 -->|calls| T22
  S23["method:UICollectionView::didSelectItemAtIndexPath:collectionViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:113"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:62"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:82"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
