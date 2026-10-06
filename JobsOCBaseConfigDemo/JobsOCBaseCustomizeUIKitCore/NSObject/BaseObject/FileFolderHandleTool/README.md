#  <span id="前言">FileFolderHandleTool</span>
## 文件夹操作 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

## FileFolderHandleTool 运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 目标不存在时，即使 `overwrite=NO` 也会实际创建。已存在普通文件且不覆盖时保留原文件并返回成功；目录冲突返回错误。
- 覆盖通过 NSData 原子写入完成，写失败时保留旧文件。不存在目标的 no-overwrite 使用排他创建；父路径存在但不是目录时返回 NSError。nil 数据表示零字节文件。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
