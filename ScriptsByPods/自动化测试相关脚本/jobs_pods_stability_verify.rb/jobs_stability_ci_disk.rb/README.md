# CI 构建空间管理

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [前言](#%E5%89%8D%E8%A8%80)
- [一、阶段与保留范围](#jobs-toc-heading-2)
- [二、空间与回执](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

## <span id="前言">前言</span>

[入口](./jobs_stability_ci_disk.rb)只供当前 GitHub Actions 运行使用；依赖 Ruby 2.6 及以上标准库，不安装工具，不清理系统、全局 Cargo、其它任务或源码。必须显式传入 `--ci`，同时校验 CI、仓库、workspace、run、attempt 及 baseline 的生产 helper／回归文件 SHA；普通本地调用拒绝执行。行为验证使用[隔离回归](../Tests/ci_disk_regression.rb/README.md)。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、阶段与保留范围 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

工作流通过 `ruby <本入口> --ci <阶段>` 串行调用：

| 阶段 | 前提与动作 | 始终保留 |
| --- | --- | --- |
| `prepare` | 在 runner 临时目录登记本 run／attempt 的专属 cache、输出根及设备／inode；拒绝认领已存在的未知目录 | 源码、其它任务目录 |
| `rust` | SDK 导出逐文件摘要、平台切片、模型资源与 Headers 自包含核验成功后，回收 `JobsOCRSourceCache-<run>-<attempt>` | SDK Frameworks、Resource、Core、源码头及构建摘要 |
| `tests` | 完整 51 组 Pod 配置及 ApplicationTests 的成功记录、两类真实 host signature 有效，且工作流已完成 Keychain 审计、上传测试检查点后，仅回收 `ApplicationTests/DerivedData` 和 `ApplicationTests/Intermediates` | 全部 Products、52 份原始 xcresult、results、log、OwnedPodsBatch |
| `app` | 主 App Debug／Release 实际成功、完整验证原件已上传后，回收根 DerivedData 与其余 Intermediates | Products；ReactiveObjC 两配置 `.resp`、`.hmap` 及 VFS `.yaml` 按既有上传 glob 原位保留，并逐字节核清理前后 SHA |

所有删除目标从固定子目录构造并限制在专属 runner 输出下；拒绝目标／祖先软链接、越出目标子树的后代软链接、目录换身和特殊文件。缓存内部不越界的 ORT framework 链接允许存在，删除时不跟随。清理失败非零退出，后续阶段不继续。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、空间与回执 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

每阶段记录所在卷 `/bin/df -Pk` 与本次两个专有目录 `/usr/bin/du -sk` 的前后结果，回执位于 runner 临时目录的 `JobsCIDisk-<run>-<attempt>/<阶段>.json`。`prepare`／`rust`／`tests` 的进入下限在源码常量 `BUILD_FLOOR` 配置为 4 GiB；它仅拒绝明显不足的当前余量，不代表后续冷构建空间上界。打包进入下限按实际 Debug App 的文件字节计算为 `2 × App逻辑字节 + 1 GiB`，分别为压缩／上传临时空间和 Worker 日志留余量；不保证未来空间一定足够。

测试检查点使用独立 `JobsPods-tests-<run>-attempt-<attempt>` artifact；正式 `JobsPods-validation-<run>` 仍为 always 上传，位于主 App 完成后、清理与打包前，只创建一次。末尾独立上传磁盘回执，不覆盖或重建同名 artifact。异常杀进程、磁盘已彻底耗尽时无法保证回执成功落盘；已完成检查点与官方运行状态仍须分别核对。

本地夹具只证明删留、守卫与退出传递；目标 runner 的实际空间、完整构建及最终产品仍按同一提交的 Actions 原件验收。

<a id="🔚" href="#前言">返回前言</a>
