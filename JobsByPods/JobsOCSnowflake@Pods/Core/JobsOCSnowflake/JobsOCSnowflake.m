//
//  JobsOCSnowflake.m
//  JobsOCSnowflake
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsOCSnowflake.h"

static const uint32_t kSymbolBits = 1;
static const uint32_t kTimeBits = 41;
static const uint32_t kIDCBits = 5;
static const uint32_t kMachineBits = 5;
static const uint32_t kSequenceBits = 12;
static const uint64_t kMaximumClockDriftMilliseconds = 5000;

static uint64_t JobsSnowflakeSystemMilliseconds(void) {
    NSTimeInterval seconds = NSDate.date.timeIntervalSince1970;
    if (seconds < 0 || seconds != seconds || seconds >= (double)UINT64_MAX / 1000.0) {
        return 0;
    }
    return (uint64_t)(seconds * 1000.0);
}

@interface JobsOCSnowflake ()

Prop_assign()uint32_t machine;
Prop_assign()uint32_t IDC;
Prop_assign()uint32_t sequence;
Prop_assign()uint64_t publishMillisecond;
Prop_assign()uint64_t lastGeneralMillisecond;
Prop_copy()JobsRetuint64_tByVoidBlock clock;
Prop_assign()BOOL hasIssuedID;
Prop_assign()uint64_t issuedMillisecond;
Prop_assign()uint32_t issuedSequence;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSnowflake
@interface JobsOCSnowflake (JobsPropertyDSLSetterAutogen_3b348d5574)
-(void)setLastGeneralMillisecond:(uint64_t)data;
-(void)setSequence:(uint32_t)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSnowflake

@implementation JobsOCSnowflake
/// 初始化方法
/// - Parameters:
///   - publishMillisecond: 表示雪花算法开始生成 ID 的时间戳（以毫秒为单位）。这是生成 ID 时使用的基准时间。此参数设置生成雪花 ID 的起始时间点。例如，如果你希望雪花 ID 从某个特定的日期和时间开始生成，你需要提供该时刻的时间戳。
///   - IDC: 表示 IDC（数据中心）的标识符。用于唯一标识运行雪花算法的特定数据中心或集群。此参数帮助标识哪个数据中心或集群生成了某个雪花 ID。它允许你在多个数据中心中扩展 ID 生成而不会发生冲突。IDC 的值必须在算法配置允许的范围内（由 kIDCBits 定义）。
///   - machine: 表示数据中心内的机器或服务器的标识符。用于唯一标识生成雪花 ID 的特定机器或服务器。此参数帮助区分同一数据中心内不同机器生成的 ID。即使多台机器在生成 ID，每台机器生成的 ID 也将保持唯一。机器 ID 的值必须在算法配置允许的范围内（由 kMachineBits 定义）。
-(instancetype _Nullable)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine{
    return [self initWithPublishMillisecond:publishMillisecond
                                    IDCID:IDC
                                machineID:machine
                                    clock:nil];
}

-(instancetype _Nullable)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine
                                             clock:(JobsRetuint64_tByVoidBlock _Nullable)clock{
    self = [super init];
    if (!self) {
        return nil;
    }
    uint64_t now = clock ? clock() : JobsSnowflakeSystemMilliseconds();
    if (IDC >= (UINT32_C(1) << kIDCBits) ||
        machine >= (UINT32_C(1) << kMachineBits) ||
        publishMillisecond > now ||
        now - publishMillisecond >= (UINT64_C(1) << kTimeBits)) {
        return nil;
    }
    _publishMillisecond = publishMillisecond;
    _lastGeneralMillisecond = publishMillisecond;
    _IDC = IDC;
    _machine = machine;
    _clock = [clock copy];
    return self;
}

-(JobsRetNSNumberByVoidBlock _Nonnull)nextID{
    @jobs_weakify(self)
    return ^NSNumber *{
        @jobs_strongify(self)
        if (!self) return nil;
        @synchronized (self) {
            uint64_t wallTime = self.clock ? self.clock() : JobsSnowflakeSystemMilliseconds();
            if (wallTime < self.publishMillisecond) {
                return nil;
            }
            uint64_t timestamp = self.hasIssuedID
                ? MAX(wallTime, self.issuedMillisecond)
                : wallTime;
            uint32_t sequence = self.hasIssuedID && timestamp == self.issuedMillisecond
                ? self.issuedSequence + 1
                : 0;
            if (sequence == (UINT32_C(1) << kSequenceBits)) {
                if (timestamp == UINT64_MAX) {
                    return nil;
                }
                timestamp += 1;
                sequence = 0;
            }
            // Advance logical time on wrap/rollback instead of blocking the caller indefinitely.
            if (timestamp - wallTime > kMaximumClockDriftMilliseconds ||
                timestamp - self.publishMillisecond >= (UINT64_C(1) << kTimeBits)) {
                return nil;
            }
            _issuedMillisecond = timestamp;
            _issuedSequence = sequence;
            _hasIssuedID = YES;
            _lastGeneralMillisecond = timestamp;
            _sequence = sequence;
            uint64_t timeParameter = timestamp - self.publishMillisecond;
            uint64_t timeOffset = kIDCBits + kMachineBits + kSequenceBits;
            uint64_t idcParameter = self.IDC;
            uint64_t idcOffset = kMachineBits + kSequenceBits;
            uint64_t machineParameter = self.machine;
            uint64_t machineOffset = kSequenceBits;
            uint64_t result = (timeParameter << timeOffset) | (idcParameter << idcOffset) | (machineParameter << machineOffset) | sequence;
            return @(result);
        }
    };
}

-(JobsRetuint64_tByuint64_tBlock _Nonnull)timeWithID{
    @jobs_weakify(self)
    return ^uint64_t(uint64_t id){
        @jobs_strongify(self)
        if (!self) return (uint64_t){0};
        uint64_t timeOffset = kIDCBits + kMachineBits + kSequenceBits;
        uint64_t relativeTime = (id >> timeOffset) & ((UINT64_C(1) << kTimeBits) - 1);
        if (relativeTime > UINT64_MAX - self.publishMillisecond) {
            return 0;
        }
        return relativeTime + self.publishMillisecond;
    };
}

-(JobsRetuint32_tByuint64_tBlock _Nonnull)IDCWithID{
    @jobs_weakify(self)
    return ^uint32_t(uint64_t id){
        @jobs_strongify(self)
        if (!self) return (uint32_t){0};
        uint64_t step1 = id << (kTimeBits + kSymbolBits);
        return (uint32_t)(step1 >> (kTimeBits + kMachineBits + kSequenceBits + kSymbolBits));
    };
}

-(JobsRetuint32_tByuint64_tBlock _Nonnull)machineWithID{
    @jobs_weakify(self)
    return ^uint32_t(uint64_t id){
        @jobs_strongify(self)
        if (!self) return (uint32_t){0};
        uint64_t step1 = id << (kTimeBits + kIDCBits + kSymbolBits);
        return (uint32_t)(step1 >> (kIDCBits + kTimeBits + kSequenceBits + kSymbolBits));
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSnowflake
-(JobsRetJobsOCSnowflakeByuint32_tBlock _Nonnull)bySequence{
    @jobs_weakify(self)
    return ^__kindof JobsOCSnowflake * _Nullable(uint32_t data){
        @jobs_strongify(self)
        [self setSequence:data];
        return self;
    };
}

-(JobsRetJobsOCSnowflakeByuint64_tBlock _Nonnull)byLastGeneralMillisecond{
    @jobs_weakify(self)
    return ^__kindof JobsOCSnowflake * _Nullable(uint64_t data){
        @jobs_strongify(self)
        [self setLastGeneralMillisecond:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSnowflake
@end
