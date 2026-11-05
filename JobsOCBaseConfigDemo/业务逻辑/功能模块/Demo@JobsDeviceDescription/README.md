# Jobs 本机信息

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、字段与复制](#fields)
- [二、源码职责](#sources)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

首页左上角按钮 → 半屏菜单 → 用户信息。页面以两个 section 展示：第一组完整保留原用户属性，进入页面时刷新，第二组展示本机信息。

两个标题区均可整体点击，独立收起 / 展开，默认展开。页面采用主题分组背景，卡片左右留 16 点，标题区最小 56 点高，标题 17 点、条目计数与操作状态 13 点；卡片圆角 12 点，展开时标题仅顶部两角圆，与下方信息行贴合，收起时恢复四角圆。信息行使用 16 点标题与 14 点多行内容，说明文字 13 点并随系统字号缩放。切换同步提交状态、标题和行布局；收起时隐藏该组行和说明，数据保留。用户信息为空时显示重新加载入口。

## 一、<span id="fields">字段与复制</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 字段 | 展示内容 |
| --- | --- |
| UDID | iOS 不向普通应用提供 |
| 设备名称 | 系统公开的设备名称 |
| IMEI | iOS 不向普通应用提供 |
| 系统版本 | 系统名称与系统版本 |
| 序列号 | iOS 不向普通应用提供 |

每行点击后将当前显示内容写入系统剪贴板，并弹出“复制成功”。受限项只复制限制说明，弹窗会明确说明复制的内容；不使用 IDFV、随机 UUID 或 OpenUDID 冒充硬件 UDID。

[**iOS**](https://developer.apple.com/ios/) 16 及以上的[设备名称](https://developer.apple.com/documentation/uikit/uidevice/name)默认可能只返回 iPhone / iPad；读取用户自定义名称需要 Apple 批准的专用 entitlement，本模块不自行申请或增加该权限。三个硬件标识没有面向普通应用的公开读取 API。

## 二、<span id="sources">源码职责</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 源码 | 职责 |
| --- | --- |
| [JobsDeviceDescription](./JobsDeviceDescription/JobsDeviceDescription.h) | 通过已有设备查询封装组装五个字段，进入页面时重新读取。 |
| [JobsDeviceInfoItem](./JobsDeviceInfoItem/JobsDeviceInfoItem.h) | 保存字段标题、显示内容及受限状态。 |
| [JobsUserInfoVC](./JobsUserInfoVC/JobsUserInfoVC.h) | 独立管理分组表格，反射保留第一组全部用户属性，展示本机信息、点击复制和成功弹窗；避免通用对象查看器的自动刷新及行渐入干扰分组切换。 |

模块随主 App 编译，不增加 Pod 依赖或网络请求；OC 新旧工程使用相同源码，分别沿用各自的依赖集成方式。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
