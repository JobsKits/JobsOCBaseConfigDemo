# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T1["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S1 -->|calls| T1
  S2["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T2["method:UIImage::frameDurationAtIndex:source:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:47"]
  S2 -->|calls| T2
  S3["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T3["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S3 -->|calls| T3
  S4["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T4["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S4 -->|calls| T4
  S5["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T5["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S5 -->|calls| T5
  S6["method:UIImage::animatedImageByScalingAndCroppingBySize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:95"]
  T6["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S6 -->|calls| T6
  S7["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T7["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T8["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T9["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T12["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S12 -->|calls| T12
  S13["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T13["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S13 -->|calls| T13
  S14["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  T15["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S15 -->|calls| T15
  S16["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:259"]
  T16["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S16 -->|calls| T16
  S17["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:266"]
  T17["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S17 -->|calls| T17
  S18["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:273"]
  T18["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S18 -->|calls| T18
  S19["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:280"]
  T19["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S19 -->|calls| T19
  S20["method:UITableView::registerTableViewClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:12"]
  T20["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S20 -->|calls| T20
  S21["method:UITableView::byRegisterTableViewClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:17"]
  T21["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S21 -->|calls| T21
  S22["method:UITableView::registerTableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:51"]
  T22["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S22 -->|calls| T22
  S23["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T23["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S23 -->|calls| T23
  S24["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T24["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S24 -->|calls| T24
  S25["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T25["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
