# frozen_string_literal: true

# 隔离验证网络判定、进程超时及 CocoaPods 锁定源适配；不安装依赖。
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'timeout'
require 'json'
require 'cocoapods'
require_relative '../jobs_cocoapods_source'

module SpecsSourceRegression
  CDN = 'https://cdn.cocoapods.org/'
  GIT = 'https://github.com/CocoaPods/Specs.git'
  PACKAGE = File.expand_path('..', __dir__)
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
      FileUtils.mkdir_p(package)
      script = File.join(package, File.basename(PACKAGE))
      helper_path = File.join(package, 'jobs_cocoapods_source.rb')
      FileUtils.cp(File.join(PACKAGE, 'jobs_cocoapods_source.rb'), helper_path)
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
