//
//  MacroDef_Func.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef MacroDef_Func_h
#define MacroDef_Func_h

#import <UIKit/UIKit.h>
#import <JobsOCDefs/MacroDef_Notification.h>
#import <JobsOCDefs/MacroDef_SysWarning.h>
#import <JobsOCDefs/MacroDef_Singleton.h>
#import <JobsOCDefs/MacroDef_String.h>
#import <JobsOCDefs/MacroDef_QUEUE.h>
#import <JobsOCDefs/MacroDef_Time.h>
#import <JobsOCDefs/JobsDefineUserDefault.h>

#pragma mark —— 获取 AppDelegate 和 SceneDelegate
/// AppDelegate.sharedManager
NS_INLINE id<UIApplicationDelegate> _Nullable getSysAppDelegate(void){
    return UIApplication.sharedApplication.delegate;
}
/**
    1、该方法只能获取系统默认的SceneDelegate；
    2、如果要获取自定义的sceneDelegate，则需要：
 
     SceneDelegate *sceneDelegate;//在类定义域和实现域之外暴露
         
     -(instancetype)init{
         if (self = [super init]) {
             sceneDelegate = self;
         }return self;
     }
     
     获取方式：extern SceneDelegate *sceneDelegate;
 */
NS_INLINE id<UIWindowSceneDelegate> _Nullable getSysSceneDelegate(void){
    id sceneDelegate = nil;
    if (@available(iOS 13.0, *)) {
        sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    }return sceneDelegate;
}
#pragma mark —— 定义一些方法
#ifndef JobsNonnullString
#define JobsNonnullString(nullableStr, replaceStr) \
    [NSString nullableString:(nullableStr) replaceString:(replaceStr)]
#endif

#pragma mark —— 定义一些默认值
#ifndef listContainerViewDefaultOffset
#define listContainerViewDefaultOffset JobsWidth(40)
#endif

#ifndef JobsDefaultValue
#define JobsDefaultValue 0
#endif

#ifndef JobsDefaultObj
#define JobsDefaultObj Nil
#endif

#ifndef JobsDefaultSize
#define JobsDefaultSize CGSizeZero
#endif
/// 其他
#ifndef PrintRetainCount
#define PrintRetainCount(obj) printf("Retain Count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(obj)));//打印引用计数器
#endif

#ifndef MethodName
#define MethodName(obj) NSStringFromClass([obj class]).add(@"_").add(NSStringFromSelector(_cmd))
#endif

#ifndef ReuseIdentifier
#define ReuseIdentifier self.class.description
#endif

#ifndef reuseIdentifier
#define reuseIdentifier(Class) Class.class.description
#endif

#ifndef JobsAvailableSysVersion
#define JobsAvailableSysVersion(version) @available(iOS version, *)
#endif

#ifndef JobsCellRandomCor
#define JobsCellRandomCor cell.backgroundColor = cell.contentView.backgroundColor = JobsRandomColor;
#endif

#ifndef JobsCellCor
#define JobsCellCor(cor) cell.backgroundColor = cell.contentView.backgroundColor = cor;
#endif

#ifndef JobsCellSelfCor
#define JobsCellSelfCor(cor) self.backgroundColor = self.contentView.backgroundColor = cor;
#endif

#ifndef JobsIndexPathForItem
#define JobsIndexPathForItem(section,item) [NSIndexPath indexPathForItem:item inSection:section]
#endif

#ifndef JobsIndexPathForRow
#define JobsIndexPathForRow(section,row) [NSIndexPath indexPathForRow:row inSection:section]
#endif

#endif /* MacroDef_Func_h */
