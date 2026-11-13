# Jobs 本机信息

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、字段与复制](#fields)
- [二、源码职责](#sources)
- [三、联网采集与回退](#online-collection)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

首页左上角按钮 → 半屏菜单 → 用户信息。页面以三个 section 展示：第一组完整保留原用户属性，进入页面时刷新，第二组展示本机公开信息，第三组展示本次联网配对采集的设备。

三个标题区均可整体点击，独立收起 / 展开，默认展开。页面采用主题分组背景，卡片左右留 16 点，标题区最小 56 点高，标题 17 点、条目计数与操作状态 13 点；卡片圆角 12 点，展开时标题仅顶部两角圆，与下方信息行贴合，收起时恢复四角圆。信息行使用 16 点标题与 14 点多行内容，说明文字 13 点并随系统字号缩放。切换同步提交状态、标题和行布局；收起时隐藏该组行和说明，数据保留。用户信息为空时显示重新加载入口。

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

模块随主 App 编译，不增加 Pod 依赖；OC 新旧工程使用相同源码，分别沿用各自的依赖集成方式。

## 三、<span id="online-collection">联网采集与回退</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

第三组的“联网采集”会先说明采集站及数据范围，经同意后调用 `POST /api/pair`，再打开 [设备采集站](https://jobs-device-info-pages.pages.dev/)。请在 [**Safari**](https://www.apple.com/safari/) 同意并按页面指引到系统设置确认描述文件，完成后返回 App；默认浏览器不是 Safari 时按网页指引切换。App 恢复前台会自动查询 `GET /api/session`，也可轻点“刷新结果”。等待期间仅在此页可见且 App 前台时每 3 秒查询；离页 / 后台停止，返回后继续有效会话。已有结果只在到期时刷新，不持续轮询。等待中可点“继续系统确认”再次打开原链接，避免无意义地重新创建会话。

采集会话自创建起 15 分钟有效。默认请求超时 6 秒；`Info.plist` 可选配置 `JobsDeviceInfoBaseURL`（无账号、参数或片段的 HTTPS 根站地址）及 `JobsDeviceInfoRequestTimeout`（正数秒，最高 30 秒）。不配置即可使用线上站点。专用 `NSURLSession` 使用独立内存 Cookie，关闭缓存与凭据存储，不与宿主业务网络 / 浏览器共享 Cookie，不打印或持久化采集编号；仅采集语言偏好写入 `NSUserDefaults`。

网络失败、超时、响应无法解析时保留仍有效的结果及原有本机公开信息，显示可重试状态；没有结果时显示完整提示与采集 / 刷新按钮。真实 UDID 不造假、不用 IDFV 或随机 UUID 替代。`received` 不等于取得 UDID：浏览器信息或无有效 UDID 会提示重新使用系统确认。型号名称与本机设备名称分开；系统版本与系统构建号分开；各项区分系统回传、资料映射、手工补录和浏览器报告，未回传项不可复制假编号。

本次配对链接可能在其它设备打开，因此第三组明确称“本次采集设备”，不能作为当前 App 的本机身份认证。服务端的 `signature-only` 也不表示验证了 Apple 信任链。原有本机五项仍通过公开 API 获取；离线打开页面无需服务器即可查看这些信息。

“结束并清除”发送 `DELETE /api/session` 并立即清空本页与本地 Cookie。离页或退后台取消请求后也不会恢复旧结果；删除失败会明确说明未确认服务端清除，服务端会话最迟在原定时间到期。本页到期后隐藏采集结果；用户主动复制到系统剪贴板的内容不由本页清除。

采集区语言统一跟随 App 设置中的简体中文、繁体中文、藏文、英文、日文、法文、西班牙文、德文、俄罗斯文、韩文选择，不再提供页面内语言按钮或独立偏好，覆盖操作、确认、状态、来源与字段文案；主题沿用宿主白天 / 黑夜 / 跟随系统，不另建主题状态。控件使用已有文字按钮，不增加远程图片。

新增 `JobsDeviceCollectionClient` 负责会话协议与生命周期，`JobsDeviceCollectionText` 负责采集区十语言。真机描述文件安装、返回 App 后展示，以及三主题 / 大字体视觉效果须在目标设备验收；静态检查和协议夹具不替代真机确认。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
