# `save_device_ipa_after_build.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

把 [**Xcode**](https://developer.apple.com/xcode/) 已构建的主 App 复制为标准 `Payload/<App>.app` 快照，并压缩为真机或模拟器 IPA。脚本不负责源码构建、Archive 或正式分发导出。

## 一、目录与产物 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
save_device_ipa_after_build.command/
├── save_device_ipa_after_build.command
└── README.md
```

工程根目录相对本说明为 `../..`，产物位于 `../../build/`。

| 构建平台 | 本次唯一产物 | 使用边界 |
| --- | --- | --- |
| `iphoneos` | `../../build/真机.ipa` | 安装范围取决于当前签名与描述文件 |
| `iphonesimulator` | `../../build/模拟器.ipa` | 模拟器 App 快照，不能安装到真机或用于 App Store 分发 |

**打包成功后会清空 `../../build/` 的全部内容，包含隐藏文件、子目录、历史包和另一平台的包。该目录只能保存可丢弃产物。**

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

默认由主 App 最后一个 Build Phase `Save Build IPA` 调用同目录的 [主脚本](./save_device_ipa_after_build.command)。该阶段始终执行，输入只声明脚本文件，输出声明工程 `build/`，不把整个 App 目录作为输入，避免签名、扩展和测试依赖循环。

```shell
/bin/zsh "${SRCROOT}/ScriptsByDevTools/save_device_ipa_after_build.command/save_device_ipa_after_build.command"
```

1、同时存在 `XCODE_VERSION_ACTUAL` 与 `TARGET_BUILD_DIR` 时，打印内置自述后按构建阶段无交互执行；需要取消时停止当前构建。

2、终端独立运行或双击时，先展示用途和清理范围，按回车继续；随后必须输入完整 `YES` 确认清空 `build/`。按 `Ctrl+C` 或输入其它内容可取消，确认前不写日志或产物。

3、普通入口没有可交互标准输入时直接退出。脚本没有命令行参数，需要已有构建的环境变量；双击并不会自动寻找或构建 App。

## 三、执行前检查与流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

使用系统 `/bin/zsh`、`ditto`、`mktemp` 和 `codesign`；不安装或升级依赖。

| 环境变量 | 用途 |
| --- | --- |
| `SRCROOT` 或 `PROJECT_DIR` | 有效工程根目录 |
| `TARGET_BUILD_DIR`、`WRAPPER_NAME` | 已存在的 `.app` 路径与文件名 |
| `PLATFORM_NAME` | `iphoneos` 或 `iphonesimulator` |
| `PRODUCT_TYPE`、`ACTION` | 只处理主 App；`clean` 和其它产品跳过 |
| `EXPANDED_CODE_SIGN_IDENTITY`、`CODE_SIGNING_ALLOWED` | 真机签名身份；真机要求允许签名且身份非空、非 `-` |
| `PROJECT_TEMP_DIR`、`BUILD_DIR`、`OBJROOT`、`SYMROOT`、`DERIVED_DATA_DIR` | 防止清理正在使用的构建目录 |

1、校验源 App 与工程 `build/`。`build/` 必须是真实目录，不能为软链接；源 App、DerivedData、日志和临时目录必须位于 `build/` 外。

2、将 App 复制到系统临时目录的 `Payload/<App>.app`。真机先验证签名，已有有效签名时保留原签名元数据；未通过校验时按 Xcode 身份补签，再严格校验。模拟器允许 `CODE_SIGNING_ALLOWED=NO`。

3、先在临时目录完成 IPA 压缩，确认非空后才清理 `build/` 并移入本次唯一 IPA。源 App 缺失、签名或压缩失败时保留旧产物。

4、退出或中断时清理本脚本创建的临时快照。清理或移动阶段失败会返回失败，已删除的旧产物不能自动恢复。

`Tests`、Widget 和其它平台不独立输出 IPA；测试触发主 App 重建时仍会更新产物。IPA 存在不代表整个工作空间或测试已通过。

## 四、日志与常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认后初始化系统临时目录中的 `save_device_ipa_after_build.log`，每次覆盖，并同步显示业务日志；构建入口可在 Xcode 构建日志查看。
- 自述标题红色加粗，正文蓝色不加粗；非彩色终端、`TERM=dumb`、`NO_COLOR` 或构建日志使用纯文本。
- App 不存在：先完成主 App 构建，并核对 `TARGET_BUILD_DIR` 与 `WRAPPER_NAME`。
- 构建路径在 `build/` 内：把 DerivedData 和构建中间目录移到工程 `build/` 外，例如工程根目录的 `DerivedData/`。
- 真机签名失败：检查签名身份、Team、描述文件与嵌套 App / Extension；脚本不能替代正式签名导出流程。
- 非交互入口拒绝执行：使用 Xcode 构建阶段，或在可交互终端手动运行并完成确认。

## 五、验证范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

静态检查使用以下命令，不产生构建或安装：

```shell
/bin/zsh -n ./save_device_ipa_after_build.command
```

维护验证覆盖脚本语法、目录结构、构建调用路径及隔离交互门禁。未执行真实工程构建、真机签名或安装，不把隔离验证当作设备安装验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
