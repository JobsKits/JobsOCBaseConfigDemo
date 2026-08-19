# frozen_string_literal: true

require 'digest'
require 'tmpdir'

# 在 CocoaPods 进入依赖解析前异步启动本地任务；绝不探测网络或短路 pod install。
module JobsPodInstallOfflineGuard
  POST_SCRIPTS_CHECK_ONLY_ENV = 'JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY'
  TRUTHY_VALUES = %w[1 true yes y on].freeze

  module_function

  # 只处理真实的 pod install，不影响 pod update / pod ipc 等其它 CocoaPods 命令。
  def pod_install_command?
    File.basename($PROGRAM_NAME) == 'pod' && ARGV.first == 'install'
  end

  # 统一输出到 CocoaPods UI；独立 Ruby 环境下降级为标准输出。
  def log(message)
    if defined?(Pod::UI)
      Pod::UI.puts(message)
    else
      puts(message)
    end
  end

  # 定位与 post_integrate 共用的脚本入口。
  def post_scripts_path(project_root)
    script_name = '【MacOS】📦Pod Install离线保护.command'
    File.join(project_root, 'ScriptsByPods', script_name, script_name)
  end

  # 为不同工程使用独立日志，避免 iOS 多工程同时安装时互相覆盖。
  def preflight_log_path(project_root)
    project_id = Digest::SHA256.hexdigest(project_root)[0, 12]
    File.join(Dir.tmpdir, "jobs-pod-install-preflight-#{project_id}.log")
  end

  # 本地任务脱离 CocoaPods 主进程运行；启动失败也不得改变依赖安装语义。
  def start_preflight!(project_root)
    script_path = post_scripts_path(project_root)
    unless File.file?(script_path)
      log("[PodInstallOfflineGuard] ⚠️ 本地前置脚本不存在，继续 pod install：#{script_path}")
      return
    end

    arguments = [script_path, '--preflight', '--project-root', project_root]
    if TRUTHY_VALUES.include?(ENV.fetch(POST_SCRIPTS_CHECK_ONLY_ENV, '').to_s.strip.downcase)
      arguments << '--check-only'
    end

    log_path = preflight_log_path(project_root)
    log_io = File.open(log_path, 'w')
    process_id = Process.spawn(
      {
        'JOBS_POD_INSTALL_HOOK' => '1',
        'JOBS_POD_INSTALL_OFFLINE' => '1',
        'JOBS_SKIP_README' => '1'
      },
      '/bin/zsh',
      *arguments,
      chdir: project_root,
      in: File::NULL,
      out: log_io,
      err: log_io,
      pgroup: true
    )
    Process.detach(process_id)
    log("[PodInstallOfflineGuard] ✅ 本地任务已异步启动，PID=#{process_id}，日志=#{log_path}")
  rescue StandardError => error
    log("[PodInstallOfflineGuard] ⚠️ 本地任务启动失败，继续 pod install：#{error.message}")
  ensure
    log_io&.close
  end

  # Podfile 顶部调用入口。
  def guard!(project_root)
    return unless pod_install_command?

    start_preflight!(File.expand_path(project_root))
  end
end
