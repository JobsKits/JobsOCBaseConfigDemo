//
//  UICollectionView+RegistrationTracking.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionView+RegistrationTracking.h"

static NSString *JobsCollectionViewCellRegistrationKey(NSString *identifier) {
    return [@"cell|" stringByAppendingString:identifier ?: @""];
}

static NSString *JobsCollectionViewSupplementaryRegistrationKey(NSString *elementKind, NSString *identifier) {
    return [NSString stringWithFormat:@"supplementary|%@|%@", elementKind ?: @"", identifier ?: @""];
}

@implementation UICollectionView (RegistrationTracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma mark —— registerClass:forCellWithReuseIdentifier:
        Method originalMethod = class_getInstanceMethod(UICollectionView.class,
            @selector(registerClass:forCellWithReuseIdentifier:));
        Method swizzledMethod = class_getInstanceMethod(UICollectionView.class,
            @selector(swizzled_registerClass:forCellWithReuseIdentifier:));
        if (originalMethod && swizzledMethod) {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
#pragma mark —— registerClass:forSupplementaryViewOfKind:withReuseIdentifier:
        Method originalSupplementaryMethod = class_getInstanceMethod(UICollectionView.class, @selector(registerClass:forSupplementaryViewOfKind:withReuseIdentifier:));
        Method swizzledSupplementaryMethod = class_getInstanceMethod(UICollectionView.class, @selector(swizzled_registerClass:forSupplementaryViewOfKind:withReuseIdentifier:));
        if (originalSupplementaryMethod && swizzledSupplementaryMethod) {
            method_exchangeImplementations(originalSupplementaryMethod, swizzledSupplementaryMethod);
        }
        Method originalNib = class_getInstanceMethod(UICollectionView.class, @selector(registerNib:forCellWithReuseIdentifier:));
        Method trackedNib = class_getInstanceMethod(UICollectionView.class, @selector(jobsTracked_registerNib:forCellWithReuseIdentifier:));
        if (originalNib && trackedNib) {
            method_exchangeImplementations(originalNib, trackedNib);
        }
        Method originalSupplementaryNib = class_getInstanceMethod(UICollectionView.class, @selector(registerNib:forSupplementaryViewOfKind:withReuseIdentifier:));
        Method trackedSupplementaryNib = class_getInstanceMethod(UICollectionView.class, @selector(jobsTracked_registerNib:forSupplementaryViewOfKind:withReuseIdentifier:));
        if (originalSupplementaryNib && trackedSupplementaryNib) {
            method_exchangeImplementations(originalSupplementaryNib, trackedSupplementaryNib);
        }
    });
}

- (void)swizzled_registerClass:(Class)cellClass
    forCellWithReuseIdentifier:(NSString *)identifier {
    [self swizzled_registerClass:cellClass
      forCellWithReuseIdentifier:identifier];
    [self jobsTrackRegistrationKey:JobsCollectionViewCellRegistrationKey(identifier) registered:cellClass != Nil];
}

- (void)swizzled_registerClass:(Class)viewClass
    forSupplementaryViewOfKind:(NSString *)elementKind
           withReuseIdentifier:(NSString *)identifier {
    [self swizzled_registerClass:viewClass
      forSupplementaryViewOfKind:elementKind
             withReuseIdentifier:identifier];
    [self jobsTrackRegistrationKey:JobsCollectionViewSupplementaryRegistrationKey(elementKind, identifier) registered:viewClass != Nil];
}

-(void)jobsTracked_registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    [self jobsTracked_registerNib:nib forCellWithReuseIdentifier:identifier];
    [self jobsTrackRegistrationKey:JobsCollectionViewCellRegistrationKey(identifier) registered:nib != nil];
}

-(void)jobsTracked_registerNib:(UINib *)nib
    forSupplementaryViewOfKind:(NSString *)kind
           withReuseIdentifier:(NSString *)identifier {
    [self jobsTracked_registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
    [self jobsTrackRegistrationKey:JobsCollectionViewSupplementaryRegistrationKey(kind, identifier) registered:nib != nil];
}

-(void)jobsTrackRegistrationKey:(NSString *)key registered:(BOOL)registered {
    @synchronized (self) {
        if (registered) {
            [self.registeredIdentifiers addObject:key];
        } else {
            [self.registeredIdentifiers removeObject:key];
        }
    }
}

-(JobsRetBOOLByStrBlock _Nonnull)isRegisteredForReuseIdentifier{
    @jobs_weakify(self)
    return ^BOOL(NSString * _Nullable reuseIdentifier) {
        @jobs_strongify(self)
        if (!self || !reuseIdentifier.length) {
            return NO;
        }
        @synchronized (self) {
            return [self.registeredIdentifiers containsObject:reuseIdentifier] ||
                [self.registeredIdentifiers containsObject:JobsCollectionViewCellRegistrationKey(reuseIdentifier)] ||
                [self.registeredIdentifiers containsObject:JobsCollectionViewSupplementaryRegistrationKey(UICollectionElementKindSectionHeader, reuseIdentifier)] ||
                [self.registeredIdentifiers containsObject:JobsCollectionViewSupplementaryRegistrationKey(UICollectionElementKindSectionFooter, reuseIdentifier)];
        }
    };
}
#pragma mark —— Prop_strong()NSMutableSet *registeredIdentifiers;/// 自定义标志位
JobsKey(_registeredIdentifiers)
@dynamic registeredIdentifiers;
-(NSMutableSet<NSString *> *)registeredIdentifiers{
    NSMutableSet *RegisteredIdentifiers = Jobs_getAssociatedObject(_registeredIdentifiers);
    if (!RegisteredIdentifiers) {
        RegisteredIdentifiers = NSMutableSet.set;
        Jobs_setAssociatedRETAIN_NONATOMIC(_registeredIdentifiers, RegisteredIdentifiers)
    };return RegisteredIdentifiers;
}

-(void)setRegisteredIdentifiers:(NSMutableSet<NSString *> *)registeredIdentifiers{
    Jobs_setAssociatedRETAIN_NONATOMIC(_registeredIdentifiers, registeredIdentifiers)
}

@end
