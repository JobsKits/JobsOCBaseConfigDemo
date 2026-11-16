//
//  JobsARKitScene.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

#import "JobsARKitScene.h"

// 原生对象构造集中在管线底层，页面不依赖 SceneKit 配置细节。
static ARSCNView *jobsMakeARSCNView(void) {
    return [[ARSCNView alloc] initWithFrame:CGRectZero];
}

static SCNView *jobsMakeSCNView(void) {
    return [[SCNView alloc] initWithFrame:CGRectZero];
}

static SCNNode *jobsMakeSCNNode(SCNGeometry *geometry) {
    return [SCNNode nodeWithGeometry:geometry];
}

static ARAnchor *jobsMakeARAnchor(matrix_float4x4 transform) {
    return [[ARAnchor alloc] initWithName:@"JobsARKit.model" transform:transform];
}

static ARWorldTrackingConfiguration *jobsMakeARConfiguration(void) {
    ARWorldTrackingConfiguration *configuration = [[ARWorldTrackingConfiguration alloc] init];
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    configuration.lightEstimationEnabled = YES;
    return configuration;
}

@interface JobsARKitScene ()

Prop_strong() ARSCNView *arView;
Prop_strong() SCNView *previewView;
Prop_strong() NSMutableDictionary<NSUUID *, SCNNode *> *objects;
Prop_strong() NSMutableDictionary<NSUUID *, ARAnchor *> *anchors;
Prop_strong() NSMutableSet<NSUUID *> *planes;
Prop_strong() SCNNode *selectedNode;
Prop_assign(readwrite) BOOL previewing;
Prop_assign() BOOL visible;
Prop_assign() BOOL started;
Prop_assign() BOOL trackingReady;
Prop_assign(readwrite) NSUInteger selectedModelIndex;
Prop_strong() NSMutableArray<SCNNode *> *previewModels;
Prop_assign() NSTimeInterval lastPlacementUpdate;
Prop_assign() BOOL lastPlacementReady;
Prop_assign() NSUInteger requestGeneration;
Prop_assign() BOOL wantsAR;
Prop_copy() NSString *lastStatus;

@end

@implementation JobsARKitScene

-(instancetype)init {
    self = [super init];
    if (self) {
        _modelIndex = NSNotFound;
        _selectedModelIndex = NSNotFound;
        _previewModels = [NSMutableArray array];
        _objects = [NSMutableDictionary dictionary];
        _anchors = [NSMutableDictionary dictionary];
        _planes = [NSMutableSet set];
        _arView = jobsMakeARSCNView();
        _arView.scene = [SCNScene scene];
        _arView.backgroundColor = [UIColor colorWithRed:0.055 green:0.09 blue:0.14 alpha:1];
        _arView.delegate = self;
        _arView.session.delegate = self;
        _arView.automaticallyUpdatesLighting = YES;
        _arView.autoenablesDefaultLighting = YES;
        _arView.antialiasingMode = SCNAntialiasingModeMultisampling4X;
        _lastStatus = @"ready";
    }
    return self;
}

-(UIView *)view {
    return self.previewing ? self.previewView : self.arView;
}

-(void)dealloc {
    [_arView.session pause];
    _arView.delegate = nil;
    _arView.session.delegate = nil;
}

-(void)publish:(NSString *)key {
    self.lastStatus = key;
    if (self.onChange) {
        self.onChange(key, self.planes.count, self.objects.count);
    }
}

-(void)resume {
    self.visible = YES;
    BOOL cameraRestored = [self.lastStatus isEqualToString:@"cameraDenied"] &&
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo] == AVAuthorizationStatusAuthorized;
    if (!self.previewing && (self.started || cameraRestored || self.wantsAR)) {
        [self start];
    } else {
        [self publish:self.previewing ? @"previewNotice" : self.lastStatus];
    }
}

-(void)pause {
    self.requestGeneration += 1;
    self.visible = NO;
    self.trackingReady = NO;
    [self.arView.session pause];
    [self publish:@"paused"];
}

-(void)start {
    if (!self.visible) {
        return;
    }
    self.wantsAR = YES;
    NSUInteger generation = ++self.requestGeneration;
    if (self.previewing) {
        self.previewing = NO;
        self.started = NO;
        [self clear];
        [self.planes removeAllObjects];
    }
    if (!ARWorldTrackingConfiguration.isSupported) {
        [self publish:@"unsupported"];
        return;
    }
    AVAuthorizationStatus permission = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (permission == AVAuthorizationStatusNotDetermined) {
        @jobs_weakify(self)
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (!self || !self.visible || !self.wantsAR || self.previewing || generation != self.requestGeneration) {
                    return;
                }
                if (granted) {
                    [self start];
                } else {
                    [self publish:@"cameraDenied"];
                }
            });
        }];
        return;
    }
    if (permission != AVAuthorizationStatusAuthorized) {
        [self publish:@"cameraDenied"];
        return;
    }
    [self clear];
    [self.planes removeAllObjects];
    self.previewing = NO;
    self.started = YES;
    self.trackingReady = NO;
    [self.arView.session runWithConfiguration:jobsMakeARConfiguration() options:ARSessionRunOptionResetTracking | ARSessionRunOptionRemoveExistingAnchors];
    [self publish:@"scanning"];
}

-(void)showPreview {
    self.requestGeneration += 1;
    self.wantsAR = NO;
    [self.arView.session pause];
    [self clear];
    [self.planes removeAllObjects];
    self.started = NO;
    self.previewing = YES;
    self.trackingReady = NO;
    self.previewView = jobsMakeSCNView();
    self.previewView.scene = [SCNScene scene];
    self.previewView.autoenablesDefaultLighting = YES;
    self.previewView.allowsCameraControl = NO;
    self.previewView.backgroundColor = [UIColor colorWithRed:0.055 green:0.09 blue:0.14 alpha:1];
    SCNNode *camera = jobsMakeSCNNode(nil);
    camera.camera = [SCNCamera camera];
    camera.camera.zNear = 0.01;
    camera.camera.zFar = 100;
    camera.position = SCNVector3Make(0, 0.35, 0.8);
    camera.eulerAngles = SCNVector3Make(-0.3, 0, 0);
    [self.previewView.scene.rootNode addChildNode:camera];
    self.previewView.pointOfView = camera;
    self.previewView.playing = YES;
    SCNFloor *floor = [SCNFloor floor];
    floor.reflectivity = 0.12;
    floor.firstMaterial.diffuse.contents = [UIColor colorWithWhite:0.16 alpha:1];
    [self.previewView.scene.rootNode addChildNode:jobsMakeSCNNode(floor)];
    [self updatePreviewLayout];
    [self publish:@"previewNotice"];
}

-(SCNNode *)modelNode {
    SCNNode *root = jobsMakeSCNNode(nil);
    UIColor *mint = [UIColor colorWithRed:0.22 green:0.88 blue:0.71 alpha:1];
    if (self.modelIndex == 0) {
        SCNBox *box = [SCNBox boxWithWidth:0.10 height:0.10 length:0.10 chamferRadius:0.01];
        box.firstMaterial.diffuse.contents = mint;
        SCNNode *body = jobsMakeSCNNode(box);
        body.position = SCNVector3Make(0, 0.05, 0);
        [root addChildNode:body];
    } else if (self.modelIndex == 1) {
        SCNSphere *sphere = [SCNSphere sphereWithRadius:0.07];
        sphere.firstMaterial.diffuse.contents = [UIColor colorWithRed:1 green:0.65 blue:0.25 alpha:1];
        SCNNode *body = jobsMakeSCNNode(sphere);
        body.position = SCNVector3Make(0, 0.07, 0);
        [root addChildNode:body];
    } else {
        SCNBox *body = [SCNBox boxWithWidth:0.1 height:0.12 length:0.07 chamferRadius:0.014];
        body.firstMaterial.diffuse.contents = mint;
        SCNNode *torso = jobsMakeSCNNode(body);
        torso.position = SCNVector3Make(0, 0.09, 0);
        [root addChildNode:torso];
        SCNSphere *head = [SCNSphere sphereWithRadius:0.05];
        head.firstMaterial.diffuse.contents = [UIColor colorWithWhite:0.93 alpha:1];
        SCNNode *headNode = jobsMakeSCNNode(head);
        headNode.position = SCNVector3Make(0, 0.19, 0);
        [root addChildNode:headNode];
        for (NSInteger sign = -1; sign <= 1; sign += 2) {
            SCNSphere *eye = [SCNSphere sphereWithRadius:0.009];
            eye.firstMaterial.diffuse.contents = [UIColor colorWithWhite:0.08 alpha:1];
            SCNNode *eyeNode = jobsMakeSCNNode(eye);
            eyeNode.position = SCNVector3Make(sign * 0.021, 0.195, 0.043);
            [root addChildNode:eyeNode];
        }
    }
    return root;
}

-(void)placeAtPoint:(CGPoint)point {
    if (self.modelIndex >= 3) {
        [self publish:self.lastStatus];
        return;
    }
    if (self.previewing) {
        SCNNode *model = [self modelNode];
        [self.previewView.scene.rootNode addChildNode:model];
        self.objects[NSUUID.UUID] = model;
        [self.previewModels addObject:model];
        self.selectedNode = model;
        self.selectedModelIndex = self.modelIndex;
        [self updatePreviewLayout];
        [self publish:@"previewNotice"];
        return;
    }
    ARCamera *camera = self.arView.session.currentFrame.camera;
    if (!self.visible || !self.started || !self.trackingReady || !camera || camera.trackingState != ARTrackingStateNormal) {
        [self publish:self.lastStatus];
        return;
    }
    ARRaycastQuery *query = [self.arView raycastQueryFromPoint:point allowingTarget:ARRaycastTargetExistingPlaneGeometry alignment:ARRaycastTargetAlignmentHorizontal];
    ARRaycastResult *hit = query ? [self.arView.session raycast:query].firstObject : nil;
    if (!hit) {
        [self publish:@"noPlane"];
        return;
    }
    ARAnchor *anchor = jobsMakeARAnchor(hit.worldTransform);
    SCNNode *model = [self modelNode];
    // 模型先登记，renderer 回调再将其挂到 anchor 本地坐标；不重复 worldTransform。
    self.objects[anchor.identifier] = model;
    self.anchors[anchor.identifier] = anchor;
    self.selectedNode = model;
    self.selectedModelIndex = self.modelIndex;
    [self.arView.session addAnchor:anchor];
    [self publish:@"placed"];
}

-(void)clear {
    for (ARAnchor *anchor in self.anchors.allValues) {
        [self.arView.session removeAnchor:anchor];
    }
    for (SCNNode *node in self.objects.allValues) {
        [node removeFromParentNode];
    }
    [self.anchors removeAllObjects];
    [self.objects removeAllObjects];
    [self.previewModels removeAllObjects];
    self.selectedNode = nil;
    self.modelIndex = NSNotFound;
    self.selectedModelIndex = NSNotFound;
    self.lastPlacementReady = NO;
    if (self.previewing && self.previewView) {
        [self updatePreviewLayout];
    }
    [self publish:self.previewing ? @"previewNotice" : @"empty"];
}

-(void)reset {
    [self clear];
    if (self.previewing) {
        [self showPreview];
        return;
    }
    [self.planes removeAllObjects];
    if (self.visible && self.started) {
        self.trackingReady = NO;
        [self.arView.session runWithConfiguration:jobsMakeARConfiguration() options:ARSessionRunOptionResetTracking | ARSessionRunOptionRemoveExistingAnchors];
        [self publish:@"scanning"];
    } else {
        [self start];
    }
}

-(void)rotate {
    if (!self.selectedNode) {
        [self publish:@"empty"];
        return;
    }
    SCNVector3 angle = self.selectedNode.eulerAngles;
    angle.y += M_PI / 6;
    self.selectedNode.eulerAngles = angle;
    [self publish:self.lastStatus];
}

-(void)resizeBy:(CGFloat)factor {
    if (!self.selectedNode) {
        [self publish:@"empty"];
        return;
    }
    CGFloat scale = MIN(2.5, MAX(0.4, self.selectedNode.scale.x * factor));
    self.selectedNode.scale = SCNVector3Make(scale, scale, scale);
    if (self.previewing) {
        [self updatePreviewLayout];
    }
    [self publish:self.lastStatus];
}


-(BOOL)canPlaceAtCenter {
    if (self.modelIndex >= 3) {
        return NO;
    }
    if (self.previewing) {
        return YES;
    }
    ARCamera *camera = self.arView.session.currentFrame.camera;
    if (!self.visible || !self.started || !self.trackingReady || camera.trackingState != ARTrackingStateNormal || !camera) {
        return NO;
    }
    CGRect bounds = self.arView.bounds;
    if (CGRectIsEmpty(bounds)) {
        return NO;
    }
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    ARRaycastQuery *query = [self.arView raycastQueryFromPoint:center
                                             allowingTarget:ARRaycastTargetExistingPlaneGeometry
                                                  alignment:ARRaycastTargetAlignmentHorizontal];
    return query && [self.arView.session raycast:query].count > 0;
}

-(void)updatePreviewLayout {
    NSUInteger count = self.previewModels.count;
    NSUInteger columns = MIN(3, MAX(1, count));
    NSUInteger rows = MAX(1, (count + columns - 1) / columns);
    CGFloat maximumScale = 1;
    for (SCNNode *model in self.previewModels) {
        maximumScale = MAX(maximumScale, model.scale.x);
    }
    CGFloat horizontalSpacing = 0.32 * maximumScale;
    CGFloat depthSpacing = 0.36 * maximumScale;
    for (NSUInteger index = 0; index < count; index++) {
        NSUInteger row = index / columns;
        NSUInteger rowCount = MIN(columns, count - row * columns);
        CGFloat x = ((CGFloat)(index % columns) - ((CGFloat)rowCount - 1) / 2) * horizontalSpacing;
        self.previewModels[index].position = SCNVector3Make(x, 0, -(CGFloat)row * depthSpacing);
    }
    CGFloat width = columns * horizontalSpacing;
    CGFloat depth = (rows - 1) * depthSpacing;
    CGFloat targetZ = -depth / 2;
    CGFloat distance = MAX(0.6, width * 1.1 + depth * 0.7);
    SCNNode *camera = self.previewView.pointOfView;
    camera.camera.fieldOfView = 45;
    camera.camera.zFar = MAX(100, distance * 4);
    camera.position = SCNVector3Make(0, 0.12 * maximumScale + distance * 0.9, targetZ + distance);
    [camera lookAt:SCNVector3Make(0, 0.12 * maximumScale, targetZ)];
}

-(void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame {
    if (frame.timestamp - self.lastPlacementUpdate < 0.2) {
        return;
    }
    self.lastPlacementUpdate = frame.timestamp;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self.previewing && self.visible && self.started) {
            BOOL ready = self.canPlaceAtCenter;
            if (ready != self.lastPlacementReady) {
                self.lastPlacementReady = ready;
                [self publish:self.lastStatus];
            }
        }
    });
}

-(NSString *)selectionDescription {
    return self.selectedNode ? [NSString stringWithFormat:@"rotation:%.0f;scale:%.2f", self.selectedNode.eulerAngles.y * 180 / M_PI, self.selectedNode.scale.x] : @"none";
}

-(BOOL)isCurrentAnchor:(ARAnchor *)anchor {
    if (self.previewing || !self.visible || !self.started) {
        return NO;
    }
    for (ARAnchor *current in self.arView.session.currentFrame.anchors) {
        if ([current.identifier isEqual:anchor.identifier]) {
            return YES;
        }
    }
    return NO;
}

-(void)updatePlane:(ARPlaneAnchor *)anchor node:(SCNNode *)node {
    SCNNode *surface = [node childNodeWithName:@"JobsARKit.plane" recursively:NO];
    if (!surface) {
        surface = jobsMakeSCNNode([SCNPlane planeWithWidth:0.001 height:0.001]);
        surface.name = @"JobsARKit.plane";
        surface.eulerAngles = SCNVector3Make(-M_PI_2, 0, 0);
        surface.geometry.firstMaterial.diffuse.contents = [UIColor colorWithRed:0.2 green:0.85 blue:0.75 alpha:0.25];
        surface.geometry.firstMaterial.doubleSided = YES;
        [node addChildNode:surface];
    }
    SCNPlane *geometry = (SCNPlane *)surface.geometry;
    geometry.width = MAX(anchor.extent.x, 0.001);
    geometry.height = MAX(anchor.extent.z, 0.001);
    surface.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![self isCurrentAnchor:anchor]) {
            return;
        }
        if ([anchor isKindOfClass:ARPlaneAnchor.class]) {
            [self.planes addObject:anchor.identifier];
            [self updatePlane:(ARPlaneAnchor *)anchor node:node];
            [self publish:self.lastStatus];
        } else if (self.objects[anchor.identifier]) {
            [node addChildNode:self.objects[anchor.identifier]];
        }
    });
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    if ([anchor isKindOfClass:ARPlaneAnchor.class]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (![self isCurrentAnchor:anchor]) {
                return;
            }
            [self updatePlane:(ARPlaneAnchor *)anchor node:node];
        });
    }
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.previewing || !self.visible) {
            return;
        }
        [self.planes removeObject:anchor.identifier];
        SCNNode *model = self.objects[anchor.identifier];
        if (model == self.selectedNode) {
            self.selectedNode = nil;
            self.selectedModelIndex = NSNotFound;
        }
        [self.objects removeObjectForKey:anchor.identifier];
        [self.anchors removeObjectForKey:anchor.identifier];
        [self publish:self.lastStatus];
    });
}

-(void)session:(ARSession *)session cameraDidChangeTrackingState:(ARCamera *)camera {
    dispatch_async(dispatch_get_main_queue(), ^{
        ARCamera *currentCamera = self.arView.session.currentFrame.camera;
        if (self.previewing || !self.visible || !self.started || !currentCamera) {
            return;
        }
        self.trackingReady = currentCamera.trackingState == ARTrackingStateNormal;
        NSString *key = currentCamera.trackingState == ARTrackingStateNotAvailable ? @"limited" : @"trackingInitializing";
        if (self.trackingReady) {
            key = @"trackingNormal";
        } else if (currentCamera.trackingStateReason == ARTrackingStateReasonExcessiveMotion) {
            key = @"trackingMotion";
        } else if (currentCamera.trackingStateReason == ARTrackingStateReasonInsufficientFeatures) {
            key = @"trackingFeatures";
        } else if (currentCamera.trackingStateReason == ARTrackingStateReasonRelocalizing) {
            key = @"relocalizing";
        }
        [self publish:key];
    });
}

-(void)sessionWasInterrupted:(ARSession *)session {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.previewing || !self.visible || !self.started) {
            return;
        }
        self.trackingReady = NO;
        [self publish:@"interrupted"];
    });
}

-(void)sessionInterruptionEnded:(ARSession *)session {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.visible && !self.previewing) {
            [self reset];
        }
    });
}

-(void)session:(ARSession *)session didFailWithError:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.previewing || !self.visible || !self.started) {
            return;
        }
        self.trackingReady = NO;
        [self publish:@"failed"];
    });
}

@end
