//
//  CMMotionManager+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "CMMotionManager+DSL.h"

@implementation CMMotionManager (DSL)

+(JobsRetCMMotionManagerByVoidBlock)byMotionManager{
    return ^__kindof CMMotionManager *_Nullable(void){ return CMMotionManager.new; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock)byAccelerometerUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.accelerometerUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock)byGyroUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.gyroUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock)byMagnetometerUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.magnetometerUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByTimeIntervalBlock)byDeviceMotionUpdateInterval{
    return ^__kindof CMMotionManager *_Nullable(NSTimeInterval data){ self.deviceMotionUpdateInterval = data; return self; };
}

-(JobsRetCMMotionManagerByBOOLBlock)byShowsDeviceMovementDisplay{
    return ^__kindof CMMotionManager *_Nullable(BOOL data){ self.showsDeviceMovementDisplay = data; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStartAccelerometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startAccelerometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndAccelerometerHandlerBlock)byStartAccelerometerUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMAccelerometerHandler handler){ [self startAccelerometerUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStopAccelerometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopAccelerometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStartGyroUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startGyroUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndGyroHandlerBlock)byStartGyroUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMGyroHandler handler){ [self startGyroUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStopGyroUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopGyroUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStartMagnetometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startMagnetometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndMagnetometerHandlerBlock)byStartMagnetometerUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMMagnetometerHandler handler){ [self startMagnetometerUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStopMagnetometerUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopMagnetometerUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStartDeviceMotionUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self startDeviceMotionUpdates]; return self; };
}

-(JobsRetCMMotionManagerByOperationQueueAndDeviceMotionHandlerBlock)byStartDeviceMotionUpdatesToQueue{
    return ^__kindof CMMotionManager *_Nullable(NSOperationQueue *queue, CMDeviceMotionHandler handler){ [self startDeviceMotionUpdatesToQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByAttitudeReferenceFrameBlock)byStartDeviceMotionUpdatesUsingReferenceFrame{
    return ^__kindof CMMotionManager *_Nullable(CMAttitudeReferenceFrame data){ [self startDeviceMotionUpdatesUsingReferenceFrame:data]; return self; };
}

-(JobsRetCMMotionManagerByReferenceFrameOperationQueueAndDeviceMotionHandlerBlock)byStartDeviceMotionUpdatesUsingReferenceFrameToQueue{
    return ^__kindof CMMotionManager *_Nullable(CMAttitudeReferenceFrame referenceFrame, NSOperationQueue *queue, CMDeviceMotionHandler handler){ [self startDeviceMotionUpdatesUsingReferenceFrame:referenceFrame toQueue:queue withHandler:handler]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStopDeviceMotionUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){ [self stopDeviceMotionUpdates]; return self; };
}

-(JobsRetCMMotionManagerByVoidBlock)byStopAllUpdates{
    return ^__kindof CMMotionManager *_Nullable(void){
        [self stopAccelerometerUpdates];
        [self stopGyroUpdates];
        [self stopMagnetometerUpdates];
        [self stopDeviceMotionUpdates];
        return self;
    };
}

@end
