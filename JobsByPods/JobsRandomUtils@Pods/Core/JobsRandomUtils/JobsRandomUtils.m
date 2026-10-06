//
//  JobsRandomUtils.m
//  JobsRandomUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsRandomUtils.h"

static uint32_t JobsRandomUpperBoundFromAbsoluteInt(int value, BOOL containBorderValue) {
    int64_t absoluteValue = value < 0 ? -(int64_t)value : (int64_t)value;
    if (containBorderValue) absoluteValue += 1;
    if (absoluteValue <= 0) return 0;
    if (absoluteValue > UINT32_MAX) return UINT32_MAX;
    return (uint32_t)absoluteValue;
}

static int JobsRandomInNormalizedRange(int first, int second, BOOL includeUpperBound) {
    int64_t lower = first < second ? first : second;
    int64_t upper = first < second ? second : first;
    uint64_t count = (uint64_t)(upper - lower) + (includeUpperBound ? 1 : 0);
    if (count == 0) {
        return (int)lower;
    }
    // Full int range has 2^32 values and cannot fit arc4random_uniform's argument.
    uint32_t offset = count == (UINT64_C(1) << 32)
        ? arc4random()
        : arc4random_uniform((uint32_t)count);
    return (int)(lower + (int64_t)offset);
}

int JobsBaseRandomNoContainBorderValue(int borderValue) {
    if (borderValue > 0) {
        uint32_t upperBound = JobsRandomUpperBoundFromAbsoluteInt(borderValue, NO);
        return upperBound ? (int)arc4random_uniform(upperBound) : 0;
    } else if (borderValue < 0) {
        uint32_t upperBound = JobsRandomUpperBoundFromAbsoluteInt(borderValue, NO);
        return upperBound ? -(int)arc4random_uniform(upperBound) : 0;
    } else return 0;
}

int JobsBaseRandomContainBorderValue(int borderValue) {
    if (borderValue > 0) {
        uint32_t upperBound = JobsRandomUpperBoundFromAbsoluteInt(borderValue, YES);
        return upperBound ? (int)arc4random_uniform(upperBound) : 0;
    } else if (borderValue < 0) {
        uint32_t upperBound = JobsRandomUpperBoundFromAbsoluteInt(borderValue, YES);
        return upperBound ? (int)(-(int64_t)arc4random_uniform(upperBound)) : 0;
    } else return 0;
}

int JobsBaseRandomOffsetValueWithNoContainBorderValue(int offsetValue, int borderValue) {
    return JobsRandomInNormalizedRange(offsetValue, borderValue, NO);
}

int JobsBaseRandomOffsetValueWithContainBorderValue(int offsetValue, int borderValue) {
    return JobsRandomInNormalizedRange(offsetValue, borderValue, YES);
}

int JobsRandomNumber(int from, int to) {
    return JobsBaseRandomOffsetValueWithContainBorderValue(from, to);
}

int JobsRandomXY(int x, int y) {
    return JobsRandomNumber(x, y);
}

int JobsRandom0_100(void) {
    return JobsBaseRandomNoContainBorderValue(100);
}

int JobsRandom0__100(void) {
    return JobsBaseRandomContainBorderValue(100);
}

int JobsRandom100_200(void) {
    return JobsBaseRandomOffsetValueWithNoContainBorderValue(100, 200);
}

int JobsRandom100__200(void) {
    return JobsBaseRandomOffsetValueWithContainBorderValue(100, 200);
}

int baseRandomNOContainBorderValue(int borderValue) {
    return JobsBaseRandomNoContainBorderValue(borderValue);
}

int baseRandomContainBorderValue(int borderValue) {
    return JobsBaseRandomContainBorderValue(borderValue);
}

int baseRandomOffsetValueWithNoContainborderValue(int offsetValue, int borderValue) {
    return JobsBaseRandomOffsetValueWithNoContainBorderValue(offsetValue, borderValue);
}

int baseRandomOffsetValueWithContainborderValue(int offsetValue, int borderValue) {
    return JobsBaseRandomOffsetValueWithContainBorderValue(offsetValue, borderValue);
}

int getRandomNumber(int from, int to) {
    return JobsRandomNumber(from, to);
}

int randomXY(int x, int y) {
    return JobsRandomXY(x, y);
}

int random0_100(void) {
    return JobsRandom0_100();
}

int random0__100(void) {
    return JobsRandom0__100();
}

int random100_200(void) {
    return JobsRandom100_200();
}

int random100__200(void) {
    return JobsRandom100__200();
}
