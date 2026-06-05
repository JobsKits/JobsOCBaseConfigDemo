# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:259"]
  T2["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S2 -->|calls| T2
  S3["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:266"]
  T3["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S3 -->|calls| T3
  S4["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:273"]
  T4["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S4 -->|calls| T4
  S5["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:280"]
  T5["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S5 -->|calls| T5
  S6["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T6["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S6 -->|calls| T6
  S7["method:UITableViewHeaderFooterView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:48"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UITextField::getCurrentTextFieldValueByReplacementString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:31"]
  T8["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S8 -->|calls| T8
  S9["method:UITextView::switchs<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  T9["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S9 -->|calls| T9
  S10["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  T10["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S10 -->|calls| T10
  S11["method:UIView::refresh<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:61"]
  T11["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S11 -->|calls| T11
  S12["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  T12["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S12 -->|calls| T12
  S13["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T13["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S13 -->|calls| T13
  S14["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T14["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S14 -->|calls| T14
  S15["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T15["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S15 -->|calls| T15
  S16["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T16["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S16 -->|calls| T16
  S17["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T17["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S17 -->|calls| T17
  S18["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T18["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S18 -->|calls| T18
  S19["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T19["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S19 -->|calls| T19
  S20["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T20["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S20 -->|calls| T20
  S21["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T21["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S21 -->|calls| T21
  S22["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T22["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S22 -->|calls| T22
  S23["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T23["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S23 -->|calls| T23
  S24["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T24["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S24 -->|calls| T24
  S25["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T25["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
