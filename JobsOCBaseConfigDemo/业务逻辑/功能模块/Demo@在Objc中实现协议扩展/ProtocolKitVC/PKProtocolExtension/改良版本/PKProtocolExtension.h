//
//  PKProtocolExtension.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <pthread.h>
#import <Foundation/Foundation.h>

// For a magic reserved keyword color, use @defs(your_protocol_name)
#define defs _jobs_pk_extension

// Interface
#define _jobs_pk_extension($protocol) _jobs_pk_extension_imp($protocol, _jobs_pk_get_container_class($protocol))

// Implementation
#define _jobs_pk_extension_imp($protocol, $container_class) \
    protocol $protocol; \
    @interface $container_class : NSObject <$protocol> @end \
    @implementation $container_class \
    + (void)load { \
        _jobs_pk_extension_load(@protocol($protocol), $container_class.class); \
    } \

// Get container class name by counter
#define _jobs_pk_get_container_class($protocol) _jobs_pk_get_container_class_imp($protocol, __COUNTER__)
#define _jobs_pk_get_container_class_imp($protocol, $counter) _jobs_pk_get_container_class_imp_concat(__PKContainer_, $protocol, $counter)
#define _jobs_pk_get_container_class_imp_concat($a, $b, $c) $a ## $b ## _ ## $c

void _jobs_pk_extension_load(Protocol *protocol, Class containerClass);
