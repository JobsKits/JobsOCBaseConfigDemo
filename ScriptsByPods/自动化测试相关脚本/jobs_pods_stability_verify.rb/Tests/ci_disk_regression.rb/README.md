# CI 空间回收隔离回归

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [前言](#%E5%89%8D%E8%A8%80)
- [一、执行与断言](#jobs-toc-heading-2)
- [二、验证边界](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

## <span id="前言">前言</span>

[回归入口](./ci_disk_regression.rb)用 Ruby 标准库在系统临时目录构造中文空格工程、SDK 摘要、成功记录和 52 份结果哨兵，真实调用[生产清理器](../../jobs_stability_ci_disk.rb/README.md)。不构建、下载依赖、操作真实工作区缓存或 Git。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、执行与断言 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

```shell
ruby ./ci_disk_regression.rb
```

覆盖专属 cache 真删除、导出资源仍完整、ApplicationTests 与主 App 独立中间目录回收；Products、52 个 xcresult、results／日志、双配置 resp／hmap／VFS 原件字节保留。负向覆盖目标／后代链接逃逸、路径遍历、Products 禁删、未知归属、inode 换身、SDK 对缓存依赖、低空间和采样错误；实际子进程退出 73 原样传递并阻断后续控制流。

生产 helper 与本回归的实现体变更均须使可信 SHA 审计失败，并实际改变 `JobsStabilitySources` 指纹。完整 WorkflowConfiguration 会运行本入口，并对解析后的真实阶段顺序、精确 CLI、预算与不同名检查点／正式上传作正负变异。成功输出前均有断言；失败进程非零并保留诊断输出。普通临时夹具由标准库释放，不接触其它任务目录。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、验证边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

夹具成功不等于实际托管 runner 空间充足，也不代表 XCTest、SDK 或 App 构建已重新运行。真实验收须读取最终提交的官方日志、完整原始结果和产品 ZIP。

<a id="🔚" href="#前言">返回前言</a>
