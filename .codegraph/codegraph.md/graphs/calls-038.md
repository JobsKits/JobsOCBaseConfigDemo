# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSArray::mas_commonSuperviewOfViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSArray+MASAdditions.m:142"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSArray::mas_commonSuperviewOfViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSArray+MASAdditions.m:142"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:NSLayoutConstraint::descriptionForObject:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:95"]
  T3["method:MAS_VIEW::mas_key<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:178"]
  S3 -->|calls| T3
  S4["method:NSLayoutConstraint::descriptionForObject:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:95"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:NSLayoutConstraint::descriptionForObject:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:95"]
  T5["method:MAS_VIEW::mas_key<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:178"]
  S5 -->|calls| T5
  S6["method:NSLayoutConstraint::descriptionForObject:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:95"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:MAS_VIEW::mas_makeConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:13"]
  T7["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S7 -->|calls| T7
  S8["method:MAS_VIEW::mas_makeConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:13"]
  T8["method:MASConstraintMaker::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:34"]
  S8 -->|calls| T8
  S9["method:MAS_VIEW::mas_updateConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:20"]
  T9["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S9 -->|calls| T9
  S10["method:MAS_VIEW::mas_updateConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:20"]
  T10["method:MASConstraintMaker::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:34"]
  S10 -->|calls| T10
  S11["method:MAS_VIEW::mas_remakeConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:28"]
  T11["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S11 -->|calls| T11
  S12["method:MAS_VIEW::mas_remakeConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:28"]
  T12["method:MASConstraintMaker::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraintMaker.m:34"]
  S12 -->|calls| T12
  S13["method:MAS_VIEW::mas_left<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:38"]
  T13["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S13 -->|calls| T13
  S14["method:MAS_VIEW::mas_top<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:42"]
  T14["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S14 -->|calls| T14
  S15["method:MAS_VIEW::mas_right<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:46"]
  T15["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S15 -->|calls| T15
  S16["method:MAS_VIEW::mas_bottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:50"]
  T16["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S16 -->|calls| T16
  S17["method:MAS_VIEW::mas_leading<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:54"]
  T17["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S17 -->|calls| T17
  S18["method:MAS_VIEW::mas_trailing<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:58"]
  T18["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S18 -->|calls| T18
  S19["method:MAS_VIEW::mas_width<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:62"]
  T19["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S19 -->|calls| T19
  S20["method:MAS_VIEW::mas_height<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:66"]
  T20["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S20 -->|calls| T20
  S21["method:MAS_VIEW::mas_centerX<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:70"]
  T21["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S21 -->|calls| T21
  S22["method:MAS_VIEW::mas_centerY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:74"]
  T22["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S22 -->|calls| T22
  S23["method:MAS_VIEW::mas_baseline<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:78"]
  T23["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S23 -->|calls| T23
  S24["method:MAS_VIEW::mas_attribute<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:82"]
  T24["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S24 -->|calls| T24
  S25["method:MAS_VIEW::mas_firstBaseline<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:89"]
  T25["method:MASViewAttribute::initWithView:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
