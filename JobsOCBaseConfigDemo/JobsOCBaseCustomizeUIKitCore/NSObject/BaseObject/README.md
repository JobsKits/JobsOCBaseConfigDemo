#  <span id="前言">BaseObject</span>

## 继承于NSObject的一些重要工具类，不建议作为其他第三方手动管理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

## JobsMonitorNetwoking 运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 兼容入口按 uint64 累计接口统计、单次采样与实际单调 elapsed 计算；接口地址先判空，累计下降不输出负网速，Label 在主队列更新。
- 新功能优先使用 JobsNetWorkTools 的独立实例；旧入口保留给已有调用方，不自行创建额外计时器。

## JobsNetWorkTools 运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 每个 monitor 持有自己的累计字节和单调时间基准；start/restart 清理基准，stop 释放 timer。采样间隔须有限且为正，限制为 0.1–3600 秒，非法值回退 1 秒。
- 网速按实际采样 elapsed 计算；统计 AF_LINK、UP、非回环接口的设备总流量，显示“设备总流量”，不能视作 App 独占流量或固定 Wi-Fi。计数下降重新建基准，回退当次速率为零。
- 生命周期运行在主队列；shared 保留单个回调槽，需要多个独立展示者时分别创建实例，避免互相覆盖。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
