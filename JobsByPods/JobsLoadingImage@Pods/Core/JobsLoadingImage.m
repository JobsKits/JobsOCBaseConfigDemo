//
//  JobsLoadingImage.m
//  JobsLoadingImage
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLoadingImage.h"

double JobsLoadingImageVersionNumber = 1.0;
const unsigned char JobsLoadingImageVersionString[] = "1.0.0";

@interface JobsLoadingImageToken : NSObject

@end

@implementation JobsLoadingImageToken

@end

BOOL JobsObjectIsNull(id _Nullable obj) {
    if (obj == nil || obj == NULL || obj == NSNull.null) {
        return YES;
    }

    if ([obj isKindOfClass:NSString.class]) {
        NSString *str = (NSString *)obj;
        NSString *trimmed = [str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        return trimmed.length == 0;
    }

    return NO;
}

BOOL JobsObjectIsValue(id _Nullable obj) {
    return !JobsObjectIsNull(obj);
}

NSString *JobsAppendExtensionIfNeeded(NSString * _Nullable name,
                                      NSString * _Nullable fileExtension) {
    if (JobsObjectIsNull(name)) return @"";
    if (JobsObjectIsNull(fileExtension)) return name ?: @"";
    return [name stringByAppendingPathExtension:fileExtension];
}

static NSArray<NSBundle *> *JobsCandidateBundles(void) {
    NSMutableArray<NSBundle *> *bundles = NSMutableArray.array;

    NSBundle *classBundle = [NSBundle bundleForClass:JobsLoadingImageToken.class];
    if (classBundle) [bundles addObject:classBundle];

    NSBundle *mainBundle = NSBundle.mainBundle;
    if (mainBundle && ![bundles containsObject:mainBundle]) {
        [bundles addObject:mainBundle];
    }

    NSString *nestedBundlePath = [classBundle pathForResource:@"JobsLoadingImageAssets" ofType:@"bundle"];
    if (JobsObjectIsValue(nestedBundlePath)) {
        NSBundle *nestedBundle = [NSBundle bundleWithPath:nestedBundlePath];
        if (nestedBundle && ![bundles containsObject:nestedBundle]) {
            [bundles insertObject:nestedBundle atIndex:0];
        }
    }

    return bundles.copy;
}

static NSString * _Nullable JobsFindResourcePathInBundles(NSString * _Nullable resourceName,
                                                          NSString * _Nullable resourceType,
                                                          NSString * _Nullable directory) {
    if (JobsObjectIsNull(resourceName)) {
        return nil;
    }

    for (NSBundle *bundle in JobsCandidateBundles()) {
        NSString *path = [bundle pathForResource:resourceName
                                          ofType:resourceType
                                     inDirectory:directory];
        if (JobsObjectIsValue(path)) {
            return path;
        }
    }

    return nil;
}

NSString *JobsBundleResourcePath(NSString * _Nullable blueFolderName,
                                 NSString * _Nullable bundleName,
                                 NSString * _Nullable bundleFolderName,
                                 NSString * _Nullable resourceType) {
    NSString *filePath = nil;

    if (JobsObjectIsValue(blueFolderName)) {
        filePath = JobsFindResourcePathInBundles(bundleName,
                                                 resourceType,
                                                 blueFolderName);
    } else {
        filePath = JobsFindResourcePathInBundles(bundleName,
                                                 resourceType,
                                                 nil);

        if (JobsObjectIsNull(filePath) && JobsObjectIsValue(resourceType)) {
            NSString *fullName = JobsAppendExtensionIfNeeded(bundleName ?: @"", resourceType);
            filePath = JobsFindResourcePathInBundles(fullName,
                                                     nil,
                                                     nil);
        }
    }

    if (JobsObjectIsNull(filePath)) {
        return @"";
    }

    if (JobsObjectIsValue(bundleFolderName)) {
        filePath = [filePath stringByAppendingPathComponent:bundleFolderName];
    }

    return filePath ?: @"";
}

NSString *JobsBundleImagePath(NSString * _Nullable blueFolderName,
                              NSString * _Nullable bundleName,
                              NSString * _Nullable bundleFolderName,
                              NSString * _Nullable imageNameOrFilename) {
    NSString *safeImageName = imageNameOrFilename ?: @"";
    NSString *filePath = JobsBundleResourcePath(blueFolderName,
                                                bundleName,
                                                bundleFolderName,
                                                @"bundle");

    if (JobsObjectIsNull(filePath)) {
        return @"";
    }

    if (![safeImageName containsString:@"."]) {
        safeImageName = [safeImageName stringByAppendingPathExtension:@"png"];
    }

    return [filePath stringByAppendingPathComponent:safeImageName];
}

UIImage * _Nullable JobsLoadBundleImage(NSString * _Nullable blueFolderName,
                                        NSString * _Nullable bundleName,
                                        NSString * _Nullable bundleFolderName,
                                        NSString * _Nullable imageNameOrFilename) {
    NSString *imagePath = JobsBundleImagePath(blueFolderName,
                                              bundleName,
                                              bundleFolderName,
                                              imageNameOrFilename);
    return JobsObjectIsValue(imagePath) ? [UIImage imageWithContentsOfFile:imagePath] : nil;
}

NSData * _Nullable JobsLoadBundleImageData(NSString * _Nullable blueFolderName,
                                           NSString * _Nullable bundleName,
                                           NSString * _Nullable bundleFolderName,
                                           NSString * _Nullable imageNameOrFilename) {
    NSString *imagePath = JobsBundleImagePath(blueFolderName,
                                              bundleName,
                                              bundleFolderName,
                                              imageNameOrFilename);
    return JobsObjectIsValue(imagePath) ? [NSData dataWithContentsOfFile:imagePath] : nil;
}

UIImage * _Nullable JobsLoadBundleImageFromData(NSString * _Nullable blueFolderName,
                                                NSString * _Nullable bundleName,
                                                NSString * _Nullable bundleFolderName,
                                                NSString * _Nullable imageNameOrFilename) {
    NSData *data = JobsLoadBundleImageData(blueFolderName,
                                           bundleName,
                                           bundleFolderName,
                                           imageNameOrFilename);
    return data ? [UIImage imageWithData:data] : nil;
}
