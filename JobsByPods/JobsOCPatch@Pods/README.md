# `JobsOCPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
