# <span id="前言">最近使用</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 一、行为与接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

首页侧栏“最近使用”进入本页。首页、搜索和最近列表实际打开 Demo 时，根控制器按稳定标识去重前插并持久化最近 30 项；未注册的历史标识会在读取时过滤。页面返回前台、语言或主题改变时重新读取目录；从本页进入 Demo 后返回仍保留最近来源。

`JobsOCRecentDemosVC` 只接收目录提供器和选中回调，不创建第二套 Demo 注册表。空列表使用既有 `UIButtonModel` 图文空态，点“轻点重新加载”重新读取本地记录；本地历史不请求远端 API。

## 二、验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

验证入口、持久化、生命周期、代码位置及本轮结果统一登记于[App 骨架功能盘点](<../../../../../项目相关报告/App骨架功能盘点.md>)。OC 新旧保持相同行为与源码；仅依赖装配形态不同。

<a id="🔚" href="#前言">返回首页</a>
