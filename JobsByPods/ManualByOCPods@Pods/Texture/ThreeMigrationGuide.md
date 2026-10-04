## <span id="前言">Texture 3.1 Migration Guide <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

Got a tip for upgrading? Please open a PR to this document!

- Rename all instances of ASNavigationController to ASDKNavigationController

## Texture 3.0 Migration Guide <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Rename all instances of ASViewController to ASDKViewController

### Breaking API Changes <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`ASImageCacherCompletion` typedef has a new parameter: `ASImageCacheType cacheType`. Example:


```swift
ASPINRemoteImageDownloader.shared().cachedImage(with: url, callbackQueue: .main) { result in
    …
}
```

Becomes

```swift
ASPINRemoteImageDownloader.shared().cachedImage(with: url, callbackQueue: .main) { result, cacheType in
    …
}
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
