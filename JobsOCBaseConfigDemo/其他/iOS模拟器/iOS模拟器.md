# 📱iOS模拟器

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

* [**📱iOS模拟器（过期）配件下载**](https://github.com/JobsKits/Xcode_Sys_lib)

  ```shell
  git clone https://github.com/JobsKits/Xcode_Sys_lib.git
  ```

* **iOS模拟器下载**@终端

  ```shell
  rm -rf ~/Library/Caches/com.apple.dt.Xcode
  rm -rf ~/Library/Developer/CoreSimulator/Caches
  
  xcodebuild -downloadPlatform iOS --verbose
  ```