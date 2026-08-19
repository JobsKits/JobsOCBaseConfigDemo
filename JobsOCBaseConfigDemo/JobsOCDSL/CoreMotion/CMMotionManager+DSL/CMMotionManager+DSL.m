//
//  CMMotionManager+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "CMMotionManager+DSL.h"

@implementation CMMotionManager (DSL)

+(JobsRetCMMotionManagerByVoidBlock _Nonnull)byMotionManager{
    return ^__kindof CMMotionManager *_Nullable(void){ return CMMotionManager.new; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock _Nonnull)byAccelerometerUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.accelerometerUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock _Nonnull)byGyroUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.gyroUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock _Nonnull)byMagnetometerUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.magnetometerUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock _Nonnull)byDeviceMotionUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.deviceMotionUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByBOOLBlock _Nonnull)byShowsDeviceMovementDisplay{
    return ^__kindof CMMotionManager *_Nullable(BOOL data){ self.showsDeviceMovementDisplay = data; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStartAccelerometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startAccelerometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndAccelerometerHandlerBlock _Nonnull)byStartAccelerometerUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMAccelerometerHandler handler){ [self startAccelerometerUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStopAccelerometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopAccelerometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStartGyroUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startGyroUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndGyroHandlerBlock _Nonnull)byStartGyroUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMGyroHandler handler){ [self startGyroUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStopGyroUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopGyroUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStartMagnetometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startMagnetometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndMagnetometerHandlerBlock _Nonnull)byStartMagnetometerUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMMagnetometerHandler handler){ [self startMagnetometerUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStopMagnetometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopMagnetometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStartDeviceMotionUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startDeviceMotionUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndDeviceMotionHandlerBlock _Nonnull)byStartDeviceMotionUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMDeviceMotionHandler handler){ [self startDeviceMotionUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByAttitudeReferenceFrameBlock _Nonnull)byStartDeviceMotionUpdatesUsingReferenceFrame{
    return ^__kindof CMMotionManager *_Nullable(CMAttitudeReferenceFrame data){ [self startDeviceMotionUpdatesUsingReferenceFrame:data]; return self; };
}

-(JobsRetCMMotionManagerByReferenceFrameOperationQueueAndDeviceMotionHandlerBlock _Nonnull)byStartDeviceMotionUpdatesUsingReferenceFrameToQueue{
    return ^__kindof CMMotionManager *_Nullable(CMAttitudeReferenceFrame referenceFrame, NSOperationQueue *queue, CMDeviceMotionHandler handler){ [self startDeviceMotionUpdatesUsingReferenceFrame:referenceFrame toQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStopDeviceMotionUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopDeviceMotionUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock _Nonnull)byStopAllUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){
        [self stopAccelerometerUpdates];
        [self stopGyroUpdates];
        [self stopMagnetometerUpdates];
        [self stopDeviceMotionUpdates];
        return self;
    };
}

@end
