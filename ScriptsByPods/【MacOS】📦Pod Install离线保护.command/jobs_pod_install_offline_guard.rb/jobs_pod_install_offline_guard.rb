# frozen_string_literal: true

require 'digest'
require 'tmpdir'

# 在依赖解析前同步执行辅助任务，保留终端输入及 CocoaPods 原始结果。
module JobsPodInstallOfflineGuard
  POST_SCRIPTS_CHECK_ONLY_ENV = 'JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY'
  TRUTHY_VALUES = %w[1 true yes y on].freeze

  module_function

  # 只处理真实的 pod install，不影响 pod update / pod ipc 等其它 CocoaPods 命令。
  def pod_install_command?
    File.basename($PROGRAM_NAME) == 'pod' && ARGV.find { |argument| !argument.start_with?('-') } == 'install'
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

  # 只接受明确的只读模式；无终端时不得默认授权辅助写操作。
  def interaction_mode
    mode = ENV.fetch('JOBS_POD_INSTALL_INTERACTION', 'interactive').strip.downcase
    return mode if mode == 'skip'
    return 'check-only' if TRUTHY_VALUES.include?(ENV.fetch(POST_SCRIPTS_CHECK_ONLY_ENV, '').strip.downcase)

    mode
  end

  # 两阶段共用跳过规则，避免纯净模式仍偷偷生成前置报告。
  def skip_scripts?
    %w[JOBS_POD_INSTALL_PURE JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS].any? do |key|
      TRUTHY_VALUES.include?(ENV.fetch(key, '').strip.downcase)
    end
  end

  # 前置任务继承真实键盘输入，不后台运行或强制离线。
  def start_preflight!(project_root)
    return if skip_scripts? || interaction_mode == 'skip'
    unless %w[interactive check-only].include?(interaction_mode)
      log('[PodInstallOfflineGuard] ⚠️ 无效交互模式，跳过辅助任务。')
      return
    end
    if interaction_mode == 'interactive' && !STDIN.tty?
      log('[PodInstallOfflineGuard] 当前无可交互终端，跳过辅助任务；请在终端运行，或显式设置 JOBS_POD_INSTALL_INTERACTION=check-only。')
      return
    end

    script_path = post_scripts_path(project_root)
    unless File.file?(script_path)
      log("[PodInstallOfflineGuard] ⚠️ 本地前置脚本不存在，继续 pod install：#{script_path}")
      return
    end

    arguments = [script_path, '--preflight', '--project-root', project_root]
    if interaction_mode == 'check-only'
      arguments << '--check-only'
    end

    succeeded = system(
      {
        'JOBS_POD_INSTALL_HOOK' => '1',
        'JOBS_POD_INSTALL_INTERACTION' => interaction_mode
      },
      '/bin/zsh',
      *arguments,
      chdir: project_root
    )
    log('[PodInstallOfflineGuard] ⚠️ 前置辅助任务失败，继续 CocoaPods 原流程。') unless succeeded
  rescue StandardError => error
    log("[PodInstallOfflineGuard] ⚠️ 本地任务启动失败，继续 pod install：#{error.message}")
  end

  # Podfile 顶部调用入口。
  def guard!(project_root)
    return unless pod_install_command?

    start_preflight!(File.expand_path(project_root))
  end
end
