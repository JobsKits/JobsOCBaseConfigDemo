//
//  JobsCrashSignalRecorder.c
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#include "JobsCrashSignalRecorder.h"

_Static_assert(ATOMIC_INT_LOCK_FREE == 2, "The signal recorder requires lock-free int atomics");
static int JobsSignalFileDescriptor = -1;
static struct sigaction JobsPreviousSignalActions[NSIG];
static _Atomic unsigned int JobsSignalRecordWritten = 0;

static void JobsRecordFatalSignal(int signalNumber) {
    int savedErrno = errno;
    if (atomic_exchange_explicit(&JobsSignalRecordWritten, 1, memory_order_relaxed) == 0 &&
        JobsSignalFileDescriptor >= 0) {
        JobsCrashSignalRecord record = {
            JOBS_CRASH_SIGNAL_MAGIC, 1, signalNumber, (int32_t)getpid()
        };
        const char *bytes = (const char *)&record;
        size_t remaining = sizeof(record);
        for (unsigned int attempt = 0; remaining > 0 && attempt < 4; attempt++) {
            ssize_t written = write(JobsSignalFileDescriptor, bytes, remaining);
            if (written > 0) {
                bytes += written;
                remaining -= (size_t)written;
            } else if (written < 0 && errno == EINTR) {
                continue;
            } else {
                break;
            }
        }
    }
    // 仅接管默认致命信号；还原默认处理后再次发送，保留系统崩溃行为。
    sigaction(signalNumber, &JobsPreviousSignalActions[signalNumber], NULL);
    errno = savedErrno;
    kill(getpid(), signalNumber);
}

int JobsInstallCrashSignalRecorder(const char *path) {
    if (!path || JobsSignalFileDescriptor >= 0) {
        return 0;
    }
    int descriptor = open(path, O_CREAT | O_WRONLY | O_APPEND | O_CLOEXEC, 0600);
    if (descriptor < 0) {
        return 0;
    }
    JobsSignalFileDescriptor = descriptor;
    const int signals[] = {SIGABRT, SIGILL, SIGSEGV, SIGFPE, SIGBUS};
    int installedCount = 0;
    for (size_t index = 0; index < sizeof(signals) / sizeof(signals[0]); index++) {
        int signalNumber = signals[index];
        struct sigaction previous = {0};
        if (sigaction(signalNumber, NULL, &previous) != 0 || previous.sa_handler != SIG_DFL) {
            continue;
        }
        JobsPreviousSignalActions[signalNumber] = previous;
        struct sigaction action = {0};
        action.sa_handler = JobsRecordFatalSignal;
        sigemptyset(&action.sa_mask);
        sigaddset(&action.sa_mask, signalNumber);
        if (sigaction(signalNumber, &action, NULL) == 0) {
            installedCount++;
        }
    }
    if (installedCount == 0) {
        close(descriptor);
        JobsSignalFileDescriptor = -1;
    }
    return installedCount;
}
