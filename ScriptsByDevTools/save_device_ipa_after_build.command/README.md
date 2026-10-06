# `save_device_ipa_after_build.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

为主 App 的真机 / 模拟器构建留存 IPA。脚本挂在 [**Xcode**](https://developer.apple.com/xcode/) 主 App 的最后一个 `Save Build IPA` 构建阶段；脚本和本说明放在完整同名 `.command` 目录中。

## 一、目录与运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
save_device_ipa_after_build.command/
├── save_device_ipa_after_build.command
└── README.md
```

1、正常从工程构建主 App，构建阶段通过 `/bin/zsh` 调用 [脚本](./save_device_ipa_after_build.command)，并将该脚本声明为输入、工程 `build/` 目录声明为输出。识别到 `XCODE_VERSION_ACTUAL` 和 `TARGET_BUILD_DIR` 后先打印自述，再无交互执行；取消构建可终止脚本。

2、双击 `.command` 或从本说明目录执行以下命令，会先显示用途与清理范围。按回车继续，再输入 `YES` 授权清空 `build/`；其它输入取消，`Ctrl+C` 随时终止。确认前不初始化日志或执行打包。手动入口仍需提供真实构建产物与环境变量。

```shell
/bin/zsh './save_device_ipa_after_build.command'
```

3、未识别到 Xcode 构建环境且没有可交互标准输入时，直接报错退出。自述标题红色加粗、正文蓝色常规；非彩色终端、`TERM=dumb`、`NO_COLOR`、`PLAIN_OUTPUT=1` 或 Sourcetree 纯文本标志下不输出颜色控制码。

## 二、执行前检查与参数 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

脚本不接受业务命令行参数，使用构建环境变量定位产物；工程内路径从有效工程根目录计算，不写死本机路径。依赖系统自带 `zsh`、`ditto`、`mktemp`、`tee`、`rm`、`mv` 和真机签名使用的 `codesign`，不安装或升级工具链。

| 变量 | 用途 |
| --- | --- |
| `SRCROOT` / `PROJECT_DIR` | 工程根目录，优先 `SRCROOT`；本说明所在目录的工程根目录为 `../../` |
| `TARGET_BUILD_DIR`、`WRAPPER_NAME` | 本次已构建的 App 目录与 `.app` 文件名 |
| `PLATFORM_NAME` | `iphoneos` 生成 `../../build/真机.ipa`，`iphonesimulator` 生成 `../../build/模拟器.ipa` |
| `ACTION`、`PRODUCT_TYPE` | 跳过 `clean`、非 iOS 平台和非 App 产品 |
| `XCODE_VERSION_ACTUAL` | 配合 `TARGET_BUILD_DIR` 识别 Xcode 自动入口 |
| `CODE_SIGNING_ALLOWED`、`EXPANDED_CODE_SIGN_IDENTITY` | 真机要求允许签名及有效身份；模拟器允许无签名 |
| `TMPDIR` | 临时快照和日志位置；缺省使用系统临时目录 |
| `PROJECT_TEMP_DIR`、`BUILD_DIR`、`OBJROOT`、`SYMROOT`、`DERIVED_DATA_DIR` | 检查构建工作路径没有落入待清空的 `build/` |

## 三、打包流程与产物 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、确认当前是主 App 的 iOS 构建，并检查 App 存在、工程根目录有效、输出目录不是软链接或普通文件。源 App、DerivedData、构建中间目录、日志和临时目录必须在工程 `build/` 外。

2、复制 App 到系统临时目录的 `Payload/<App产品名>.app`。真机已有完整有效签名时保留原签名元数据；签名未通过时使用当前构建身份补签，再严格校验。模拟器不要求真机签名身份。

3、先在临时目录压缩，产物非空后才清空工程 `build/` 的所有内容，包括隐藏文件、子目录、旧平台包，再写入本次唯一 IPA。退出、错误或中断时清理本脚本的临时快照。

App 缺失、路径不安全、签名或压缩失败时返回非零，阻断当前构建阶段，并保留原 `build/`。进入最终替换后如果删除或移动失败，可能只完成部分清理；检查日志与磁盘空间后重新构建。

## 四、风险与日志 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`../../build/` 只存放可丢弃的构建产物，不能保存源码、文档或唯一备份；真机和模拟器包不会同时保留。自动构建已明确授权产物替换；终端手动入口必须输入 `YES` 才进入业务。

`模拟器.ipa` 是模拟器 App 的压缩快照，不能安装到真机或用于 [**App Store**](https://developer.apple.com/app-store/) 分发。`真机.ipa` 的安装范围取决于当前签名和描述文件，不能替代正式 Archive / 导出。IPA 存在不代表整个工作区或测试成功，Scheme 后置动作仍可能失败。

业务日志同步到 Xcode 构建日志和系统临时目录的 `save_device_ipa_after_build.log`；每次确认后的运行覆盖同名日志。

## 五、常见问题与验证边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 双击后没有 IPA：普通终端没有自动取得构建环境变量。优先从原工程构建主 App；手动执行时提供有效的 App 和平台变量。
- 被拒绝清空 `build/`：确认输出不是软链接，DerivedData 与源 App 位于 `build/` 外。
- 真机签名失败：检查当前工程的签名身份及描述文件，查看构建日志中的 `codesign` 错误。
- 构建阶段找不到脚本：核对输入路径与执行路径均指向 `save_device_ipa_after_build.command/save_device_ipa_after_build.command`，通过 `/bin/zsh` 调用。
- 将整个 App 目录声明为构建输入可能引起签名或测试依赖循环；保留仅脚本文件作为输入的配置。

迁移验证采用 Shell 语法、目录与引用检查及临时夹具；没有为整理目录执行真实工程构建、依赖安装或真机安装。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
