# `integrated_mode_regression.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、覆盖范围](#jobs-toc-heading-2)
- [二、运行方式](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

用临时 [**Xcode**](https://developer.apple.com/xcode/) 工程验证主工程集成形态的组件验收适配。夹具包含应用、单元测试、真实磁盘源码及文件同步组，不运行 `xcodebuild`、依赖安装或设备测试。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、覆盖范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 冻结组件和宿主的 XCTest 类、方法数量；拒绝版本错误、重复组件、重复类、归一化后重复源码和缺失文件。
- 拒绝相对路径越界、源码与配套头文件软链接越界；注释和字符串不能冒充测试类或方法。
- 验证同步组默认关闭时的成员白名单、默认开启时的文件与目录排除清单，检测测试遗漏及测试误入主应用。
- 验证临时工程只替换正常 `main.m`，保留生产实现；原工程、源码和原签名输入逐字节不变，生成的编译输入必须是存在的绝对路径。
- 验证默认开启且没有例外对象的合法同步组和普通 Sources 入口；多个正常入口或未解析 Bundle ID 必须拒绝生成可执行计划。
- 检查临时宿主权限配置、Info.plist、共享 Scheme 和 workspace。配置检查不代替实际构建产物的签名与 Mach-O 权限验收。
- 安装后测试配置门禁覆盖缺失Tests base、缺失文件、空／仅继承的依赖设置及有效配置SHA；逐项拒绝丢失App自有三类搜索上下文，合并后成功。合并回归覆盖唯一真实Tests、同名配置、空值、变量、含空格路径、已有顺序、幂等及其他target／签名／链接设置不变；未安装Pods的`--audit-only`仍只读成功。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录运行：

```shell
ruby ./integrated_mode_regression.rb
```

依赖现有 [**Ruby**](https://www.ruby-lang.org/)、Minitest 和 `xcodeproj`，不会自动安装。模块通过脚本自身目录定位，从其它工作目录使用脚本绝对路径运行也可。夹具目录包含中文、空格及括号，结束后只清理本次创建的临时目录；失败返回非零状态。

当前回归为 23 个场景、169 条断言。两侧 OC 工程保留同源回归包；主工程或 Pod 形态的实际构建与 XCTest 结果由各自验收入口记录。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
