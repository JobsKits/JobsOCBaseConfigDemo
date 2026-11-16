//
//  JobsCrashSignalRecorder.h
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_CRASH_SIGNAL_RECORDER_H
#define JOBS_CRASH_SIGNAL_RECORDER_H
#include <stdint.h>
#include <signal.h>
#include <stdatomic.h>
#include <stddef.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

typedef struct {
    uint32_t magic;
    uint32_t version;
    int32_t signalNumber;
    int32_t processID;
} JobsCrashSignalRecord;

#define JOBS_CRASH_SIGNAL_MAGIC UINT32_C(0x4A4F4253)
int JobsInstallCrashSignalRecorder(const char *path);
#endif
