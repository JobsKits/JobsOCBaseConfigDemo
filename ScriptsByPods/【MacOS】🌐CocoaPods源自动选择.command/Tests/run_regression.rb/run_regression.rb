# frozen_string_literal: true

# JOBS_TERMINAL_STYLE_GUARD_V1_BEGIN
if $PROGRAM_NAME == __FILE__
  # 直接运行时由 fork 父进程保护配色；子进程继续原文件，不重放 Ruby 参数和预载模块。
  def jobs_terminal_style_bootstrap_v1
    return unless $PROGRAM_NAME == __FILE__
    plain = lambda do
      ENV.update('PLAIN_OUTPUT' => '1', 'NO_COLOR' => '1', 'FORCE_COLOR' => '0',
                 'CLICOLOR' => '0', 'ANSI_COLORS_DISABLED' => '1', 'npm_config_color' => 'false')
    end
    notify = lambda do |message|
      encoding = $stderr.external_encoding || Encoding::UTF_8
      $stderr.write((message + "\n").encode(encoding, invalid: :replace, undef: :replace))
    end
    return unless $stdin.tty? && $stdout.tty?
    return if ENV.key?('NO_COLOR') || ENV['PLAIN_OUTPUT'] == '1' ||
              ENV['IS_SOURCETREE_RUNTIME'] == '1' ||
              ENV.keys.any? { |key| key.match?(/\A(?:SOURCETREE|SOURCE_TREE)/i) }
    return if ['', 'dumb'].include?(ENV.fetch('TERM', ''))
    if File::ALT_SEPARATOR == '\\' || !Process.respond_to?(:fork) ||
       Thread.list.length > 1 || ENV['TMUX'] || ENV['STY']
      plain.call
      return
    end
    tty_name = IO.popen(['tty'], err: File::NULL, &:read).strip
    groups = IO.popen(['ps', '-o', 'pgid=', '-o', 'tpgid=', '-p', Process.pid.to_s], err: File::NULL, &:read).split
    unless tty_name.match?(%r{\A/dev/[A-Za-z0-9_./-]+\z}) && groups.length == 2 &&
           groups.all? { |group| group.match?(/\A\d+\z/) } && groups[0].to_i > 0 && groups[0] == groups[1]
      plain.call
      return
    end
    owner = ENV['JOBS_TERMINAL_STYLE_OWNER']
    if ENV['JOBS_TERMINAL_STYLE_TTY'] == tty_name && owner && owner.match?(/\A\d+\z/)
      begin
        Process.kill(0, owner.to_i)
        return
      rescue Errno::ESRCH, Errno::EPERM
      end
    end
    require 'io/console'
    require 'tmpdir'
    if Thread.list.length > 1
      plain.call
      return
    end
    tty = File.open('/dev/tty', 'r+')
    tty.binmode
    tty.sync = true
    keys = ['10', '11', '12'] + (0..15).map { |index| "4;#{index}" }
    palette = %w[000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee
                 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff]
    targets = { '10' => 'ffffff', '11' => '000000', '12' => 'ffffff' }
    palette.each_with_index { |color, index| targets["4;#{index}"] = color }
    query = lambda do |key|
      tty.write("\e]#{key};?\a")
      bytes = ''.b
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 0.3
      loop do
        remaining = deadline - Process.clock_gettime(Process::CLOCK_MONOTONIC)
        return nil if remaining <= 0 || !IO.select([tty], nil, nil, remaining)
        piece = tty.read_nonblock(256, exception: false)
        next if piece == :wait_readable
        return nil unless piece && !piece.empty?
        bytes << piece
        return nil if bytes.bytesize > 256 || !bytes.start_with?("\e".b)
        break if bytes.end_with?("\a".b) || bytes.end_with?("\e\\".b)
      end
      match = bytes.match(/\A\e\]#{Regexp.escape(key)};rgb:([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})(?:\a|\e\\)\z/n)
      return nil unless match
      components = match.captures.map { |hex| (hex.to_i(16) * 65535.0 / (16**hex.length - 1)).round }
      { raw: bytes, rgb: components }
    rescue IOError, SystemCallError
      nil
    end
    snapshot = lambda do
      values = {}
      tty.raw(min: 0, time: 0, intr: true) do
        keys.each do |key|
          value = query.call(key)
          return nil unless value
          values[key] = value
        end
      end
      values
    rescue IOError, SystemCallError, ArgumentError
      nil
    end
    original = snapshot.call
    unless original
      notify.call('终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。')
      tty.close
      plain.call
      return
    end
    directory = Dir.mktmpdir('jobs-terminal-style-')
    recovery = File.join(directory, 'restore.sh')
    original_bytes = keys.map { |key| original.fetch(key).fetch(:raw) }.join
    recovery_source = "#!/bin/sh\n" \
      "[ -t 0 ] && [ \"$(tty)\" = '#{tty_name}' ] || { printf '请在原终端运行恢复入口。\\n' >&2; exit 1; }\n" \
      "printf '本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：' >&2\n" \
      "IFS= read -r jobs_restore_choice\n[ \"$jobs_restore_choice\" = YES ] || exit 1\n" \
      "printf '%s\\033[0m' '#{original_bytes}' > /dev/tty\n"
    File.open(recovery, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.binmode
      file.write(recovery_source.b)
    end
    notify.call("本次终端临时使用黑底白字；强退后恢复入口：sh \"#{recovery}\"")
    changed = false
    applied = nil
    # 比较仍生效的本轮颜色，只恢复未被用户另行修改的项。
    cleanup = lambda do
      current = applied && snapshot.call
      unless current
        notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
        return false
      end
      conflicts = []
      restore_bytes = ''.b
      keys.each do |key|
        if current.fetch(key).fetch(:rgb) == applied.fetch(key).fetch(:rgb)
          restore_bytes << original.fetch(key).fetch(:raw)
        else
          conflicts << key
        end
      end
      tty.write(restore_bytes + "\e[0m".b)
      if conflicts.empty?
        File.unlink(recovery)
        Dir.rmdir(directory)
        true
      else
        notify.call("检测到运行期间的配色变更，已保留这些项：#{conflicts.join(' ')}")
        notify.call("确认要覆盖后续改色时才使用恢复入口：sh \"#{recovery}\"")
        false
      end
    rescue IOError, SystemCallError
      notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
      false
    end
    child_pid = nil
    guardian = false
    interrupted = nil
    previous_signals = {}
    %w[INT TERM HUP].each do |name|
      previous_signals[name] = Signal.trap(name) do
        interrupted = name
        if child_pid && name != 'INT'
          begin
            Process.kill(name, child_pid)
          rescue Errno::ESRCH
          end
        end
      end
    end
    begin
      changed = true
      tty.write(targets.map { |key, color| "\e]#{key};##{color}\a" }.join + "\e[0m")
      applied = snapshot.call
      unless applied
        notify.call('无法核实本次临时配色，已停止启动业务。')
        raise SystemExit, 1
      end
      desired = targets.all? do |key, hex|
        rgb = hex.scan(/../).map { |component| component.to_i(16) * 257 }
        applied.fetch(key).fetch(:rgb).zip(rgb).all? { |actual, expected| (actual - expected).abs <= 255 }
      end
      unless desired
        notify.call('终端未接受本次配色，恢复后使用纯文本。')
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      if interrupted
        raise SystemExit, 128 + Signal.list.fetch(interrupted)
      end
      if Thread.list.length > 1
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      $stdout.flush
      $stderr.flush
      begin
        child_pid = Process.fork
      rescue NotImplementedError, SystemCallError
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      unless child_pid
        changed = false
        ENV['JOBS_TERMINAL_STYLE_TTY'] = tty_name
        ENV['JOBS_TERMINAL_STYLE_OWNER'] = Process.ppid.to_s
        raise SystemExit, 128 + Signal.list.fetch(interrupted) if interrupted
        return
      end
      guardian = true
      result = nil
      loop do
        begin
          _, result = Process.wait2(child_pid)
          break
        rescue Interrupt, Errno::EINTR
        end
      end
      status_code = result.exitstatus || 128 + result.termsig
      %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
      restored = cleanup.call
      changed = false
      status_code = 1 if !restored && status_code.zero?
      tty.close
      Process.exit!(status_code)
    ensure
      if changed
        %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
        cleanup.call
      end
      previous_signals.each { |name, handler| Signal.trap(name, handler) } unless guardian
      tty.close unless tty.closed?
    end
  rescue IOError, SystemCallError, LoadError => error
    if guardian
      notify.call("终端保护监督进程异常：#{error.message}")
      Process.exit!(1)
    end
    raise SystemExit, 1 if changed
    notify.call("终端保护不可用，使用纯文本：#{error.message}")
    plain.call
  end
  jobs_terminal_style_bootstrap_v1

end
# JOBS_TERMINAL_STYLE_GUARD_V1_END

require 'tmpdir'
require 'fileutils'
require 'open3'
require 'timeout'
require 'json'
require 'cocoapods'
require_relative '../../jobs_cocoapods_source.rb/jobs_cocoapods_source'

# 用途：隔离验证选源网络判定、进程超时、锁定源及 CocoaPods 适配；使用受控夹具，不安装依赖。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

module SpecsSourceRegression
  CDN = 'https://cdn.cocoapods.org/'
  GIT = 'https://github.com/CocoaPods/Specs.git'
  PACKAGE = File.expand_path('../..', __dir__)
  SCRIPT = File.join(PACKAGE, File.basename(PACKAGE))

  FAKE_CURL = <<~'ZSH'
    #!/bin/zsh
    if [[ "$1" == --version ]]; then
      print -r -- 'curl 8.0.0'
      exit 0
    fi
    output=''
    endpoint=''
    while (( $# )); do
      case "$1" in
        --output|-o) output="$2"; shift 2 ;;
        --write-out|-w|--connect-timeout|--max-time|--max-filesize|--proto|--proto-redir|--retry|--request|-X) shift 2 ;;
        https://*) endpoint="$1"; shift ;;
        *) shift ;;
      esac
    done
    print -r -- "$endpoint" >> "$JOBS_TEST_EVENTS"
    if [[ "$endpoint" == https://cdn.cocoapods.org/* ]]; then
      outcome="${JOBS_TEST_CDN:-ok}"
      elapsed="${JOBS_TEST_CDN_TIME:-0.10}"
    else
      outcome="${JOBS_TEST_GIT:-ok}"
      elapsed="${JOBS_TEST_GIT_TIME:-0.30}"
    fi
    [[ "$outcome" == fail ]] && exit 7
    case "$outcome" in
      html) print -r -- '<html>Sign in</html>' > "$output" ;;
      invalid) print -r -- '{broken json' > "$output" ;;
      wrong) print -r -- '{"name":"WrongPod","version":"9.9.9"}' > "$output" ;;
      *)
        sample_version="${${endpoint:h}:t}"
        sample_name="${${${endpoint:h}:h}:t}"
        print -r -- "{\"name\":\"${sample_name}\",\"version\":\"${sample_version}\"}" > "$output"
        ;;
    esac
    print -rn -- "$elapsed"
  ZSH

  FAKE_GIT = <<~'ZSH'
    #!/bin/zsh
    if [[ "$1" == --version ]]; then
      print -r -- 'git version 2.50.0'
      exit 0
    fi
    print -r -- 'git-protocol' >> "$JOBS_TEST_EVENTS"
    case "${JOBS_TEST_GIT:-ok}" in
      fail|protocol_fail) exit 128 ;;
      hang) print -r -- "$$" > "$JOBS_TEST_GIT_PID"; exec /bin/sleep 30 ;;
      *) print -r -- '0123456789012345678901234567890123456789 HEAD' ;;
    esac
  ZSH

  class << self
    # 断言失败时保留具体用例语境。
    def assert(condition, message)
      raise message unless condition
    end

    # 顺序运行用例并输出便于核对的结果。
    def check(name)
      yield
      @passed = (@passed || 0) + 1
      puts "PASS #{name}"
    end

    # 构造只包含假网络工具的隔离执行环境。
    def setup(root)
      @root = root
      @bin = File.join(root, 'fake-bin')
      FileUtils.mkdir_p(@bin)
      { 'curl' => FAKE_CURL, 'git' => FAKE_GIT }.each do |name, code|
        path = File.join(@bin, name)
        File.write(path, code)
        File.chmod(0o755, path)
      end
    end

    # 每次使用独立日志，且不继承用户的选源测试参数。
    def environment(options = {})
      cleaned = ENV.keys.grep(/\AJOBS_SPECS_/).each_with_object({}) { |key, hash| hash[key] = nil }
      cleaned.merge(
        'PATH' => "#{@bin}:/usr/bin:/bin:/usr/sbin:/sbin",
        'JOBS_SPECS_LOG_PATH' => File.join(@root, 'probe.log'),
        'JOBS_SPECS_PROBE_TIMEOUT' => '1',
        'JOBS_SPECS_CONNECT_TIMEOUT' => '1',
        'JOBS_TEST_EVENTS' => File.join(@root, 'events'),
        'JOBS_TEST_GIT_PID' => File.join(@root, 'git.pid'),
        'JOBS_TEST_CDN' => 'ok',
        'JOBS_TEST_GIT' => 'ok',
        'JOBS_TEST_CDN_TIME' => '0.10',
        'JOBS_TEST_GIT_TIME' => '0.30'
      ).merge(options)
    end

    # 调用真实选源脚本，仅替换它访问网络的命令。
    def probe(options = {})
      File.write(File.join(@root, 'events'), '')
      stdout, stderr, status = Timeout.timeout(8) do
        Open3.capture3(environment(options), '/bin/zsh', SCRIPT, '--podfile-hook')
      end
      assert(status.success?, "脚本失败：#{status.exitstatus}\n#{stderr}")
      assert([CDN, GIT].include?(stdout.strip), "stdout 被非 URL 内容污染：#{stdout.inspect}")
      [stdout.strip, stderr, File.read(File.join(@root, 'events'))]
    end

    # 临时切换环境后完整恢复，防止测试互相影响。
    def with_environment(values)
      saved = values.keys.each_with_object({}) { |key, hash| hash[key] = ENV[key] }
      values.each { |key, value| value.nil? ? ENV.delete(key) : ENV[key] = value }
      yield
    ensure
      saved.each { |key, value| value.nil? ? ENV.delete(key) : ENV[key] = value }
    end

    # 覆盖成功、失败、劫持响应和 Git 协议挂起等实际风险。
    def network_checks
      check('两边均测试，CDN 更快') do
        url, diagnostics, events = probe
        assert(url == CDN, '应选择 CDN')
        assert(events.include?('cdn.cocoapods.org/Specs/'), "未测试 CDN podspec：#{events.inspect}\n#{diagnostics}")
        assert(events.include?('raw.githubusercontent.com/CocoaPods/Specs/'), '未测试 Git podspec')
        assert(events.include?('git-protocol'), '未测试 Git 协议')
      end
      check('Git 明显更快') do
        url, = probe('JOBS_TEST_CDN_TIME' => '0.90', 'JOBS_TEST_GIT_TIME' => '0.10')
        assert(url == GIT, '应根据测试耗时选择 Git')
      end
      check('耗时接近时使用 CDN') do
        url, = probe('JOBS_TEST_CDN_TIME' => '0.11', 'JOBS_TEST_GIT_TIME' => '0.10')
        assert(url == CDN, '15% 内应选择 CDN')
      end
      check('CDN 不通使用 Git') { assert(probe('JOBS_TEST_CDN' => 'fail').first == GIT, '应选 Git') }
      check('Git 协议失败使用 CDN') { assert(probe('JOBS_TEST_GIT' => 'protocol_fail').first == CDN, '应选 CDN') }
      %w[html invalid wrong].each do |outcome|
        check("拒绝 CDN 伪成功响应 #{outcome}") do
          assert(probe('JOBS_TEST_CDN' => outcome).first == GIT, '应拒绝无效 podspec')
        end
      end
      check('双源失败明确回用原 Git 缓存源') do
        url, diagnostics, = probe('JOBS_TEST_CDN' => 'fail', 'JOBS_TEST_GIT' => 'fail',
                                  'JOBS_SPECS_FALLBACK_URL' => GIT)
        assert(url == GIT, '应返回原缓存源')
        assert(!diagnostics.empty?, '缺少失败诊断')
      end
      check('双源失败无原源时使用 CDN 默认值') do
        assert(probe('JOBS_TEST_CDN' => 'fail', 'JOBS_TEST_GIT' => 'fail').first == CDN, '应选 CDN 默认值')
      end
      check('Git 协议超时有界并回收进程') do
        started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        assert(probe('JOBS_TEST_GIT' => 'hang').first == CDN, 'Git 超时应选 CDN')
        assert(Process.clock_gettime(Process::CLOCK_MONOTONIC) - started < 6, 'Git 超时未受控')
        pid = File.read(File.join(@root, 'git.pid')).to_i
        begin
          Process.kill(0, pid)
          raise "Git 探测留下进程 #{pid}"
        rescue Errno::ESRCH
          # 进程已被回收。
        end
      end
      %w[cdn git].each do |mode|
        check("手动 #{mode} 仍测试但保持指定选择") do
          expected = mode == 'cdn' ? CDN : GIT
          url, _, events = probe('JOBS_SPECS_SOURCE' => mode)
          assert(url == expected, '手动选择被覆盖')
          assert(events.include?('cdn.cocoapods.org/') && events.include?('git-protocol'), '手动模式遗漏网络测试')
        end
      end
      check('独立非交互入口不执行网络操作') do
        File.write(File.join(@root, 'events'), '')
        _, _, status = Open3.capture3(environment, '/bin/zsh', SCRIPT, stdin_data: '')
        assert(!status.success?, '独立入口应等待人工确认')
        assert(File.read(File.join(@root, 'events')).empty?, '确认前发生网络操作')
      end
    end

    # 验证只适配公共源，保持版本、校验和与磁盘文件。
    def lock_checks
      lock = Pod::Lockfile.new(
        'PODS' => ['AFNetworking (4.0.1)', 'PrivateKit (1.0.0)'],
        'DEPENDENCIES' => ['AFNetworking', 'PrivateKit'],
        'SPEC REPOS' => { GIT => ['AFNetworking'], 'https://private.example/specs.git' => ['PrivateKit'] },
        'SPEC CHECKSUMS' => { 'AFNetworking' => 'unchanged', 'PrivateKit' => 'private' }
      )
      original = Marshal.dump(lock.to_hash)
      check('锁文件公共源关联切换，私源与版本保持') do
        JobsCocoaPodsSource.align_lockfile_source!(lock, CDN)
        assert(lock.spec_repo('AFNetworking') == CDN, '旧 Git 源仍在生效')
        assert(lock.spec_repo('PrivateKit') == 'https://private.example/specs.git', '私源被改写')
        assert(Marshal.dump(lock.to_hash) == original, '锁定数据被修改')
      end
      check('锁定图真正使用所选源') do
        graph = Pod::Installer::Analyzer::LockingDependencyAnalyzer.generate_version_locking_dependencies(lock, [], [])
        dep = graph.vertex_named('AFNetworking').payload
        assert(dep.podspec_repo == CDN, 'CocoaPods 实际锁定图没有跟随切源')
        assert(dep.requirement.to_s == '= 4.0.1', '依赖版本锁定丢失')
      end
      check('采样路径来自真实锁定 Pod') do
        assert(JobsCocoaPodsSource.sample_path(lock) == 'Specs/a/7/5/AFNetworking/4.0.1/AFNetworking.podspec.json', '采样路径错误')
      end
      check('不会把第三方私有镜像当公共源') do
        assert(!JobsCocoaPodsSource.public_source?('https://private.example/CocoaPods/Specs.git'), '误识别私源')
      end
    end

    # 验证集成层不会信任脚本垃圾输出，也不会在查询命令中联网。
    def adapter_checks
      project = File.join(@root, '临时工程 with spaces')
      package = File.join(project, 'ScriptsByPods', File.basename(PACKAGE))
      script = File.join(package, File.basename(PACKAGE))
      helper_path = File.join(package, 'jobs_cocoapods_source.rb', 'jobs_cocoapods_source.rb')
      FileUtils.mkdir_p(File.dirname(helper_path))
      FileUtils.cp(File.join(PACKAGE, 'jobs_cocoapods_source.rb', 'jobs_cocoapods_source.rb'), helper_path)
      isolated = Module.new
      isolated.module_eval(File.read(helper_path), helper_path, 1)
      adapter = isolated.const_get(:JobsCocoaPodsSource)
      check('脚本缺失时回退，不中断解析') do
        assert(adapter.select_source(project_root: project) == CDN, '缺脚本未回退 CDN')
      end
      check('拒绝成功退出但输出任意命令的脚本') do
        File.write(script, "#!/bin/zsh\nprint -r -- 'https://evil.example/'\n")
        assert(adapter.select_source(project_root: project) == CDN, '接收了白名单之外的源')
      end
      check('无探测模式不执行外部脚本') do
        marker = File.join(@root, 'should-not-exist')
        File.write(script, "#!/bin/zsh\n/usr/bin/touch '#{marker}'\nprint -r -- '#{GIT}'\n")
        adapter.select_source(project_root: project, probe: false)
        assert(!File.exist?(marker), '查询模式发生网络脚本调用')
      end
      check('Ruby 集成尊重脚本返回的 Git 结果') do
        File.write(script, "#!/bin/zsh\nprint -r -- '#{GIT}'\n")
        assert(adapter.select_source(project_root: project) == GIT, 'Git 结果被覆盖')
      end
      check('同一 Podfile 只固定一次选源结果') do
        File.write(script, "#!/bin/zsh\nprint -r -- '#{GIT}'\n")
        podfile = Pod::Podfile.new {}
        adapter.apply!(podfile, project_root: project, run_probe: true)
        File.write(script, "#!/bin/zsh\nprint -r -- '#{CDN}'\n")
        adapter.apply!(podfile, project_root: project, run_probe: true)
        assert(podfile.sources == [GIT], '重复调用导致源切换或重复声明')
      end
      check('父进程退出后仍回收持有管道的后台子进程') do
        pid_path = File.join(@root, 'orphan.pid')
        File.write(script, "#!/bin/zsh\n/bin/sleep 30 &\nprint -r -- $! > '#{pid_path}'\nprint -r -- '#{CDN}'\n")
        _, successful, timed_out = adapter.run_selector({}, script, project, 1)
        assert(!successful && timed_out, '持有输出管道的后台任务没有计入总时限')
        begin
          Process.kill(0, File.read(pid_path).to_i)
          raise '适配器留下后台子进程'
        rescue Errno::ESRCH
          # 子进程已被回收。
        end
      end
      check('查询参数中的 install 不会误触发网络探测') do
        original_name = $PROGRAM_NAME
        original_arguments = ARGV.dup
        begin
          $PROGRAM_NAME = 'pod'
          ARGV.replace(%w[ipc podfile-json install])
          assert(!adapter.dependency_command?, 'ipc 被误判为安装')
          ARGV.replace(%w[--silent install])
          assert(adapter.dependency_command?, '带全局选项的 install 未被识别')
        ensure
          $PROGRAM_NAME = original_name
          ARGV.replace(original_arguments)
        end
      end
    end

    # 编排全部隔离验证。
    def run
      Dir.mktmpdir('jobs-specs-source-regression-') do |root|
        setup(root)
        network_checks
        lock_checks
        adapter_checks
      end
      puts "#{@passed} checks passed; no pod install or real network commands executed."
    end
  end
end

SpecsSourceRegression.run
