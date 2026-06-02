# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GXCardViewCell::initWithReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:42"]
  T1["method:GXCardViewCell::setupView<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:51"]
  S1 -->|calls| T1
  S2["method:GXCardViewCell::setupView<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:51"]
  T2["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S2 -->|calls| T2
  S3["method:GXCardViewCell::panGestureRecognizer:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:56"]
  T3["method:GXCardViewCell::didPanStateEnded<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:92"]
  S3 -->|calls| T3
  S4["method:GXCardViewCell::panGestureRecognizer:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:56"]
  T4["method:GXCardViewCell::restoreCellLocation<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:132"]
  S4 -->|calls| T4
  S5["method:GXCardViewCell::didPanStateEnded<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:92"]
  T5["method:GXCardViewCell::restoreCellLocation<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:132"]
  S5 -->|calls| T5
  S6["method:GXCardViewCell::didCellRemoveFromSuperviewWithDirection:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:143"]
  T6["function:removeFromSuperview<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/3rd/JhtBanner（卡片式滑动效果）/JhtBannerScrollView/JhtBannerScrollView.m:48"]
  S6 -->|calls| T6
  S7["method:GXCardViewCell::removeFromSuperviewSwipe:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:151"]
  T7["method:GXCardViewCell::removeFromSuperviewLeft<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:167"]
  S7 -->|calls| T7
  S8["method:GXCardViewCell::removeFromSuperviewSwipe:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:151"]
  T8["method:GXCardViewCell::removeFromSuperviewRight<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:186"]
  S8 -->|calls| T8
  S9["method:GXCardView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:227"]
  T9["method:GXCardView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:227"]
  S9 -->|calls| T9
  S10["method:GXCardView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:227"]
  T10["method:GXCardView::configCardView<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:240"]
  S10 -->|calls| T10
  S11["method:GXCardView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:232"]
  T11["method:GXCardView::configCardView<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:240"]
  S11 -->|calls| T11
  S12["method:GXCardView::containerView<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:250"]
  T12["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:GXCardView::reloadDataFormIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:306"]
  T13["method:GXCardView::reloadDataFormIndex:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:310"]
  S13 -->|calls| T13
  S14["method:GXCardView::updateLayoutVisibleCellsWithAnimated:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:379"]
  T14["method:GXCardView::updateConstraintsCell:transform:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:414"]
  S14 -->|calls| T14
  S15["method:HAHandleDemoView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:28"]
  T15["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S15 -->|calls| T15
  S16["method:HAHandleDemoView::handleBtnTouchDownAction<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:44"]
  T16["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  S16 -->|calls| T16
  S17["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T17["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S17 -->|calls| T17
  S18["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T18["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S18 -->|calls| T18
  S19["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T19["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S19 -->|calls| T19
  S20["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T20["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  S20 -->|calls| T20
  S21["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T21["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S21 -->|calls| T21
  S22["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T22["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S22 -->|calls| T22
  S23["method:TBCityIconInfo::initWithText:size:color:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconInfo/TBCityIconInfo.m:12"]
  T23["method:CasinoCustomerServiceView::init<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:36"]
  S23 -->|calls| T23
  S24["method:TBCityIconInfo::iconInfoWithText:size:color:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconInfo/TBCityIconInfo.m:21"]
  T24["method:TBCityIconInfo::initWithText:size:color:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconInfo/TBCityIconInfo.m:12"]
  S24 -->|calls| T24
  S25["method:JobsAdNoticeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:18"]
  T25["method:JobsAdNoticeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
