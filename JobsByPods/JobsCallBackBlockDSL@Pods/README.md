# JobsCallBackBlockDSL

`JobsCallBackBlockDSL` 是 `JobsBlock/NSObject+CallBackInfoByBlock` 的链式语法二次封装。

## 用途

- `JobsBlock` 继续负责 Block typedef、关联对象属性和 `actionXxxBlock:` 存取逻辑。
- `JobsCallBackBlockDSL` 只负责 `byXxxBlock(...)` 点语法链式调用，让 callback 配置可以并入 Jobs DSL 的“一链到底”风格。

## 使用

```objc
#import <JobsCallBackBlockDSL/JobsCallBackBlockDSL.h>

object
    .byObjBlock(^(id data) {
        JobsLog(@"%@", data);
    })
    .byRetObjBlock(^id(id data) {
        return data;
    });
```

## 目录

- `JobsCallBackBlockDSL.h`：聚合入口。
- `Core/NSObject+CallBackInfoByBlock+DSL`：`NSObject` callback block DSL 分类。

## 依赖

- `JobsBlock`
- `JobsOCDefs`

## 约束

- DSL Block 必须返回当前 `NSObject`，保证链式语法可以继续。
- 不在本 Pod 内重复定义 Block 类型；新增可复用 typedef 统一放入 `JobsBlock`。
