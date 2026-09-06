# `JobsOCPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsOCPatch` 是 Jobs OC 工程里的本地 Runtime Patch Pod。第一版只支持把指定类的指定实例方法临时替换为本地 payload 返回方法，并提供 rollback 能力。

## 一、Pod 定位

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCPatch` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec` |

## 二、适用场景

- 本地 Demo 演示 Objective-C Runtime 热更新思想。
- 页面级临时 patch：进入页面安装，离开页面 rollback。
- 后续可扩展网络补丁、签名校验、白名单 selector 和脚本解释层。

## 三、目录结构

```text
JobsOCPatch@Pods/
├── JobsOCPatch.h
├── JobsOCPatch.podspec
├── JobsPodspecKit.rb
├── Core/
│   ├── JobsOCPatchModel.h
│   ├── JobsOCPatchModel.m
│   ├── JobsOCPatchMgr.h
│   └── JobsOCPatchMgr.m
├── LICENSE
└── README.md
```

## 四、公开能力

- `JobsOCPatchModel`：描述 patch 的 identifier、target class、selector 和 payload。
- `JobsOCPatchMgr`：安装、回滚、查询 patch。

## 五、风险说明

- 当前能力属于高风险 Runtime 演示能力，不建议提交 App Store。
- 第一版只支持 payload provider，不支持任意 ObjC 消息派发或 JS 脚本执行。
- 调用方必须确保 selector 的返回类型和 payload block 返回类型一致。

## 六、验证方式

```shell
ruby -c JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec
pod install --no-repo-update
```

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分

以 PatchModel 描述 identifier、目标类、selector 与 payload，由管理器记录原始 IMP、安装替换并提供查询和回滚。当前定位是受限的 Runtime 演示，不是任意脚本执行框架。

### 7.2、运行脉络

构造补丁模型 → 安装并保存原实现 → 指定调用返回 payload → 按标识回滚或全部回滚。

### 7.3、关键设计与边界

- selector 返回类型必须与 payload Block 一致，不能任意扩展成通用消息派发。
- 标识、目标方法和原始 IMP 的记录关系决定能否准确回滚。
- 现有 README 已明确高风险演示边界，重建时不要扩张为生产热更新承诺。

### 7.4、阅读与重建顺序

先看模型与支持的签名，再看安装记录、查询、回滚；保留原实现恢复路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCPatch.h](<./JobsOCPatch.h>)
- [Core/JobsOCPatchMgr/JobsOCPatchMgr.h](<./Core/JobsOCPatchMgr/JobsOCPatchMgr.h>)
- [Core/JobsOCPatchModel/JobsOCPatchModel.h](<./Core/JobsOCPatchModel/JobsOCPatchModel.h>)

依赖与编译入口：[JobsOCPatch.podspec](<./JobsOCPatch.podspec>)。其中显式依赖声明包括 `JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
