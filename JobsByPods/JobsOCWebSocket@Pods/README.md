# `JobsOCWebSocket`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCWebSocket` 是基于 `SocketRocket` 的轻量 WebSocket Pod，只封装连接生命周期、线程切换、心跳、退避重连和状态回调，不介入业务协议、鉴权或消息模型。

## 一、默认策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 心跳间隔：30 秒。
- 自动重连：默认开启。
- 退避序列：1、2、4、8、16 秒。
- 最大重连次数：5 次。
- 状态、消息和重连通知统一切回主线程。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsOCWebSocket/JobsOCWebSocket.h>

JobsOCWebSocketClient *client = [
    [JobsOCWebSocketClient alloc]
    initWithURL:[NSURL URLWithString:@"wss://ws.postman-echo.com/raw"]
];
client.delegate = self;
[client connect];

NSError *error = nil;
[client sendText:@"Hello WebSocket" error:&error];
```

主动退出页面时调用 `disconnect`，它会停止心跳并取消待执行的自动重连。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
