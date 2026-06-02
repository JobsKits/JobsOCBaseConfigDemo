//
//  DefaultDemoViewController.swift
//  HelloGTCaptcha4
//
//  Created by NikoXu on 2020/10/22.
//  Copyright © 2020 geetest. All rights reserved.
//

import UIKit
import GTCaptcha4

/// 您自己或公司申请的验证 ID
let DemoCaptchaID = "c62d0f270240799b3113b0a5787ead55"
/// 请填入您的验证二次校验接口地址
let VerifyAPIURL = "http://..."

class DefaultDemoViewController: UIViewController {
    
    private lazy var captchaSession: GTCaptcha4Session = {
        let config = GTCaptcha4SessionConfiguration.default()
        let captchaSession = GTCaptcha4Session(captchaID: DemoCaptchaID, configuration: config)
        
        return captchaSession
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 提前创建验证会话，并设置代理
        captchaSession.delegate = self
    }
    
    // 调用验证
    private func startCaptcha() {
        captchaSession.verify()
    }
}

extension DefaultDemoViewController : GTCaptcha4SessionTaskDelegate {
    
    // 处理错误
    func gtCaptchaSession(_ captchaSession: GTCaptcha4Session, didReceiveError error: GTC4Error) {
        print("error: \(error.description)")
    }
    
    // 校验验证结果
    func gtCaptchaSession(_ captchaSession: GTCaptcha4Session, didReceive code: String, result: [AnyHashable : Any]?) {
        if code == "1" {
            print("result: \(result ?? [:])")
            if let result = result as? [String: String] {
                guard let url = URL(string: VerifyAPIURL) else {
                    return
                }
                
                guard let challenge = result["challenge"],
                    let captchaID = result["captcha_id"] else {
                    return
                }
                
                let form = "captcha_id=\(captchaID)&challenge=\(challenge)"
                
                var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
                request.httpMethod  = "POST"
                request.httpBody    = form.data(using: .utf8)
                
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let httpResp = response as? HTTPURLResponse, httpResp.statusCode == 200 else {
                        print("Unexcepted response status.")
                        return
                    }
                    
                    if let data = data,
                        let dataStr = String(data: data, encoding: .utf8) {
                        print("Data: \(dataStr)")
                    }
                    else {
                        print("Invalid data.")
                    }
                }
            }
            else {
                print("Invalid result.")
            }
        }
        else {
            print("User did not pass the captcha. Try again.")
        }
    }
}
