# <span id="前言">GTMBase64</span>

## 使用方法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
* 导入到iOS项目工程
  * ```objective-c
    #import "GTMBase64.h"
    ```
  * 【注意】开启ARC。解决方法：***-fno-objc-arc***
## 常用的方法
```objective-c
+ (NSString*)md5_base64: (NSString *) inPutText;
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
