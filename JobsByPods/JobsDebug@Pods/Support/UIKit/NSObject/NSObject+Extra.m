//
//  NSObject+Extra.m
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/// Documents目录（这个目录通常用于存储应用程序中的用户数据或需要持久保存的数据。用户可以通过 iTunes 文件共享或 iCloud 访问该目录中的内容）下，用户主目录下，返回完整路径
-(NSArray <NSString *>*_Nonnull)documentsPaths{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                               NSUserDomainMask,
                                               YES);
}
/// 获取真机沙盒中Documents的目录路径：
-(NSString *_Nonnull)documentsDir{
    return self.documentsPaths.firstObject;
}

@end
/// 同一个类的方法交换
void JobsDebugMethodSwizzle(Class _Nonnull c,
                            SEL _Nonnull _orig,
                            SEL _Nonnull _new) {
    Method origMethod = class_getInstanceMethod(c, _orig);
    Method newMethod = class_getInstanceMethod(c, _new);
    /**
        1、注意class_addMethod会覆盖父类方法的实现，但是不会替换父类已经存在的方法实现。
        2、如果要改变已经存在的方法实现，使用method_setImplementation。
        3、这里只是尝试覆盖父类方法的实现，如果父类没有对应方法的实现，则覆盖成功，否则覆盖失败。
     */
    if (class_addMethod(c,
                        _orig,
                        method_getImplementation(newMethod),
                        method_getTypeEncoding(newMethod))) {
        /**
         1、如果要替换的方法存在，它调用的是class_addMethod。
         2、如果要替换的方法不存在，它调用的是method_setImplementation。
         3、这里在覆盖父类方法成功的情况下，尝试用父类原有的方法的实现替换新增方法的实现。
         */
        class_replaceMethod(c,
                            _new,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        /// 这里在覆盖父类方法失败的情况下，交换两个两个方法的实现。
        method_exchangeImplementations(origMethod, newMethod);
    }
}
