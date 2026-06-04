# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTextLabStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:23"]
  T1["method:JobsTextLabStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:23"]
  S1 -->|calls| T1
  S2["method:JobsTextViewStyleCVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:104"]
  T2["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S2 -->|calls| T2
  S3["method:JobsTextViewStyleCVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:130"]
  T3["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S3 -->|calls| T3
  S4["method:TMSWalletCollectionViewCell::titleLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/TMSWalletCollectionViewCell/TMSWalletCollectionViewCell.m:45"]
  T4["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S4 -->|calls| T4
  S5["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  T5["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  S5 -->|calls| T5
  S6["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T6["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S6 -->|calls| T6
  S7["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T7["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S7 -->|calls| T7
  S8["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  T8["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  S8 -->|calls| T8
  S9["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:LMHWaterFallLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/LMHWaterFallLayout/LMHWaterFallLayout.m:69"]
  T10["method:LMHWaterFallLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/LMHWaterFallLayout/LMHWaterFallLayout.m:69"]
  S10 -->|calls| T10
  S11["method:XZMLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:12"]
  T11["method:XZMLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:12"]
  S11 -->|calls| T11
  S12["method:XZMLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:27"]
  T12["method:XZMLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/XZMLayout/XZMLayout.m:27"]
  S12 -->|calls| T12
  S13["method:BaseImageView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:22"]
  T13["method:BaseImageView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:22"]
  S13 -->|calls| T13
  S14["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  T14["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  S14 -->|calls| T14
  S15["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:45"]
  T15["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S15 -->|calls| T15
  S16["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:55"]
  T16["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseImageView/BaseImageView/BaseImageView.m:55"]
  S16 -->|calls| T16
  S17["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  T17["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  S17 -->|calls| T17
  S18["function:layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:53"]
  T18["function:layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:53"]
  S18 -->|calls| T18
  S19["function:initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:65"]
  T19["function:init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:37"]
  S19 -->|calls| T19
  S20["function:label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsBaseLabel/JobsBaseLabel.m:94"]
  T20["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S20 -->|calls| T20
  S21["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  T21["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  S21 -->|calls| T21
  S22["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  T22["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  S22 -->|calls| T22
  S23["method:PointLabBaseView::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:43"]
  T23["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  S23 -->|calls| T23
  S24["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T24["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  S24 -->|calls| T24
  S25["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T25["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
