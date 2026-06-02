# `DeviceKitByObjc@Pods`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`DeviceKitByObjc@Pods` 是一个本地 [**CocoaPods**](https://cocoapods.org/) Pod，用于把 `Support/Device.generated.swift` 中的设备映射数据转成 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 能力。

## 一、目录结构

```text
DeviceKitByObjc@Pods/
├── Core/
│   ├── DKApplePencil/
│   ├── DKBattery/
│   ├── DKDevice/
│   ├── DKDeviceType/
│   ├── DKDiskSpace/
│   └── DKIdentifierMap/
├── Resources/
│   └── PrivacyInfo.xcprivacy
├── Support/
│   ├── Device.generated.swift
│   └── generate_devicekit_oc.py
├── DeviceKitByObjc.h
├── DeviceKitByObjc.podspec
├── LICENSE
└── README.md
```

## 二、使用方式

```ruby
pod 'DeviceKitByObjc', :path => 'path/to/DeviceKitByObjc@Pods'
```

```objc
#import <DeviceKitByObjc/DeviceKitByObjc.h>
```

## 三、`Core` / `Support` 边界

| 目录 | 职责 | 是否参与编译 |
| --- | --- | --- |
| `Core` | 对外暴露的 Objective-C 源码和头文件 | 是 |
| `Resources` | 隐私清单等资源文件 | 是 |
| `Support` | 生成器和上游 Swift 数据源 | 否，仅 `preserve_paths` 保留 |

## 四、验证方式

```shell
ruby -c DeviceKitByObjc.podspec
```

```shell
pod lib lint DeviceKitByObjc.podspec --allow-warnings --verbose
```

## 五、风险说明

- `Support/generate_devicekit_oc.py` 当前不进入 `source_files`，需要重新生成 `Core` 代码时再手动执行。
- `Resources/PrivacyInfo.xcprivacy` 已通过 `resource_bundles` 纳入 Pod。
