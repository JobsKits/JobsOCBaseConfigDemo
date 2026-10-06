//
//  JobsCrashSignalRecorderTests.c
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#include "JobsCrashSignalRecorder.h"
#include <assert.h>
#include <sys/wait.h>
#include <sys/resource.h>
#include <stdlib.h>
#include <stdio.h>

static void JobsExistingSignalHandler(int signalNumber) {
    (void)signalNumber;
    _exit(42);
}

int main(int argc, char **argv) {
    assert(argc == 2);
    pid_t child = fork();
    assert(child >= 0);
    if (child == 0) {
        struct rlimit limit = {0, 0};
        setrlimit(RLIMIT_CORE, &limit);
        assert(JobsInstallCrashSignalRecorder(argv[1]) > 0);
        raise(SIGABRT);
        _exit(99);
    }
    int status = 0;
    assert(waitpid(child, &status, 0) == child);
    assert(WIFSIGNALED(status) && WTERMSIG(status) == SIGABRT);
    int descriptor = open(argv[1], O_RDONLY);
    assert(descriptor >= 0);
    JobsCrashSignalRecord record = {0};
    assert(read(descriptor, &record, sizeof(record)) == sizeof(record));
    assert(record.magic == JOBS_CRASH_SIGNAL_MAGIC && record.version == 1);
    assert(record.signalNumber == SIGABRT && record.processID == child);
    close(descriptor);
    child = fork();
    assert(child >= 0);
    if (child == 0) {
        signal(SIGFPE, JobsExistingSignalHandler);
        struct sigaction before = {0};
        struct sigaction after = {0};
        sigaction(SIGPIPE, NULL, &before);
        JobsInstallCrashSignalRecorder(argv[1]);
        sigaction(SIGPIPE, NULL, &after);
        assert(before.sa_handler == after.sa_handler);
        raise(SIGFPE);
        _exit(99);
    }
    assert(waitpid(child, &status, 0) == child);
    assert(WIFEXITED(status) && WEXITSTATUS(status) == 42);
    puts("PASS: fixed C record, fatal signal retained, existing handler preserved, SIGPIPE untouched");
    return 0;
}
