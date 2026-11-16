# Core Data 真实存储集成测试

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、源码与隔离边界](#sources)
- [二、编译与运行](#run)
- [三、覆盖行为](#coverage)
- [四、已验与待验](#verification)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录以 [**MacOS**](https://www.apple.com/macos/) 命令行可执行文件，将实际生产存储层与测试源码一起编译，使用 [**Core Data**](https://developer.apple.com/documentation/coredata) 模型和真实 [**SQLite**](https://www.sqlite.org/) 文件验证行为。测试不启动 App、不操作既有 App 数据库，不代表 iOS 主工程构建或界面交互已验收。OC 新旧工程使用同源 Store、模型及测试。

## 一、<span id="sources">源码与隔离边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- [测试入口](./JobsCoreDataUserStoreIntegrationTests/JobsCoreDataUserStoreIntegrationTests.m)有独立 `main`，只用于下面的命令行编译，不加入 App target。
- [生产 Store](<../../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/JobsCoreDataUserStore/JobsCoreDataUserStore.m>)与[实际模型](<../../JobsOCBaseConfigDemo/其他/CoreData/JobsOCBaseConfigDemo.xcdatamodeld/JobsBaseConfig.xcdatamodel/contents>)直接参与测试，不复制一套模拟实现。
- 编译产物与日志使用新建的系统临时目录；测试另为 SQLite 新建随机临时目录。保留产物和日志用于排查，不执行自动清理，也不读取或覆盖 App 沙盒。

## 二、<span id="run">编译与运行</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

前提为已安装并选定 [**Xcode**](https://developer.apple.com/xcode/) 命令行工具。在本工程根目录逐条执行，前一步成功后再继续；测试会以退出码1报告断言失败，参数错误返回2。

```zsh
jobs_store_test_dir=$(mktemp -d /tmp/jobs-oc-user-store.XXXXXX)

xcrun momc \
  'JobsOCBaseConfigDemo/其他/CoreData/JobsOCBaseConfigDemo.xcdatamodeld' \
  "$jobs_store_test_dir/JobsOCBaseConfigDemo.momd"

xcrun clang -fobjc-arc -fblocks -framework Foundation -framework CoreData \
  'JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/JobsCoreDataUserStore/JobsCoreDataUserStore.m' \
  Tests/CoreData/JobsCoreDataUserStoreIntegrationTests/JobsCoreDataUserStoreIntegrationTests.m \
  -o "$jobs_store_test_dir/JobsCoreDataUserStoreIntegrationTests"

"$jobs_store_test_dir/JobsCoreDataUserStoreIntegrationTests" \
  "$jobs_store_test_dir/JobsOCBaseConfigDemo.momd" \
  > "$jobs_store_test_dir/results.log" 2>&1

jobs_store_test_status=$?
cat "$jobs_store_test_dir/results.log"
printf 'exit=%s\nartifacts=%s\n' "$jobs_store_test_status" "$jobs_store_test_dir"
```

测试头文件按测试源文件位置使用相对 `#import`，无需额外 `-I`。只有退出0、日志显示断言通过且参与编译的源码仍是当前版本时，才计为该轮存储回归通过；不能仅看最后一条 `cat` 或 `printf` 的退出码。

## 三、<span id="coverage">覆盖行为</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

覆盖真实模型加载与 SQLite 打开、初始空库、姓名去空白及新增、查询排序、修改与单删、清空、非法姓名／年龄不入库、独立容器读回字段、错误 context 拒绝、只读 SQLite 保存失败回滚及失败草稿不泄漏、未准备 context 错误。断言数量以测试源码及本轮日志为准。

## 四、<span id="verification">已验与待验</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16已在 OC 新工程根目录使用上述实际 Store 和模型完成27项断言，OC 老工程的 Store、模型和测试与其逐字一致；这属于一轮 MacOS 存储层集成验证，不宣称分别运行了两个 App 或两个独立平台。主 App 构建、模型与图标入包、首页／搜索／最近使用入口、iOS 页面 CRUD、前后台、重启和主题／语言效果仍按[本工程资产表](../../项目相关报告/App骨架功能盘点.md#coredata-assets)分项登记。

<a id="🔚" href="#前言">返回首页</a>

