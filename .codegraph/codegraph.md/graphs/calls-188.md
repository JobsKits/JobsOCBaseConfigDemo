# `calls 符号关系 - 188`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DKDevice::unknownWithIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:51"]
  T1["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S1 -->|calls| T1
  S2["method:DKDevice::deviceDescription<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:59"]
  T2["function:DKDeviceTypeDescription<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:11"]
  S2 -->|calls| T2
  S3["method:DKDevice::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:63"]
  T3["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S3 -->|calls| T3
  S4["method:DKDevice::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:63"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:DKDevice::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:72"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:DKDevice::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:72"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:DKDevice::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:72"]
  T7["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S7 -->|calls| T7
  S8["method:DKDevice::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:72"]
  T8["method:DKDevice::deviceDescription<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:59"]
  S8 -->|calls| T8
  S9["method:DKDevice::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:72"]
  T9["method:DKDevice::deviceDescription<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:59"]
  S9 -->|calls| T9
  S10["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  T10["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  S10 -->|calls| T10
  S11["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  T11["function:DKIsSimulatorArch<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:225"]
  S11 -->|calls| T11
  S12["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  T12["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  S12 -->|calls| T12
  S13["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  T13["function:DKIdentifierToTypeMap<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:16"]
  S13 -->|calls| T13
  S14["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  T14["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S14 -->|calls| T14
  S15["function:FSCalendarAssertDateInBounds<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:33"]
  T15["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S15 -->|calls| T15
  S16["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T16["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S16 -->|calls| T16
  S17["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T17["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S17 -->|calls| T17
  S18["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T18["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S18 -->|calls| T18
  S19["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T19["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S19 -->|calls| T19
  S20["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T20["method:FSCalendarCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:90"]
  S20 -->|calls| T20
  S21["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T21["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S21 -->|calls| T21
  S22["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T22["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  S22 -->|calls| T22
  S23["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T23["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S23 -->|calls| T23
  S24["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
