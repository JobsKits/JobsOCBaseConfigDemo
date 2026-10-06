require 'tmpdir'
require 'open3'

pod_root = File.expand_path('..', __dir__)
core = File.join(pod_root, 'Core', 'CrashLog', 'JobsCrashSignalRecorder')
Dir.mktmpdir('jobs-signal-regression-') do |root|
  executable = File.join(root, 'signal-tests')
  output, status = Open3.capture2e('clang', '-std=c11', '-fsanitize=undefined', '-fno-sanitize-recover=all', '-I', core,
    File.join(core, 'JobsCrashSignalRecorder.c'), File.join(__dir__, 'JobsCrashSignalRecorderTests', 'JobsCrashSignalRecorderTests.c'), '-o', executable)
  abort output unless status.success?
  output, status = Open3.capture2e(executable, File.join(root, 'signals.bin'))
  puts output
  abort 'Signal regression failed' unless status.success?
end

# 普通导入使用当前生产内核；故障仅注入普通POSIX writer，不影响上面的pure-C signal回归。
crash_source = File.read(File.join(pod_root, 'Core', 'CrashLog', 'JobsOCCrashLogCenter', 'JobsOCCrashLogCenter.m'))
def jobs_crash_extract(source, signature)
  start = source.index(signature)
  abort "Missing production method #{signature}" unless start
  opening = source.index('{', start)
  depth = 1
  cursor = opening + 1
  while depth.positive?
    depth += 1 if source[cursor] == '{'
    depth -= 1 if source[cursor] == '}'
    cursor += 1
  end
  source[start...cursor]
end
writer = jobs_crash_extract(crash_source, 'static BOOL JobsOCCrashLogAppendDataToPath(')
initializer = jobs_crash_extract(crash_source, '-(instancetype)init{')
# 跳过 private declaration，只抽取实际生产 implementation。
implementation = crash_source[crash_source.index('@implementation JobsOCCrashLogCenter')..]
write_method = jobs_crash_extract(implementation, '-(BOOL)jobsWriteData:')
import_method = jobs_crash_extract(implementation, '-(BOOL)jobsImportSignalJournalAtPath:')
Dir.mktmpdir('jobs-crash-import-') do |directory|
  input = File.join(directory, 'import-regression.m')
  File.write(input, <<~OC)
    #import <Foundation/Foundation.h>
    #import <errno.h>
    #import <limits.h>
    #import <sys/stat.h>
    #import "JobsCrashSignalRecorder.h"
    typedef void (^jobsByVoidBlock)(void);
    static void *JobsOCCrashLogIOQueueSpecificKey = &JobsOCCrashLogIOQueueSpecificKey;
    static int failureMode, openCalls, writeCalls, syncCalls, closeCalls;
    static void *expectedQueueOwner;
    static BOOL wrongQueue;
    static int FixtureOpen(const char *path, int flags, mode_t mode) {
        openCalls += 1;
        if (failureMode == 1) { errno = EACCES; return -1; }
        if (failureMode == 7 && openCalls == 1) { errno = EINTR; return -1; }
        return open(path, flags, mode);
    }
    static ssize_t FixtureWrite(int descriptor, const void *bytes, size_t size) {
        writeCalls += 1;
        if (expectedQueueOwner && dispatch_get_specific(JobsOCCrashLogIOQueueSpecificKey) != expectedQueueOwner) wrongQueue = YES;
        if (failureMode == 2 || (failureMode == 3 && writeCalls > 1)) { errno = ENOSPC; return -1; }
        if (failureMode == 4) return 0;
        if (failureMode == 7 && writeCalls == 1) { errno = EINTR; return -1; }
        if (failureMode == 3 || failureMode == 7) size = MIN(size, (size_t)3);
        return write(descriptor, bytes, size);
    }
    static int FixtureSync(int descriptor) {
        syncCalls += 1;
        if (failureMode == 5) { errno = EIO; return -1; }
        if (failureMode == 7 && syncCalls == 1) { errno = EINTR; return -1; }
        return fsync(descriptor);
    }
    static int FixtureClose(int descriptor) {
        closeCalls += 1;
        int result = close(descriptor);
        if (failureMode == 6 || failureMode == 8) { errno = failureMode == 8 ? EINTR : EIO; return -1; }
        return result;
    }
    #define open FixtureOpen
    #define write FixtureWrite
    #define fsync FixtureSync
    #define close FixtureClose
    #{writer}
    #undef open
    #undef write
    #undef fsync
    #undef close
    @interface JobsOCCrashLogCenter : NSObject
    @property(strong)dispatch_queue_t ioQueue;
    @property(strong)NSMutableArray *notificationTokens;
    @property(copy)NSString *sessionID;
    @property(strong)NSDate *sessionStartedAt;
    -(BOOL)jobsWriteData:(NSData *)data toPath:(NSString *)path;
    -(BOOL)jobsImportSignalJournalAtPath:(NSString *)signalPath logPath:(NSString *)logPath;
    @end
    @implementation JobsOCCrashLogCenter
    #{initializer}
    #{write_method}
    #{import_method}
    @end
    static void check(BOOL condition, NSString *message) {
        if (!condition) { fprintf(stderr, "%s\\n", message.UTF8String); exit(1); }
    }
    static void reset(int mode) {
        failureMode = mode;
        openCalls = writeCalls = syncCalls = closeCalls = 0;
        expectedQueueOwner = NULL;
        wrongQueue = NO;
    }
    int main(void) {
        alarm(20);
        @autoreleasepool {
            NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
            check([NSFileManager.defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil], @"fixture directory failed");
            NSString *journal = [directory stringByAppendingPathComponent:@"pending.signals"];
            JobsCrashSignalRecord records[] = {{JOBS_CRASH_SIGNAL_MAGIC, 1, SIGABRT, 41}, {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGSEGV, 42}};
            NSData *original = [NSData dataWithBytes:records length:sizeof(records)];
            JobsOCCrashLogCenter *center = [JobsOCCrashLogCenter new];
            int failures[] = {1, 2, 3, 4, 5, 6, 8};
            for (NSUInteger index = 0; index < sizeof(failures)/sizeof(failures[0]); index++) {
                reset(failures[index]);
                check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"journal fixture write failed");
                NSString *log = [directory stringByAppendingPathComponent:[NSString stringWithFormat:@"failure-%d.log", failureMode]];
                check(![center jobsImportSignalJournalAtPath:journal logPath:log], @"failed POSIX operation reported import success");
                check([[NSData dataWithContentsOfFile:journal] isEqualToData:original], @"failed import erased journal");
                check(failureMode == 1 || closeCalls == 1, @"descriptor not closed exactly once");
            }
            reset(7);
            check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"journal fixture write failed");
            NSString *log = [directory stringByAppendingPathComponent:@"recovered.log"];
            check([center jobsImportSignalJournalAtPath:journal logPath:log], @"EINTR/short-write recovery failed");
            check(openCalls == 2 && writeCalls > 2 && syncCalls == 2 && closeCalls == 1, @"POSIX retry path not exercised");
            check([NSData dataWithContentsOfFile:journal].length == 0, @"successful import did not clear journal");
            NSString *text = [NSString stringWithContentsOfFile:log encoding:NSUTF8StringEncoding error:nil];
            check([text containsString:@"process=41"] && [text containsString:@"process=42"], @"successful import omitted a record");
            reset(0);
            records[1].magic = 0;
            NSData *invalid = [NSData dataWithBytes:records length:sizeof(records)];
            check([invalid writeToFile:journal options:NSDataWritingAtomic error:nil], @"malformed fixture write failed");
            check(![center jobsImportSignalJournalAtPath:journal logPath:log] && openCalls == 0, @"malformed journal imported valid prefix");
            check([[NSData dataWithContentsOfFile:journal] isEqualToData:invalid], @"malformed journal erased");
            check([[NSData dataWithBytes:"abc" length:3] writeToFile:journal options:NSDataWritingAtomic error:nil], @"truncated fixture write failed");
            check(![center jobsImportSignalJournalAtPath:journal logPath:log] && [NSData dataWithContentsOfFile:journal].length == 3, @"truncated journal erased");
            check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"reentry fixture write failed");
            __block BOOL reentrant = NO;
            dispatch_sync(center.ioQueue, ^{ reentrant = [center jobsImportSignalJournalAtPath:journal logPath:log]; });
            check(reentrant, @"own queue import failed or deadlocked");
            expectedQueueOwner = (__bridge void *)center;
            JobsOCCrashLogCenter *other = [JobsOCCrashLogCenter new];
            dispatch_sync(other.ioQueue, ^{
                check([center jobsWriteData:[@"foreign queue" dataUsingEncoding:NSUTF8StringEncoding] toPath:log], @"cross-instance write failed");
            });
            check(!wrongQueue, @"different instance bypassed owner IO queue");
            NSString *readOnlyDirectory = [directory stringByAppendingPathComponent:@"read-only"];
            check([NSFileManager.defaultManager createDirectoryAtPath:readOnlyDirectory withIntermediateDirectories:NO attributes:nil error:nil], @"readonly fixture directory failed");
            NSString *readOnlyJournal = [readOnlyDirectory stringByAppendingPathComponent:@"pending.signals"];
            check([original writeToFile:readOnlyJournal options:NSDataWritingAtomic error:nil], @"readonly journal fixture failed");
            chmod(readOnlyDirectory.fileSystemRepresentation, 0500);
            BOOL cleared = [center jobsImportSignalJournalAtPath:readOnlyJournal logPath:log];
            chmod(readOnlyDirectory.fileSystemRepresentation, 0700);
            check(!cleared && [[NSData dataWithContentsOfFile:readOnlyJournal] isEqualToData:original], @"journal clear failure erased evidence or reported success");
            [NSFileManager.defaultManager removeItemAtPath:directory error:nil];
            puts("PASS: current production crash import; open/write/short-write/zero-write/fsync/close failures preserve journal, EINTR recovery, malformed/truncated/clear failure, own/foreign queue isolation");
        }
        return 0;
    }
  OC
  output, status = Open3.capture2e('clang', '-fobjc-arc', '-fblocks', '-I', core, '-framework', 'Foundation', input, '-o', File.join(directory, 'import-regression'))
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'import-regression'))
  puts output
  abort 'Crash journal import regression failed' unless status.success?
end
