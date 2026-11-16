//
//  JobsOCDeviceGuardConfiguration.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardConfiguration.h"

@implementation JobsOCDeviceGuardConfiguration

-(instancetype)init {
    if (self = [super init]) {
        _minimumDetectedCategories = 2;
        _sandboxWriteProbeEnabled = NO;
        _jailbreakPaths = @[
            @"/Applications/Cydia.app", @"/Applications/Sileo.app", @"/Applications/Zebra.app",
            @"/Library/MobileSubstrate/MobileSubstrate.dylib", @"/Library/MobileSubstrate/DynamicLibraries",
            @"/private/var/lib/apt", @"/private/var/lib/cydia", @"/private/var/jailbreakcaches",
            @"/usr/sbin/sshd", @"/var/jb", @"/var/jb/Applications/Sileo.app",
            @"/var/jb/usr/lib/libellekit.dylib", @"/var/jb/Library/MobileSubstrate/MobileSubstrate.dylib"
        ];
        _loadedImageNames = @[
            @"mobilesubstrate.dylib", @"substrate.dylib", @"substrateloader.dylib", @"substitute.dylib", @"substitute-inserter.dylib",
            @"libsubstitute.dylib", @"libhooker.dylib", @"libellekit.dylib", @"ellekit.dylib",
            @"fridagadget.dylib", @"frida-gadget.dylib", @"frida-agent.dylib", @"libcycript.dylib"
        ];
    }
    return self;
}

+(JobsOCDeviceGuardConfiguration * _Nonnull (^ _Nonnull)(void))defaultConfiguration {
    return ^JobsOCDeviceGuardConfiguration * {
        return [JobsOCDeviceGuardConfiguration new];
    };
}

-(JobsRetJobsOCDeviceGuardConfigurationByBOOLBlock _Nonnull)bySandboxWriteProbeEnabled {
    return ^JobsOCDeviceGuardConfiguration *(BOOL enabled) {
        self->_sandboxWriteProbeEnabled = enabled;
        return self;
    };
}

-(JobsRetJobsOCDeviceGuardConfigurationByNSUIntegerBlock _Nonnull)byMinimumDetectedCategories {
    return ^JobsOCDeviceGuardConfiguration *(NSUInteger minimum) {
        self->_minimumDetectedCategories = MIN(3, MAX(2, minimum));
        return self;
    };
}

-(id)copyWithZone:(NSZone *)zone {
    JobsOCDeviceGuardConfiguration *copy = [[JobsOCDeviceGuardConfiguration allocWithZone:zone] init];
    copy->_sandboxWriteProbeEnabled = _sandboxWriteProbeEnabled;
    copy->_minimumDetectedCategories = _minimumDetectedCategories;
    return copy;
}

@end
