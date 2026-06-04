# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BEMCheckBox::setTintColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:181"]
  T1["method:BEMCheckBox::drawOffBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:266"]
  S1 -->|calls| T1
  S2["method:BEMCheckBox::setOnTintColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:186"]
  T2["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S2 -->|calls| T2
  S3["method:BEMCheckBox::setOnFillColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:191"]
  T3["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S3 -->|calls| T3
  S4["method:BEMCheckBox::setOffFillColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:196"]
  T4["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S4 -->|calls| T4
  S5["method:BEMCheckBox::setOnCheckColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:201"]
  T5["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S5 -->|calls| T5
  S6["method:BEMCheckBox::handleTapCheckBox:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:207"]
  T6["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S6 -->|calls| T6
  S7["method:BEMCheckBox::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:223"]
  T7["method:BEMCheckBox::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:223"]
  S7 -->|calls| T7
  S8["method:BEMCheckBox::drawRect:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:244"]
  T8["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S8 -->|calls| T8
  S9["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T9["method:BEMCheckBox::drawOffBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:266"]
  S9 -->|calls| T9
  S10["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T10["method:BEMCheckBox::drawOnBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:282"]
  S10 -->|calls| T10
  S11["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T11["method:BEMCheckBox::drawCheckMark<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:297"]
  S11 -->|calls| T11
  S12["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  T12["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S12 -->|calls| T12
  S13["method:BEMCheckBoxGroup::groupWithCheckBoxes:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:38"]
  T13["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S13 -->|calls| T13
  S14["method:DKApplePencil::applePencilSupportForDevice:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKApplePencil/DKApplePencil.m:13"]
  T14["function:DKApplePencilSupportForType<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDeviceType/DKDeviceType.m:139"]
  S14 -->|calls| T14
  S15["method:DKBattery::batteryState<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKBattery/DKBattery.m:16"]
  T15["method:DKBatteryState::unknown<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:15"]
  S15 -->|calls| T15
  S16["method:DKBattery::batteryState<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKBattery/DKBattery.m:16"]
  T16["method:DKBatteryState::full<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:16"]
  S16 -->|calls| T16
  S17["method:DKBattery::batteryState<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKBattery/DKBattery.m:16"]
  T17["method:DKBatteryState::unknown<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:15"]
  S17 -->|calls| T17
  S18["method:DKBattery::batteryState<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKBattery/DKBattery.m:16"]
  T18["method:DKBatteryState::unknown<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:15"]
  S18 -->|calls| T18
  S19["method:DKBatteryState::unknown<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:15"]
  T19["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S19 -->|calls| T19
  S20["method:DKBatteryState::full<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:16"]
  T20["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S20 -->|calls| T20
  S21["method:DKBatteryState::charging:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:17"]
  T21["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S21 -->|calls| T21
  S22["method:DKBatteryState::unplugged:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:18"]
  T22["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S22 -->|calls| T22
  S23["method:DKDevice::current<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:34"]
  T23["method:DKDevice::_machineIdentifier<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:27"]
  S23 -->|calls| T23
  S24["method:DKDevice::deviceWithIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:39"]
  T24["function:DKMapIdentifierToDevice<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKIdentifierMap/DKIdentifierMap.m:229"]
  S24 -->|calls| T24
  S25["method:DKDevice::simulatorWithSimulatedDevice:<br/>JobsByPods/ManualByOCPods@Pods/DeviceKit/Core/DKDevice/DKDevice.m:43"]
  T25["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
