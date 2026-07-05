# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  T1["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S1 -->|calls| T1
  S2["method:BEMCheckBoxGroup::groupWithCheckBoxes:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:38"]
  T2["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S2 -->|calls| T2
  S3["method:DKApplePencil::applePencilSupportForDevice:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKApplePencil/DKApplePencil.m:13"]
  T3["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  S3 -->|calls| T3
  S4["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  T4["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  S4 -->|calls| T4
  S5["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  T5["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S5 -->|calls| T5
  S6["method:FSCalendarCalculator::initWithCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:35"]
  T6["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S6 -->|calls| T6
  S7["method:FSCalendarCalculator::dateForIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:96"]
  T7["method:FSCalendarCalculator::dateForIndexPath:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:76"]
  S7 -->|calls| T7
  S8["method:FSCalendarCalculator::indexPathForDate:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:102"]
  T8["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S8 -->|calls| T8
  S9["method:FSCalendarCalculator::indexPathForDate:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:107"]
  T9["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S9 -->|calls| T9
  S10["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:142"]
  T10["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S10 -->|calls| T10
  S11["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  T11["method:FSCalendarCalculator::clearCaches<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:277"]
  S11 -->|calls| T11
  S12["method:FSCalendarCalculator::didReceiveNotifications:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:287"]
  T12["method:FSCalendarCalculator::clearCaches<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:277"]
  S12 -->|calls| T12
  S13["method:FSCalendarCell::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:29"]
  T13["method:FSCalendarCell::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:47"]
  S13 -->|calls| T13
  S14["method:FSCalendarCell::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:38"]
  T14["method:FSCalendarCell::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:47"]
  S14 -->|calls| T14
  S15["method:FSCalendarCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:90"]
  T15["method:FSCalendarCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:90"]
  S15 -->|calls| T15
  S16["method:FSCalendarCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:156"]
  T16["method:FSCalendarCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:156"]
  S16 -->|calls| T16
  S17["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  T17["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S17 -->|calls| T17
  S18["method:FSCalendarCell::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:346"]
  T18["method:FSCalendarBlankCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:460"]
  S18 -->|calls| T18
  S19["method:FSCalendarCell::setSubtitle:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:355"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  T20["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  S20 -->|calls| T20
  S21["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:FSCalendarEventIndicator::setNumberOfEvents:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:448"]
  T25["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
