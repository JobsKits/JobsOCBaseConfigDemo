# JobsCallBackBlockDSL

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsCallBackBlockDSL` 是 `JobsBlock/NSObject+CallBackInfoByBlock` 的链式语法二次封装。

## 用途

- `JobsBlock` 继续负责 Block typedef、关联对象属性和 `actionXxxBlock:` 存取逻辑。
- `JobsCallBackBlockDSL` 只负责 `byXxxBlock(...)` 点语法链式调用，让 callback 配置可以并入 Jobs DSL 的“一链到底”风格。

## 使用

```objc
#import <JobsCallBackBlockDSL/JobsCallBackBlockDSL.h>

object
    .byObjBlock(^(id data) {
        JobsLog(@"%@", data);
    })
    .byRetObjBlock(^id(id data) {
        return data;
    });
```

## 目录

- `JobsCallBackBlockDSL.h`：聚合入口。
- `Core/NSObject+CallBackInfoByBlock+DSL`：`NSObject` callback block DSL 分类。

## 依赖

- `JobsBlock`
- `JobsOCDefs`

## 约束

- DSL Block 必须返回当前 `NSObject`，保证链式语法可以继续。
- 不在本 Pod 内重复定义 Block 类型；新增可复用 typedef 统一放入 `JobsBlock`。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

为 JobsBlock 中 NSObject 的回调属性增加链式设置入口。byVoidBlock、byObjBlock、byStringBlock 及基本类型回调负责保存不同签名的回调，事件触发仍由对象或业务流程负责。

### 1.2、运行脉络

选定回调签名 → 通过 byXxxBlock 设置 → 返回当前对象继续配置 → 在真实事件发生时调用保存的回调。

### 1.3、关键设计与边界

- 设置回调和触发回调必须分开；不能把配置方法写成马上执行闭包。
- 参数和返回类型必须与底层回调属性一致，数字类型不能随意全部折叠为 id。
- 被保存的回调仍需要由使用方明确捕获对象的策略。

### 1.4、阅读与重建顺序

先读底层回调属性，再对照本库同名 DSL 的赋值与返回；重建时先有回调存储，再加配置层。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsCallBackBlockDSL.h](<./JobsCallBackBlockDSL.h>)
- [Core/NSObject+CallBackInfoByBlock+DSL/NSObject+CallBackInfoByBlock+DSL.h](<./Core/NSObject+CallBackInfoByBlock+DSL/NSObject+CallBackInfoByBlock+DSL.h>)

依赖与编译入口：[JobsCallBackBlockDSL.podspec](<./JobsCallBackBlockDSL.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
