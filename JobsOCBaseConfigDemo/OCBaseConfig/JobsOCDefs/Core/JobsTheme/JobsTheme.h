//
//  JobsTheme.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *JobsThemeStyle NS_TYPED_EXTENSIBLE_ENUM;
typedef NSString *JobsThemeColorKey NS_TYPED_EXTENSIBLE_ENUM;
typedef NSString *JobsThemeImageKey NS_TYPED_EXTENSIBLE_ENUM;

FOUNDATION_EXPORT JobsThemeStyle const JobsThemeStyleLight;
FOUNDATION_EXPORT JobsThemeStyle const JobsThemeStyleDark;

FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundPrimary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGrouped;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextPrimary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextQuaternary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextPlaceholder;

FOUNDATION_EXPORT JobsThemeImageKey const JobsThemeImageKeyThemeToggle;
FOUNDATION_EXPORT NSNotificationName const JobsThemeDidChangeNotification;

@class JobsThemeCenter;
typedef void (^JobsThemeBindingBlock)(__kindof NSObject *object,
                                      JobsThemeCenter *center);

@interface JobsThemeCenter : NSObject

@property(class, nonatomic, readonly) JobsThemeCenter *shared;
@property(nonatomic, copy, readonly) JobsThemeStyle currentStyle;
@property(nonatomic, assign, readonly, getter=isDarkMode) BOOL darkMode;

-(BOOL)configureWithResource:(NSString *)name
               fileExtension:(NSString *)fileExtension
                      bundle:(NSBundle *)bundle
                       error:(NSError * _Nullable * _Nullable)error;
-(JobsThemeStyle)setStyle:(JobsThemeStyle)style;
-(JobsThemeStyle)toggle;
-(UIColor *)colorForKey:(JobsThemeColorKey)key;
-(UIColor *)resolvedColorForKey:(JobsThemeColorKey)key;
-(UIImage *_Nullable)imageForKey:(JobsThemeImageKey)key;
-(UIImage *_Nullable)resolvedImageForKey:(JobsThemeImageKey)key;
-(void)bindObject:(__kindof NSObject *)object
             slot:(NSString *)slot
            apply:(JobsThemeBindingBlock)apply;
-(void)unbindObject:(__kindof NSObject *)object
               slot:(NSString *)slot;

@end

@interface UIColor (JobsTheme)

@property(nonatomic, copy, readonly, nullable) JobsThemeColorKey jobsThemeColorKey;

@end

@interface UIImage (JobsTheme)

@property(nonatomic, copy, readonly, nullable) JobsThemeImageKey jobsThemeImageKey;

@end

FOUNDATION_EXPORT UIColor *JobsThemeColor(JobsThemeColorKey key);
FOUNDATION_EXPORT UIImage *_Nullable JobsThemeImage(JobsThemeImageKey key);

NS_ASSUME_NONNULL_END
