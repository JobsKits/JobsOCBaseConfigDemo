# frozen_string_literal: true

require 'uri'

# 仅为本次依赖安装复用真实可用的 Git 链路，不改系统或全局 Git 配置。
module JobsCocoaPodsNetwork
  PROBE_URL = 'https://github.com/andreamazz/AMPopTip.git'.freeze
  PROBE_REF = 'refs/tags/4.12.0'.freeze
  DEFAULT_PROBE_TIMEOUT = 6
  OUTPUT_LIMIT = 4096
  PROXY_KEYS = %w[https_proxy HTTPS_PROXY http_proxy HTTP_PROXY all_proxy ALL_PROXY].freeze
  GIT_PROXY_KEY = 'http.https://github.com/.proxy'.freeze

  module_function

  # Podfile 在 Specs 选择前调用；查询命令与重复解析都不额外联网。
  def apply!(project_root:, probe: nil)
    return :skipped if ENV['JOBS_POD_NETWORK_ADAPT'] == '0' || probe == false || (probe.nil? && !dependency_command?)

    project_root = File.expand_path(project_root)
    @results ||= {}
    return @results[project_root] if @results.key?(project_root)

    timeout = probe_timeout
    runner = probe.respond_to?(:call) ? probe : method(:git_route_usable?)
    explicit = ENV['JOBS_POD_PROXY_URL'].to_s.strip
    if !explicit.empty? && valid_proxy_url?(explicit)
      route = proxy_route(:explicit, explicit)
      return remember_route(project_root, route) if route && usable?(runner, route, project_root, timeout)

      log('显式 JOBS_POD_PROXY_URL 未通过 Git tag 探测，继续检查当前链路。')
    elsif !explicit.empty?
      log('JOBS_POD_PROXY_URL 格式无效，继续检查当前链路；未输出代理内容。')
    end

    inherited = { kind: :inherited, environment: {} }
    return remember_route(project_root, inherited) if usable?(runner, inherited, project_root, timeout)

    routes = system_proxy_routes(timeout).reject { |route| route[:proxy] == explicit }
    results = routes.map do |route|
      Thread.new { [route, usable?(runner, route, project_root, timeout)] }
    end.map(&:value)
    selected = results.find { |_route, successful| successful }
    return remember_route(project_root, selected.first) if selected

    log('当前链路和已配置代理均未通过 Git tag 探测；继续交给源码归档回退及 CocoaPods，不代表安装成功。')
    @results[project_root] = :unavailable
  rescue StandardError
    log('网络适配未完成，保留现有环境继续安装；未输出可能含凭据的错误内容。')
    :unavailable
  end

  # 只接受真正的 CocoaPods 安装或升级，ipc/spec 等查询不触发网络。
  def dependency_command?
    command = ARGV.find { |argument| !argument.start_with?('-') }
    File.basename($PROGRAM_NAME) == 'pod' && %w[install update].include?(command)
  end

  # 对每个独立进程组设置短上限，系统候选并发，共享同一轮等待时间。
  def probe_timeout
    value = ENV['JOBS_POD_NETWORK_PROBE_TIMEOUT'] || ENV['JOB_POD_NETWORK_PROBE_TIMEOUT']
    value.to_s.match?(/\A\d+\z/) && (1..30).cover?(value.to_i) ? value.to_i : DEFAULT_PROBE_TIMEOUT
  end

  # 显式环境 URL 可以包含凭据，但控制字符、无效端口与未知协议被拒绝。
  def valid_proxy_url?(value)
    return false if value.match?(/[\x00-\x20\x7f]/)

    uri = URI.parse(value)
    %w[http https socks5 socks5h].include?(uri.scheme) &&
      uri.host && !uri.host.empty? && (1..65_535).cover?(uri.port.to_i) &&
      ['', '/'].include?(uri.path.to_s) && !uri.query && !uri.fragment
  rescue URI::Error, ArgumentError
    false
  end

  # 仅读取 macOS 已开启的手工代理，不执行 PAC、不猜端口。
  def system_proxy_routes(timeout)
    return [] unless File.executable?('/usr/sbin/scutil')

    output, successful, = run_bounded({}, ['/usr/sbin/scutil', '--proxy'], nil, [timeout, 1].min)
    return [] unless successful

    parse_system_proxies(output).each_with_object([]) do |(kind, proxy), routes|
      route = proxy_route(kind, proxy)
      routes << route if route
    end
  end

  # scutil 的 HTTPSProxy 表示 HTTP CONNECT；SOCKS 使用远端 DNS。
  def parse_system_proxies(output)
    values = {}
    depth = 0
    output.each_line do |line|
      match = line.match(/\A\s*(HTTPSEnable|HTTPSProxy|HTTPSPort|HTTPEnable|HTTPProxy|HTTPPort|SOCKSEnable|SOCKSProxy|SOCKSPort)\s*:\s*(.*?)\s*\z/) if depth <= 1
      values[match[1]] = match[2] if match
      depth += line.count('{') - line.count('}')
    end
    routes = []
    %w[HTTPS HTTP SOCKS].each do |kind|
      next unless values["#{kind}Enable"] == '1'

      host = values["#{kind}Proxy"].to_s
      port = values["#{kind}Port"].to_s
      next unless host.match?(/\A[A-Za-z0-9._:\[\]-]+\z/) && port.match?(/\A\d+\z/)

      host = "[#{host}]" if host.include?(':') && !host.start_with?('[')
      proxy = "#{kind == 'SOCKS' ? 'socks5h' : 'http'}://#{host}:#{port}"
      routes << ["system_#{kind.downcase}".to_sym, proxy] if valid_proxy_url?(proxy)
    end
    routes.uniq { |_kind, proxy| proxy }
  end

  # 追加 GitHub 范围的临时配置，既有私有域配置与 NO_PROXY 均保留。
  def proxy_route(kind, proxy)
    count = ENV.fetch('GIT_CONFIG_COUNT', '0')
    return nil unless count.match?(/\A\d+\z/)

    index = count.to_i
    environment = PROXY_KEYS.each_with_object({}) { |key, result| result[key] = proxy }
    environment['GIT_CONFIG_COUNT'] = (index + 1).to_s
    environment["GIT_CONFIG_KEY_#{index}"] = GIT_PROXY_KEY
    environment["GIT_CONFIG_VALUE_#{index}"] = proxy
    { kind: kind, proxy: proxy, environment: environment }
  end

  # 探测失败只返回状态，原始 stderr 与代理 URL 不进入日志。
  def usable?(runner, route, project_root, timeout)
    runner.call(environment: route[:environment].dup, project_root: project_root, timeout: timeout) == true
  rescue StandardError
    false
  end

  # Git 协议必须返回指定 tag 的对象 ID，HTTP 首页成功不能代替此检查。
  def git_route_usable?(environment:, project_root:, timeout:)
    environment = environment.merge(
      'GIT_TERMINAL_PROMPT' => '0', 'GCM_INTERACTIVE' => 'never',
      'GIT_ASKPASS' => '/usr/bin/false', 'SSH_ASKPASS' => '/usr/bin/false'
    )
    output, successful, = run_bounded(
      environment, ['git', '-c', 'credential.interactive=false', 'ls-remote', '--exit-code', PROBE_URL, PROBE_REF], project_root, timeout
    )
    successful && output.lines.any? do |line|
      line.match?(/\A[0-9a-fA-F]{40}(?:[0-9a-fA-F]{24})?\s+#{Regexp.escape(PROBE_REF)}\s*\z/)
    end
  end

  # 当前 pod 进程及其子进程继承代理；退出时恢复原环境，不写磁盘配置。
  def remember_route(project_root, route)
    unless route[:kind] == :inherited
      @original_environment ||= {}
      route[:environment].each do |key, value|
        @original_environment[key] = ENV[key] unless @original_environment.key?(key)
        ENV[key] = value
      end
      unless @restore_registered
        at_exit { restore! }
        @restore_registered = true
      end
    end
    message = case route[:kind]
              when :inherited then '已复用当前 Git 下载链路。'
              when :explicit then '已验证显式 JOBS_POD_PROXY_URL，仅本次 pod 进程使用。'
              else '已验证并临时继承 macOS 已开启的系统代理，仅本次 pod 进程使用。'
              end
    log(message)
    @results[project_root] = route[:kind] == :inherited ? :inherited : :proxy
  end

  # 隔离测试及进程退出共用恢复入口，只还原本模块实际覆盖的环境项。
  def restore!
    (@original_environment || {}).each { |key, value| ENV[key] = value }
    @original_environment = {}
    @results = {}
    nil
  end

  # 输出有上限且 stderr 丢弃；退出上限包含继承输出管道的子进程。
  def run_bounded(environment, command, project_root, timeout)
    reader, writer = IO.pipe
    options = { in: File::NULL, out: writer, err: File::NULL, pgroup: true }
    options[:chdir] = project_root if project_root
    pid = Process.spawn(environment, *command, options)
    writer.close
    waiter = Process.detach(pid)
    capture = { text: ''.dup, overflow: false }
    output_reader = Thread.new { capture_stdout(reader, capture) }
    deadline = monotonic_time + timeout
    timed_out = false
    while waiter.alive? || output_reader.alive?
      if monotonic_time >= deadline
        timed_out = true
        signal_group('TERM', pid)
        (output_reader.alive? ? output_reader : waiter).join(0.1)
        signal_group('KILL', pid)
        break
      end
      (waiter.alive? ? waiter : output_reader).join([deadline - monotonic_time, 0.02].min.clamp(0, 0.02))
    end
    waiter.join(0.2)
    reader.close unless reader.closed?
    output_reader.join(0.2)
    successful = !timed_out && !capture[:overflow] && !waiter.alive? && waiter.value.success?
    [capture[:text], successful, timed_out]
  rescue StandardError
    ['', false, false]
  ensure
    [reader, writer].compact.each { |stream| stream.close unless stream.closed? }
    if pid && (waiter.nil? || waiter.alive? || (output_reader && output_reader.alive?))
      signal_group('KILL', pid)
    end
    output_reader.join(0.2) if output_reader
  end

  # 始终读完有界缓冲，避免子进程因 stdout 写满而卡住。
  def capture_stdout(stream, capture)
    loop do
      chunk = stream.readpartial(1024)
      remaining = OUTPUT_LIMIT - capture[:text].bytesize
      capture[:text] << chunk.byteslice(0, remaining) if remaining.positive?
      capture[:overflow] = true if chunk.bytesize > remaining
    end
  rescue EOFError, IOError
    nil
  end

  # 独立进程组连同 Git helper 一起退出，已结束的进程属于正常竞态。
  def signal_group(signal, pid)
    Process.kill(signal, -pid)
  rescue Errno::ESRCH, Errno::EPERM
    nil
  end

  # 单调时钟避免系统校时改变探测时限。
  def monotonic_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  # 日志只陈述链路状态，不泄露代理地址、凭据或原始子进程错误。
  def log(message)
    $stderr.puts("[Jobs Pod 网络] #{message}")
  end
end
