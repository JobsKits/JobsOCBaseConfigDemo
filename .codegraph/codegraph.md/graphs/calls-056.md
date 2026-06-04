# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  T1["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  S1 -->|calls| T1
  S2["method:UIButton::by_setBackgroundColor:forState:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+FillColor/UIButton+FillColor.m:25"]
  T2["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  S2 -->|calls| T2
  S3["method:UIButton::imageURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SDWebImage/UIButton+SDWebImage.m:203"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIButton::imageURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SDWebImage/UIButton+SDWebImage.m:203"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIButton::initByTitle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T5["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S5 -->|calls| T5
  S6["method:UIButton::initByAttributedString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T6["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S6 -->|calls| T6
  S7["method:UIButton::initByNormalImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T7["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S7 -->|calls| T7
  S8["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T8["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S8 -->|calls| T8
  S9["method:UIButton::initByTitles<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T9["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S9 -->|calls| T9
  S10["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T10["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S10 -->|calls| T10
  S11["method:UIButton::initByTitle_font<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T11["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S11 -->|calls| T11
  S12["method:UIButton::initByStyle1<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T12["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S12 -->|calls| T12
  S13["method:UIButton::initByStyle2<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T13["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle3<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T14["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S14 -->|calls| T14
  S15["method:UIButton::initByStyle4<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T15["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S15 -->|calls| T15
  S16["method:UIButton::initByStyle5<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsInit<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T17["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S17 -->|calls| T17
  S18["method:UIButton::initByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T18["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S18 -->|calls| T18
  S19["method:UIButton::initByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T19["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S19 -->|calls| T19
  S20["method:UIButton::initByButtonModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T20["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S20 -->|calls| T20
  S21["method:UIButton::initByButtonModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T21["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S21 -->|calls| T21
  S22["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T22["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S22 -->|calls| T22
  S23["method:UIButton::initByTextModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T23["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S23 -->|calls| T23
  S24["method:UICollectionView::didSelectItemAtIndexPath:collectionViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:113"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:62"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
