//
//  JobsVPN.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVPN.h"

@implementation NEVPNManager (JobsVPNDSL)
#define JobsNEVPNManagerDSL(_name_, _blockType_, _dataType_, _property_) \
-(_blockType_ _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof NEVPNManager *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsNEVPNManagerDSL(OnDemandEnabled, JobsRetNEVPNManagerByBOOLBlock, BOOL, onDemandEnabled)
JobsNEVPNManagerDSL(LocalizedDescription, JobsRetNEVPNManagerByStrBlock, NSString *_Nullable, localizedDescription)
JobsNEVPNManagerDSL(Enabled, JobsRetNEVPNManagerByBOOLBlock, BOOL, enabled)
JobsNEVPNManagerDSL(ProtocolConfiguration, JobsRetNEVPNManagerByProtocolBlock, NEVPNProtocol *_Nullable, protocolConfiguration)
#undef JobsNEVPNManagerDSL
@end

@implementation NEVPNProtocolIKEv2 (JobsVPNDSL)
#define JobsNEVPNProtocolIKEv2DSL(_name_, _blockType_, _dataType_, _property_) \
-(_blockType_ _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof NEVPNProtocolIKEv2 *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsNEVPNProtocolIKEv2DSL(ServerAddress, JobsRetNEVPNProtocolIKEv2ByStrBlock, NSString *_Nullable, serverAddress)
JobsNEVPNProtocolIKEv2DSL(RemoteIdentifier, JobsRetNEVPNProtocolIKEv2ByStrBlock, NSString *_Nullable, remoteIdentifier)
JobsNEVPNProtocolIKEv2DSL(LocalIdentifier, JobsRetNEVPNProtocolIKEv2ByStrBlock, NSString *_Nullable, localIdentifier)
JobsNEVPNProtocolIKEv2DSL(Username, JobsRetNEVPNProtocolIKEv2ByStrBlock, NSString *_Nullable, username)
JobsNEVPNProtocolIKEv2DSL(PasswordReference, JobsRetNEVPNProtocolIKEv2ByDataBlock, NSData *_Nullable, passwordReference)
JobsNEVPNProtocolIKEv2DSL(AuthenticationMethod, JobsRetNEVPNProtocolIKEv2ByAuthenticationMethodBlock, NEVPNIKEAuthenticationMethod, authenticationMethod)
JobsNEVPNProtocolIKEv2DSL(UseExtendedAuthentication, JobsRetNEVPNProtocolIKEv2ByBOOLBlock, BOOL, useExtendedAuthentication)
JobsNEVPNProtocolIKEv2DSL(DisconnectOnSleep, JobsRetNEVPNProtocolIKEv2ByBOOLBlock, BOOL, disconnectOnSleep)
#undef JobsNEVPNProtocolIKEv2DSL
@end

@implementation JobsVPN
#pragma mark —— 一些私有方法
-(JobsRetDataByStrBlock _Nonnull)getKeychainPassword{
    // 从 Keychain 获取密码
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable data){
        /// TODO
        return nil; // 根据实际情况实现
    };
}
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)configureVPN{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        jobsMakeVPNManager(^(__kindof NEVPNManager * _Nullable VPNManager) {
            @jobs_strongify(self)
            [VPNManager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
                if (error) {
                    NSLog(@"加载 VPN 配置失败: %@", error.localizedDescription);
                    return;
                }
                VPNManager
                    .byOnDemandEnabled(NO)
                    .byLocalizedDescription(@"My VPN")
                    .byEnabled(YES)
                    .byProtocolConfiguration(jobsMakeNEVPNProtocolIKEv2(^(__kindof NEVPNProtocolIKEv2 * _Nullable VPNProtocolIKEv2) {
                        @jobs_strongify(self)
                        VPNProtocolIKEv2
                            .byServerAddress(@"vpn.example.com")
                            .byRemoteIdentifier(@"vpn.example.com")
                            .byLocalIdentifier(nil)
                            .byUsername(@"your_username")
                            .byPasswordReference(self.getKeychainPassword(@"vpn_password"))
                            .byAuthenticationMethod(NEVPNIKEAuthenticationMethodNone)
                            .byUseExtendedAuthentication(YES)
                            .byDisconnectOnSleep(NO);
                    }));
                [VPNManager saveToPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"保存 VPN 配置失败: %@", error.localizedDescription);
                    } else {
                        NSLog(@"VPN 配置已保存");
                    }
                }];
            }];
        });
    };
}

-(jobsByVoidBlock _Nonnull)startVPN{
    return ^{
        NSError *startError = nil;
        [NEVPNManager.sharedManager.connection startVPNTunnelAndReturnError:&startError];
        if (startError) {
            NSLog(@"启动 VPN 失败: %@", startError.localizedDescription);
        } else {
            NSLog(@"VPN 已启动");
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopVPN{
    return ^{
        [NEVPNManager.sharedManager.connection stopVPNTunnel];
        NSLog(@"VPN 已停止");
    };
}

@end
