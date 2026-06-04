# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T1["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S1 -->|calls| T1
  S2["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T2["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S2 -->|calls| T2
  S3["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  T3["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  S3 -->|calls| T3
  S4["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:LMHWaterFallLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/LMHWaterFallLayout/LMHWaterFallLayout.m:69"]
  T5["method:LMHWaterFallLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/LMHWaterFallLayout/LMHWaterFallLayout.m:69"]
  S5 -->|calls| T5
  S6["method:XZMLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:12"]
  T6["method:XZMLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:12"]
  S6 -->|calls| T6
  S7["method:XZMLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:27"]
  T7["method:XZMLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:27"]
  S7 -->|calls| T7
  S8["method:BaseImageView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:22"]
  T8["method:BaseImageView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:22"]
  S8 -->|calls| T8
  S9["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  T9["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  S9 -->|calls| T9
  S10["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  T10["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S10 -->|calls| T10
  S11["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:55"]
  T11["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:55"]
  S11 -->|calls| T11
  S12["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  T12["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  S12 -->|calls| T12
  S13["function:layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:53"]
  T13["function:layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:53"]
  S13 -->|calls| T13
  S14["function:initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:65"]
  T14["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  S14 -->|calls| T14
  S15["function:label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:94"]
  T15["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S15 -->|calls| T15
  S16["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  T16["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  S16 -->|calls| T16
  S17["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  T17["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  S17 -->|calls| T17
  S18["method:PointLabBaseView::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:43"]
  T18["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  S18 -->|calls| T18
  S19["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T19["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  S19 -->|calls| T19
  S20["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T20["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S20 -->|calls| T20
  S21["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T21["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S21 -->|calls| T21
  S22["method:TMSCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:52"]
  T22["method:UICollectionViewLayoutAttributes::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionViewLayoutAttributes/UICollectionViewLayoutAttributes+Extra/UICollectionViewLayoutAttributes+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  T23["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  S23 -->|calls| T23
  S24["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T24["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  S24 -->|calls| T24
  S25["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
