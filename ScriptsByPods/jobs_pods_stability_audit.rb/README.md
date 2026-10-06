# 自建 Pods 只读静态门禁

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

使用已安装 [**CocoaPods**](https://cocoapods.org/) 的 `Pod::Specification`、iOS consumer 和 `FileAccessor` 求值本地 podspec，展开真实源码、公开/私有头、资源和依赖。脚本不安装依赖，不编译、不重建索引，也不修改源码、podspec 或第三方；只写指定 JSON 报告。执行范围是可信的本工程本地 podspec，因为 podspec 本身是 Ruby 程序。

## 一、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在工程根目录执行：

```shell
ruby ScriptsByPods/jobs_pods_stability_audit.rb/jobs_pods_stability_audit.rb \
  --output /tmp/jobs-pods-stability-audit.json
ruby ScriptsByPods/jobs_pods_stability_audit.rb/Tests/run_regression.rb
```

默认工程目录由脚本位置推导，不依赖当前工作目录；默认输出为同目录 `audit.json`，默认 baseline 为 `baseline.json`。`--root`、`--baseline` 可显式指定路径，`--output -` 输出纯 JSON。系统 Ruby 没有 CocoaPods 时，复用现有 Homebrew Ruby/CocoaPods 环境，不下载或安装 Gem。

退出码 `0` 表示没有新的未接受失败；`1` 表示检查失败；`2` 表示依赖环境、baseline JSON 或报告 I/O 无法使用。每次构建阶段之前调用本脚本，非零即停止后续构建。

## 二、实际检查与证据 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

|检查|行为与边界|
|---|---|
|Pod 配置与依赖|求值全部自建 Pod 的所有可选 iOS production subspec，排除 test/app specs；检查清单漂移、源码越界、测试进入生产、内部依赖环。不是只检查当前 Podfile 选中的 subspec|
|Core/Support|记录实际 compiled/public/private 数量；公开 Core 头引用本 Pod Support 时生成精确文件对。单 Pod 内同名 public header 是冲突，跨 module 的同名头单独记录|
|公开 Core 导出（H03）|公开根聚合头及 Core 头显式 `#import <当前Pod/头名.h>` 或 `#include` 时，若该头对应当前 Pod 的物理 Core 头，CocoaPods FileAccessor 必须实际导出同名 public header；Project 或 private 漏挂载直接失败，不能靠宽泛 Header Search Paths 掩盖。只检查显式同 module 的角括号引用，忽略注释、其它 module、Support 头与实现文件里的私有导入|
|已知重复 IMP|对 Jobs 所属 Objective-C 实现做词法定位，忽略声明、注释、字符串：`byObjBlock` 唯一归 JobsBlock；`chinaTime`、显式单位时间转换唯一归 JobsModel；`isExpired`、`readableTimeByFormatter` 唯一归 JobsTimeUtils。不是全语言 AST/ABI 检查|
|helper 指纹|记录原始 SHA256 和只归一化模块名后的 SHA256；108 个现有 helper 汇总为 19 个行为版本。新增、删除或已知 helper 的归一化内容变化须重新审阅|
|资源|按 app 或命名 bundle 输出名称分组；不同内容同名失败，同字节共享资源只记录；本地化保留 `.lproj`，xib/storyboard 按编译目标名称检查。asset catalog 只记目录名称，不把内部 Contents.json 当平铺资源；不宣称已检测所有编译后 asset 名冲突|
|隐私|解析实际 PrivacyInfo 清单，核对 category/reason 和 production 资源包含关系；在 Jobs 自有生产 `.m/.mm` 中定位 Apple required-reason API 候选。词法命中须结合实际用途人工核验|

隐私理由范围按 2026-10-05 的 [**Apple required-reason API 官方说明**](https://developer.apple.com/documentation/bundleresources/describing-use-of-required-reason-api)记录在脚本 `REASONS`。SystemBootTime 候选仅包含 `systemUptime`、`mach_absolute_time`；`CACurrentMediaTime` 不据此判缺。清单格式和理由存在不等于用途合规证明；声明但词法未命中的类别在 JSON 保留，可人工判断是否来自宏、依赖或应删除。

## 三、显式 baseline 与回归 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`baseline.json` 显式列出 109 个 Pod、108 个 helper 指纹和 47 对现有 Core 公开头引用本 Pod 私有 Support 的结构债务。保留这些精确引用对以延续集成工程兼容，不能据此宣称公开 API 的外部模块可见性已解决。新增引用对仍失败；后续处理这些边界后，删除相应 baseline，报告 `stale_baseline_ids` 辅助清理。

结构例外必须同时匹配 ID、完整 key 和非空人工理由。只允许 H01/H02/R01/V03；公开 Core 漏导出 H03、Pod 求值错误、依赖环、重复 IMP、helper 行为变化、隐私格式与资源遗漏不能通过结构例外豁免。脚本没有自动“接受全部错误”选项，更新 baseline 要先审阅实际配置和差异。

本轮实际运行结果：109 Pods、660 条内部边、0 环、19 个 helper 版本、5 个已知 selector 均为唯一归属、0 个新失败；47 个现有结构边界在 JSON 标成 `accepted_existing`。完整结果见同目录 `audit.json`，再次运行后的 JSON 是判断当前工作树的依据。

回归脚本在临时目录构造真实 CocoaPods fixtures，确认重复 IMP、依赖环、同模块公开头重名、新私有引用、不同字节同名资源、helper 漂移/消失和隐私理由/资源遗漏会非零失败，并验证精确 baseline 不会吸收新私有引用。H03 定向复现 TimerMgr 同机制的兄弟 DSL 头被误列为 Project：根聚合导入失败，补实际 public pattern 后通过；实现文件仅导入私有 Entry 不误报，真正公开导入 private Entry 会失败，注释与合法公开 Support 头保持原边界。H03 即使被写入结构例外仍拒绝。回归退出码 0。编译、链接、XCTest 和整体工程验收由[**编译回归脚本**](../jobs_pods_stability_verify.rb/README.md)另行完成。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
