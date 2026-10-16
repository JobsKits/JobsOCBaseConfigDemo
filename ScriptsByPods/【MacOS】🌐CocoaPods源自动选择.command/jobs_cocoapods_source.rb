# frozen_string_literal: true

require 'digest'
require 'json'
require 'open3'
require 'pathname'
require 'tmpdir'

# 在依赖解析前固定本次公共 Specs 源，保留锁定版本和私有源。
module JobsCocoaPodsSource
  CDN_URL = 'https://cdn.cocoapods.org/'.freeze
  GIT_URL = 'https://github.com/CocoaPods/Specs.git'.freeze
  SOURCE_URLS = [CDN_URL, GIT_URL].freeze
  SCRIPT_NAME = '【MacOS】🌐CocoaPods源自动选择.command'.freeze
  DEFAULT_PROBE_TIMEOUT = 8
  DEFAULT_CONNECT_TIMEOUT = 2
  DEFAULT_SAMPLE_NAME = 'AFNetworking'.freeze
  DEFAULT_SAMPLE_VERSION = '4.0.1'.freeze
  OUTPUT_LIMIT = 4096

  # 仅改当前锁对象的查询结果，磁盘内容和严格部署比较保持原样。
  module LockfileSourceOverride
    def spec_repo(pod_name)
      original = super
      selected_url = instance_variable_get(:@jobs_specs_selected_url)
      if selected_url && JobsCocoaPodsSource.public_source?(original)
        selected_url
      else
        original
      end
    end
  end

  module_function

  # Podfile 顶部调用；同一 Podfile 重复解析入口只声明一次源。
  def apply!(podfile, project_root:, run_probe: nil)
    previous_url = podfile.instance_variable_get(:@jobs_cocoapods_source_url)
    return previous_url if SOURCE_URLS.include?(previous_url)

    probe = run_probe.nil? ? dependency_command? : !!run_probe
    selected_url = select_source(project_root: project_root, probe: probe)
    align_lockfile_source!(current_lockfile, selected_url)
    podfile.source(selected_url)
    podfile.instance_variable_set(:@jobs_cocoapods_source_url, selected_url)
    selected_url
  end

  # 只在真正安装或更新时联网；ipc 等只读命令仍可解析 Podfile。
  def dependency_command?
    command = ARGV.find { |value| !value.start_with?('-') }
    File.basename($PROGRAM_NAME) == 'pod' && %w[install update].include?(command)
  end

  # 为当前工程同步探测；探测器不可用时保留可解释的本地回退。
  def select_source(project_root:, probe: true)
    project_root = File.expand_path(project_root)
    log_path = probe_log_path(project_root)
    lockfile = project_lockfile(project_root)
    mode = ENV.fetch('JOBS_SPECS_SOURCE', 'auto').to_s.strip.downcase
    unless %w[auto cdn git].include?(mode) || mode.empty?
      boundary_warning("未知 JOBS_SPECS_SOURCE=#{mode.inspect}，按 auto 处理。", log_path)
      mode = 'auto'
    end
    mode = 'auto' if mode.empty?
    forced_url = { 'cdn' => CDN_URL, 'git' => GIT_URL }[mode]
    fallback_url = forced_url || fallback_source(lockfile)
    return fallback_url unless probe

    script_path = File.join(__dir__, SCRIPT_NAME)
    unless File.file?(script_path)
      boundary_warning("源探测脚本不存在，使用 #{fallback_url}：#{script_path}", log_path)
      return fallback_url
    end

    timeout = normalized_timeout('JOBS_SPECS_PROBE_TIMEOUT', DEFAULT_PROBE_TIMEOUT)
    connect_timeout = normalized_timeout('JOBS_SPECS_CONNECT_TIMEOUT', DEFAULT_CONNECT_TIMEOUT)
    environment = {
      'JOBS_SPECS_SOURCE' => mode,
      'JOBS_SPECS_SAMPLE_PATH' => sample_path(lockfile),
      'JOBS_SPECS_FALLBACK_URL' => fallback_url,
      'JOBS_SPECS_LOG_PATH' => log_path,
      'JOBS_SPECS_PROBE_TIMEOUT' => timeout.to_s,
      'JOBS_SPECS_CONNECT_TIMEOUT' => [connect_timeout, timeout].min.to_s
    }
    output, successful, timed_out = run_selector(environment, script_path, project_root, timeout * 2 + 5)
    selected_url = output.strip
    if successful && SOURCE_URLS.include?(selected_url) && (!forced_url || selected_url == forced_url)
      selected_url
    else
      reason = if timed_out
                 '超过总时限'
               elsif successful && forced_url && SOURCE_URLS.include?(selected_url)
                 '返回结果与指定模式不符'
               else
                 successful ? '返回了非白名单结果' : '执行失败'
               end
      boundary_warning("源探测#{reason}，使用 #{fallback_url}。", log_path)
      fallback_url
    end
  rescue StandardError => error
    fallback_url ||= CDN_URL
    boundary_warning("源探测异常，使用 #{fallback_url}：#{error.class}: #{error.message}", log_path)
    fallback_url
  end

  # 只映射官方公共源，既有私有源及依赖版本继续交由 CocoaPods 锁定。
  def align_lockfile_source!(lockfile, url)
    return lockfile unless lockfile
    raise ArgumentError, '不支持的 CocoaPods 公共源 URL' unless SOURCE_URLS.include?(url)

    singleton = class << lockfile; self; end
    singleton.prepend(LockfileSourceOverride) unless singleton.ancestors.include?(LockfileSourceOverride)
    lockfile.instance_variable_set(:@jobs_specs_selected_url, url)
    lockfile
  end

  # 严格匹配公共源别名，避免把相似域名或私有仓库误判为官方源。
  def public_source?(repo)
    value = repo.to_s.strip.downcase.sub(%r{/+\z}, '')
    return true if %w[master trunk https://cdn.cocoapods.org http://cdn.cocoapods.org].include?(value)

    value = value.sub(/\.git\z/, '')
    %w[
      https://github.com/cocoapods/specs
      http://github.com/cocoapods/specs
      git://github.com/cocoapods/specs
      git@github.com:cocoapods/specs
      ssh://git@github.com/cocoapods/specs
    ].include?(value)
  end

  # 双源探测同一个锁定 podspec，避免仅比较首页或无关小文件。
  def sample_path(lockfile)
    sample_name = DEFAULT_SAMPLE_NAME
    sample_version = DEFAULT_SAMPLE_VERSION
    if lockfile && lockfile.respond_to?(:pods_by_spec_repo)
      lockfile.pods_by_spec_repo.each do |repo, names|
        next unless public_source?(repo)

        matched = Array(names).map { |name| name.to_s.split('/').first }.find do |name|
          name.match?(/\A[A-Za-z0-9_+.-]+\z/) && safe_version?(lockfile.version(name).to_s)
        end
        next unless matched

        sample_name = matched
        sample_version = lockfile.version(matched).to_s
        break
      end
    end
    shard = Digest::MD5.hexdigest(sample_name)[0, 3].chars.join('/')
    "Specs/#{shard}/#{sample_name}/#{sample_version}/#{sample_name}.podspec.json"
  end

  # 无网络探测时，只有原 Git 锁与可读的本地 Git 规格缓存才回退 Git。
  def fallback_source(lockfile)
    return CDN_URL unless lockfile && lockfile.respond_to?(:pods_by_spec_repo)

    has_git_lock = lockfile.pods_by_spec_repo.keys.any? { |repo| git_source?(repo) }
    has_git_lock && cached_git_source_usable?(sample_path(lockfile)) ? GIT_URL : CDN_URL
  rescue StandardError
    CDN_URL
  end

  # 只读本地源目录和采样文件，不触发 git fetch 或仓库初始化。
  def cached_git_source_usable?(relative_path)
    return false unless defined?(Pod::Config)

    Pod::Config.instance.sources_manager.all.any? do |source|
      next false unless git_source?(source.url)

      repository = source.repo.to_s
      next false unless File.exist?(File.join(repository, '.git'))

      path = File.join(repository, relative_path)
      next false unless File.file?(path) && File.readable?(path)

      specification = JSON.parse(File.read(path))
      specification.is_a?(Hash) && specification['name'].to_s == File.basename(path, '.podspec.json') &&
        specification['version'].to_s == File.basename(File.dirname(path))
    rescue StandardError
      false
    end
  end

  # 每工程单独记日志，路径不包含用户目录或工程名正文。
  def probe_log_path(project_root)
    identifier = Digest::SHA256.hexdigest(File.expand_path(project_root))[0, 16]
    File.join(Dir.tmpdir, "jobs-cocoapods-source-#{identifier}.log")
  end

  # Open3 使用独立进程组，总时限到达后连同 curl/git 子进程一起结束。
  def run_selector(environment, script_path, project_root, total_timeout)
    stdin, stdout, stderr, waiter = Open3.popen3(
      environment, '/bin/zsh', script_path, '--podfile-hook',
      chdir: project_root, pgroup: true
    )
    stdin.close
    capture = { text: ''.dup, overflow: false }
    output_reader = Thread.new { capture_stdout(stdout, capture) }
    error_reader = Thread.new { forward_stderr(stderr) }
    # 总预算预留进程组退出和输出收尾时间。
    deadline = monotonic_time + [total_timeout - 2, total_timeout / 2.0].max
    timed_out = false
    while (pending = [waiter, output_reader, error_reader].find(&:alive?))
      if monotonic_time >= deadline
        timed_out = true
        terminate_process_group(waiter)
        break
      end
      pending.join([deadline - monotonic_time, 0.05].min.clamp(0, 0.05))
    end
    [output_reader, error_reader].each { |reader| reader.join(0.5) }
    status = waiter.value unless waiter.alive?
    output = capture[:overflow] ? '' : capture[:text]
    [output, !!(status && status.success? && !timed_out), timed_out]
  ensure
    if waiter
      waiter.alive? ? terminate_process_group(waiter) : signal_process_group('KILL', waiter)
    end
    [stdin, stdout, stderr].compact.each { |stream| stream.close unless stream.closed? }
    [output_reader, error_reader].compact.each { |reader| reader.kill if reader.alive? }
  end

  # 限制探测器标准输出大小，额外说明文字一律不视为源 URL。
  def capture_stdout(stream, capture)
    loop do
      chunk = stream.readpartial(1024)
      if capture[:text].bytesize + chunk.bytesize <= OUTPUT_LIMIT
        capture[:text] << chunk
      else
        capture[:overflow] = true
      end
    end
  rescue EOFError, IOError
    nil
  end

  # 探测器负责日志落盘，此处实时转发错误流，避免重复记录。
  def forward_stderr(stream)
    loop do
      $stderr.write(stream.readpartial(4096))
      $stderr.flush
    end
  rescue EOFError, IOError
    nil
  end

  # TERM 后保留短暂退出窗口，再 KILL 整组防止探测子进程遗留。
  def terminate_process_group(waiter)
    signal_process_group('TERM', waiter)
    waiter.join(0.25)
    signal_process_group('KILL', waiter)
    waiter.join(0.5)
  end

  # 进程已结束属于正常竞态，不额外制造探测失败。
  def signal_process_group(signal, waiter)
    Process.kill(signal, -waiter.pid)
  rescue Errno::ESRCH
    nil
  rescue Errno::EPERM
    return unless waiter.alive?

    begin
      Process.kill(signal, waiter.pid)
    rescue Errno::ESRCH
      nil
    end
  end

  # 总时限使用单调时钟，不受系统时间校准影响。
  def monotonic_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  # 只接受受控范围内整数，异常环境值退回短超时。
  def normalized_timeout(name, default)
    value = ENV.fetch(name, default.to_s)
    value.match?(/\A\d+\z/) && (1..30).cover?(value.to_i) ? value.to_i : default
  end

  # 采样路径中的版本只允许安全的单个目录名。
  def safe_version?(value)
    value.match?(/\A[A-Za-z0-9][A-Za-z0-9.+-]*\z/)
  end

  # Git 与 CDN 共享规格，但仅 Git 形式适合作为本地仓库回退。
  def git_source?(repo)
    return false unless public_source?(repo)

    !%w[trunk https://cdn.cocoapods.org http://cdn.cocoapods.org].include?(repo.to_s.strip.downcase.sub(%r{/+\z}, ''))
  end

  # 独立临时工程也能读取自己的锁文件，避免误用全局 Config 缓存。
  def project_lockfile(project_root)
    return nil unless defined?(Pod::Lockfile)

    Pod::Lockfile.from_file(Pathname.new(project_root).join('Podfile.lock'))
  end

  # apply 阶段使用 CocoaPods 已缓存的同一对象，供后续锁定图查询。
  def current_lockfile
    defined?(Pod::Config) ? Pod::Config.instance.lockfile : nil
  end

  # Ruby 边界异常写同一日志；日志不可写仍可继续正常依赖安装。
  def boundary_warning(message, log_path)
    line = "[Jobs Specs] ⚠️ #{message}"
    $stderr.puts(line)
    File.open(log_path, 'a', 0o600) { |file| file.puts(line) } if log_path
  rescue StandardError
    nil
  end
end
