# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTitleImageView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:49"]
  T1["method:JXCategoryTitleImageView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:49"]
  S1 -->|calls| T1
  S2["method:JXCategoryTitleImageView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:74"]
  T2["method:JXCategoryTitleImageView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:74"]
  S2 -->|calls| T2
  S3["method:JXCategoryTitleImageView::refreshLeftCellModel:rightCellModel:ratio:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:84"]
  T3["method:JXCategoryTitleImageView::refreshLeftCellModel:rightCellModel:ratio:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/TitleImage/JXCategoryTitleImageView.m:84"]
  S3 -->|calls| T3
  S4["method:MASCompositeConstraint::multipliedBy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:50"]
  T4["method:MASCompositeConstraint::multipliedBy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:50"]
  S4 -->|calls| T4
  S5["method:MASCompositeConstraint::dividedBy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:59"]
  T5["method:MASCompositeConstraint::dividedBy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:59"]
  S5 -->|calls| T5
  S6["method:MASCompositeConstraint::priority<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:70"]
  T6["method:MASCompositeConstraint::priority<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:70"]
  S6 -->|calls| T6
  S7["method:MASCompositeConstraint::equalToWithRelation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:81"]
  T7["method:MASCompositeConstraint::equalToWithRelation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:81"]
  S7 -->|calls| T7
  S8["method:MASCompositeConstraint::addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:92"]
  T8["method:MASCompositeConstraint::constraint:addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:40"]
  S8 -->|calls| T8
  S9["method:MASCompositeConstraint::animator<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:101"]
  T9["method:MASCompositeConstraint::animator<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:101"]
  S9 -->|calls| T9
  S10["method:MASCompositeConstraint::key<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:112"]
  T10["method:MASCompositeConstraint::key<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:112"]
  S10 -->|calls| T10
  S11["method:MASCompositeConstraint::activate<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:157"]
  T11["method:MASCompositeConstraint::activate<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:157"]
  S11 -->|calls| T11
  S12["method:MASCompositeConstraint::deactivate<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:163"]
  T12["method:MASCompositeConstraint::deactivate<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:163"]
  S12 -->|calls| T12
  S13["method:MASCompositeConstraint::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:169"]
  T13["method:MASCompositeConstraint::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:169"]
  S13 -->|calls| T13
  S14["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  T14["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S14 -->|calls| T14
  S15["method:MASConstraint::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:20"]
  T15["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S15 -->|calls| T15
  S16["method:MASConstraint::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:20"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:MASConstraint::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:20"]
  T17["method:MASConstraint::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:20"]
  S17 -->|calls| T17
  S18["method:MASConstraint::valueOffset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:123"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:MASConstraint::setLayoutConstantWithValue:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:138"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:MASConstraintMaker::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:34"]
  T20["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S20 -->|calls| T20
  S21["method:MASConstraintMaker::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:34"]
  T21["method:MASCompositeConstraint::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:169"]
  S21 -->|calls| T21
  S22["method:MASConstraintMaker::constraint:addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:58"]
  T22["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S22 -->|calls| T22
  S23["method:MASConstraintMaker::constraint:addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:58"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:MASConstraintMaker::constraint:addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:58"]
  T24["method:MASConstraintMaker::constraint:shouldBeReplacedWithConstraint:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:52"]
  S24 -->|calls| T24
  S25["method:MASConstraintMaker::addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:133"]
  T25["method:MASConstraintMaker::constraint:addConstraintWithLayoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
