//
//  JobsGestureLockResource.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockResource.h"

@implementation JobsGestureLockResource
+ (JobsRetNSBundleByVoidBlock _Nonnull)resourceBundle {
    return ^NSBundle *{
        NSBundle *classBundle = [NSBundle bundleForClass:self];
        NSURL *bundleURL = [classBundle URLForResource:@"JobsGestureLockResources" withExtension:@"bundle"];
        if (bundleURL) {
            NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
            if (bundle) return bundle;
        }
        NSURL *mainBundleURL = [NSBundle.mainBundle URLForResource:@"JobsGestureLockResources" withExtension:@"bundle"];
        if (mainBundleURL) {
            NSBundle *bundle = [NSBundle bundleWithURL:mainBundleURL];
            if (bundle) return bundle;
        };return classBundle ?: NSBundle.mainBundle;
    };
}

+ (UIImage *)imageNamed:(NSString *)name {
    return ((((JobsRetImageByStrBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsGestureLockResource.class, @selector(imageNamed)))(self, @selector(imageNamed))))(name);
}
+(JobsRetImageByStrBlock _Nonnull)imageNamed{
    return ^UIImage *(NSString * name){
        NSBundle *bundle = self.resourceBundle();
        UIImage *image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
        if (!image && bundle != NSBundle.mainBundle) {
            image = [UIImage imageNamed:name inBundle:NSBundle.mainBundle compatibleWithTraitCollection:nil];
        }
        if (!image) {
            image = [UIImage imageNamed:name];
        };return image;
    };
}

@end
