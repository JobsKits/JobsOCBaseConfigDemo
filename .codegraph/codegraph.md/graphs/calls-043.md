# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T1["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T2["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T3["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T4["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T5["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S5 -->|calls| T5
  S6["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T6["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S6 -->|calls| T6
  S7["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:259"]
  T8["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S8 -->|calls| T8
  S9["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:266"]
  T9["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S9 -->|calls| T9
  S10["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:273"]
  T10["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S10 -->|calls| T10
  S11["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:280"]
  T11["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S11 -->|calls| T11
  S12["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T12["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S12 -->|calls| T12
  S13["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T14["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S14 -->|calls| T14
  S15["method:UITableViewHeaderFooterView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:48"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UITextField::getCurrentTextFieldValueByReplacementString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:31"]
  T16["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S16 -->|calls| T16
  S17["method:UITextField::customSysClearBtn<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:53"]
  T17["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S17 -->|calls| T17
  S18["method:UITextField::placeholderLabel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:18"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S18 -->|calls| T18
  S19["method:UITextField::titleAttributedDataMutArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:57"]
  T19["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S19 -->|calls| T19
  S20["method:UITextView::switchs<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  T20["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S20 -->|calls| T20
  S21["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:21"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
