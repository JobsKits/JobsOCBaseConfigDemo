#!/usr/bin/env ruby
# 只依据最终矩阵回填独立验收结果句；默认预览，拒绝不完整或过期证据。
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

require 'digest'
require 'json'
require 'open3'
require 'optparse'
require 'pathname'
require 'tempfile'
require 'time'
require_relative '../jobs_stability_sources.rb/jobs_stability_sources'
require_relative '../jobs_stability_pod_batch.rb/jobs_stability_pod_batch'

DEFAULT_ROOT = File.expand_path('../../../..', __dir__).freeze
RESULT_LINK = '[JobsByPods升级实施与编译验证.md](<../../项目相关报告/JobsByPods升级实施与编译验证.md>)'.freeze
PENDING_PREFIX = "当前结果：**待最终全量验收，见根 #{RESULT_LINK}**。".freeze
TEST_BUILD_IDENTITY_KEYS = %w[kind name configuration source_fingerprint execution_mode signing_policy started_at log command
                              exit_status source_consistent timed_out process_status_collected process_exit_status process_signal process_pid].freeze

# 直接携带 App 的真实语言表，避免独立 Pod 宿主缺表时把语言回归跳过。
module JobsSearcherLanguageArtifact
  SOURCE = 'JobsOCBaseConfigDemo/其他/libs/语言包'.freeze
  HOST = 'AppHost-JobsOCSearcher-Unit-Tests'.freeze
  BUNDLE = 'org.cocoapods.AppHost-JobsOCSearcher-Unit-Tests'.freeze
  REQUIRED = %w[en zh-Hans].freeze
  module_function

  def sources(root)
    directory = File.join(File.realpath(root), SOURCE)
    files = Dir.glob(File.join(directory, '*.lproj', 'Localizable.strings')).sort
    rows = files.map do |file|
      language = File.basename(File.dirname(file), '.lproj')
      raise '语言目录名不安全' unless language.match?(/\A[A-Za-z0-9_-]+\z/)
      raise '语言源表越出真实App目录' unless File.realpath(file).start_with?(File.realpath(directory) + '/')
      { 'language' => language, 'source' => File.join(SOURCE, language + '.lproj', 'Localizable.strings'),
        'source_sha256' => Digest::SHA256.file(file).hexdigest }
    end
    raise '真实App语言表缺少en或zh-Hans' unless (REQUIRED - rows.map { |row| row['language'] }).empty?
    rows
  end

  def host_identity(app)
    raise '拒绝选择非精确Searcher测试宿主' unless File.basename(app) == HOST + '.app' && File.directory?(app) && !File.symlink?(app)
    plist_text, plist_status = Open3.capture2e('/usr/bin/plutil', '-convert', 'json', '-o', '-', File.join(app, 'Info.plist'))
    raise 'Searcher测试宿主Info.plist无法读取' unless plist_status.success?
    plist = JSON.parse(plist_text)
    raise 'Searcher测试宿主Bundle身份不符' unless plist['CFBundleIdentifier'] == BUNDLE && plist['CFBundleExecutable'] == HOST
    binary = File.join(app, HOST)
    raise 'Searcher测试宿主可执行文件缺失或为软链接' unless File.file?(binary) && !File.symlink?(binary)
    { 'host_app' => File.realpath(app), 'bundle_identifier' => BUNDLE,
      'host_binary_sha256' => Digest::SHA256.file(binary).hexdigest }
  end

  def destination(app, language)
    directory = File.join(app, language + '.lproj')
    file = File.join(directory, 'Localizable.strings')
    raise '拒绝语言资源软链接目标' if File.symlink?(directory) || File.symlink?(file)
    file
  end

  def signature_state(app)
    text, inspection = Open3.capture2e({ 'LC_ALL' => 'C' }, '/usr/bin/codesign', '-d', '--verbose=2', app)
    verification, verified = Open3.capture2e({ 'LC_ALL' => 'C' }, '/usr/bin/codesign', '--verify', '--strict', '--verbose=2', app)
    state = inspection.success? ? 'signed' : text.include?('code object is not signed at all') ? 'unsigned' : 'unknown'
    valid = state == 'signed' ? verified.success? : state == 'unsigned' && !verified.success? && verification.include?('code object is not signed at all')
    { 'state' => state, 'valid' => valid, 'inspection_exit_status' => inspection.exitstatus,
      'verification_exit_status' => verified.exitstatus, 'inspection' => text, 'verification' => verification }
  end

  def prepare(root, app, configuration, path)
    identity = host_identity(app)
    before_signature = signature_state(app)
    raise 'Searcher宿主原始签名状态无法识别' if before_signature['state'] == 'unknown'
    rows = sources(root).map do |row|
      source = File.join(root, row.fetch('source'))
      target = destination(app, row.fetch('language'))
      FileUtils.mkdir_p(File.dirname(target))
      File.binwrite(target, File.binread(source))
      output = Digest::SHA256.file(target).hexdigest
      raise '真实App源表复制期间发生变化' unless output == row.fetch('source_sha256') && Digest::SHA256.file(source).hexdigest == output
      row.merge('destination' => File.realpath(target), 'output_sha256' => output)
    end
    raise '准备语言资源时宿主二进制发生变化' unless host_identity(app) == identity
    signature = { 'before' => before_signature, 're_signed' => before_signature['state'] == 'signed' }
    if signature['re_signed']
      output, signed = Open3.capture2e('/usr/bin/codesign', '--force', '--sign', '-', '--preserve-metadata=identifier,entitlements', app)
      signature['resign_exit_status'] = signed.exitstatus
      signature['resign_output'] = output
      raise "Searcher宿主重新ad-hoc签名失败：#{output}" unless signed.success?
    end
    signature['after'] = signature_state(app)
    raise 'Searcher语言资源准备后的签名验证失败' unless signature['after']['valid'] == true && signature['after']['state'] == before_signature['state']
    policy = signature['re_signed'] ? 'simulator-adhoc-searcher-localization-v1' : 'unsigned'
    receipt = host_identity(app).merge('version' => 1, 'configuration' => configuration, 'signing_policy' => policy,
      'source_root' => SOURCE, 'required_languages' => REQUIRED, 'host_binary_unchanged_by_resource_copy' => true,
      'binary_sha256_before_copy' => identity['host_binary_sha256'], 'binary_sha256_after_copy' => identity['host_binary_sha256'],
      'signature' => signature, 'tables' => rows, 'prepared_at' => Time.now.iso8601(6))
    FileUtils.mkdir_p(File.dirname(path))
    File.binwrite(path, JSON.pretty_generate(receipt) + "\n")
    verify(root, app, configuration, receipt)
    receipt
  end

  def verify(root, app, configuration, receipt)
    identity = host_identity(app)
    raise 'Searcher语言准备回执身份或策略不符' unless receipt.is_a?(Hash) && receipt['version'] == 1 &&
      receipt['configuration'] == configuration && receipt['source_root'] == SOURCE &&
      receipt['required_languages'] == REQUIRED && receipt['host_binary_unchanged_by_resource_copy'] == true &&
      receipt['binary_sha256_before_copy'].is_a?(String) && receipt['binary_sha256_before_copy'] == receipt['binary_sha256_after_copy'] &&
      identity.all? { |key, value| receipt[key] == value }
    current_signature = signature_state(app)
    signature = receipt['signature']
    signed = signature.is_a?(Hash) && signature.dig('before', 'state') == 'signed'
    expected_policy = signed ? 'simulator-adhoc-searcher-localization-v1' : 'unsigned'
    raise 'Searcher当前签名或重新签名回执不符' unless signature.is_a?(Hash) &&
      %w[signed unsigned].include?(signature.dig('before', 'state')) &&
      signature['re_signed'] == signed && (!signed || signature['resign_exit_status'] == 0) &&
      signature.dig('after', 'valid') == true && current_signature['valid'] == true &&
      current_signature['state'] == (signed ? 'signed' : 'unsigned') && signature.dig('after', 'state') == current_signature['state'] &&
      receipt['signing_policy'] == expected_policy
    current = sources(root)
    tables = receipt['tables']
    raise 'Searcher语言回执没有完整覆盖真实App表' unless tables.is_a?(Array) &&
      tables.map { |row| row['language'] }.sort == current.map { |row| row['language'] }.sort && tables.size == current.size
    current.each do |source|
      row = tables.find { |item| item['language'] == source['language'] }
      target = destination(app, source['language'])
      raise 'Searcher语言目标文件缺失' unless File.file?(target)
      raise 'Searcher真实语言表或输出SHA不符' unless row['source'] == source['source'] &&
        row['source_sha256'] == source['source_sha256'] && row['destination'] == File.realpath(target) &&
        row['output_sha256'] == source['source_sha256'] && Digest::SHA256.file(target).hexdigest == row['output_sha256']
    end
    true
  end
end

# 复用人工审阅清单，新增、缺失或重复模块都不能靠旧固定数量蒙混过关。
def validate_pod_inventory(root, record, actual_names)
  baseline_path = File.join(root, 'ScriptsByPods', '自动化测试相关脚本', 'jobs_pods_stability_audit.rb', 'baseline.json')
  baseline = JSON.parse(File.read(baseline_path))
  expected = baseline.is_a?(Hash) ? baseline['expected_pods'] : nil
  unless expected.is_a?(Array) && !expected.empty? &&
      expected.all? { |name| name.is_a?(String) && !name.strip.empty? } && expected.uniq.size == expected.size
    raise '已审 baseline.expected_pods 必须是非空、无重复的 Pod 名称清单'
  end
  unless actual_names.sort == expected.sort && record['self_pod_count'].is_a?(Integer) &&
      record['self_pod_count'] == expected.size
    raise "自建 Pod 清单与已审 baseline 不一致：缺少 #{(expected - actual_names).inspect}，新增 #{(actual_names - expected).inspect}，记录数量 #{record['self_pod_count'].inspect}，预期 #{expected.size}"
  end
  expected
end

# 与 runner 相同的枚举与字节指纹，不执行构建、安装或其余 runner 副作用。
def source_paths(root)
  JobsStabilitySources.paths(root)
end

def snapshot(root)
  source_paths(root).map do |path|
    stat = File.stat(path)
    [path, stat.ino, stat.size, stat.mtime.to_r, stat.ctime.to_r]
  end
end

def source_fingerprint(root, xcode_version, architecture = nil)
  JobsStabilitySources.fingerprint(root, xcode_version, architecture: architecture)
end

def latest_result(record, fingerprint, kind, name, configuration)
  record.fetch('results').reverse.find do |row|
    row.values_at('kind', 'name', 'configuration', 'source_fingerprint') == [kind, name, configuration, fingerprint]
  end
end

def evidence_path(path, root)
  return nil unless path.is_a?(String) && !path.empty?
  File.expand_path(path, root)
end

def require_result(errors, record, fingerprint, root, kind, name, configuration)
  label = "#{kind}/#{name}/#{configuration}"
  row = latest_result(record, fingerprint, kind, name, configuration)
  unless row
    errors << "缺少当前指纹结果 #{label}"
    return nil
  end
  errors << "结果失败 #{label}: exit_status=#{row['exit_status'].inspect}" unless row['exit_status'] == 0
  errors << "指纹期间变更 #{label}" if row['source_consistent'] == false
  log = evidence_path(row['log'], root)
  errors << "日志不存在 #{label}" unless log && File.file?(log)
  if kind == 'pod' && row['execution_mode'] == 'batch-member'
    JobsStabilityPodBatch.member_errors(record, row, root).each do |message|
      errors << "#{message} #{label}"
    end
  end
  row
end

def require_test(errors, record, fingerprint, root, name, configuration)
  row = require_result(errors, record, fingerprint, root, 'test', name, configuration)
  return nil unless row
  label = "test/#{name}/#{configuration}"
  if row['execution_mode'] == 'test-without-building'
    preparation = require_result(errors, record, fingerprint, root, 'test_build', name, configuration)
    if preparation
      expected_signing_policy = case name
      when 'ApplicationTests' then 'simulator-adhoc-application-tests-v1'
      when 'JobsBaseUI' then 'simulator-adhoc-keychain-v1'
      else 'unsigned'
      end
      expected_test_policy = name == 'JobsOCSearcher' ? row.dig('language_artifact', 'signing_policy') : expected_signing_policy
      command = preparation['command']
      valid_preparation = preparation['execution_mode'] == 'separate-test-build' &&
        preparation['exit_status'] == 0 && preparation['timed_out'] == false &&
        preparation['source_consistent'] == true && preparation['process_status_collected'] == true &&
        preparation['process_exit_status'] == 0 && preparation['process_signal'].nil? &&
        preparation['process_pid'].is_a?(Integer) && preparation['process_pid'].positive? &&
        preparation['signing_policy'] == expected_signing_policy && row['signing_policy'] == expected_test_policy &&
        command.is_a?(Array) && command.first == 'xcodebuild' && command.last == 'build-for-testing'
      errors << "测试构建证据未完整成功 #{label}" unless valid_preparation
      identity = preparation.select { |key, _value| TEST_BUILD_IDENTITY_KEYS.include?(key) }
      unless TEST_BUILD_IDENTITY_KEYS.all? { |key| preparation.key?(key) } && row['test_build_record'] == identity
        errors << "测试与最新构建证据不匹配 #{label}"
      end
      rows = record.fetch('results')
      preparation_index = rows.rindex { |item| item.equal?(preparation) }
      test_index = rows.rindex { |item| item.equal?(row) }
      unless preparation_index && test_index && preparation_index < test_index
        errors << "最新测试构建发生在测试之后，旧测试结果不能覆盖它 #{label}"
      end
    end
  end
  summary = row['test_summary']
  unless summary.is_a?(Hash)
    errors << "没有实际 XCTest summary #{label}"
    return row
  end
  errors << "XCTest result 不是 Passed #{label}: #{summary['result'].inspect}" unless summary['result'] == 'Passed'
  keys = %w[totalTestCount passedTests failedTests skippedTests]
  unless keys.all? { |key| summary[key].is_a?(Integer) && summary[key] >= 0 }
    errors << "XCTest summary 数量字段非法 #{label}"
    return row
  end
  total, passed, failed, skipped = keys.map { |key| summary[key] }
  unless total > 0 && passed == total && failed == 0 && skipped == 0
    errors << "XCTest 没有完整成功执行 #{label}: #{summary.inspect}"
  end
  bundle = evidence_path(row['result_bundle'], root)
  errors << "xcresult 不存在 #{label}" unless bundle && File.directory?(bundle) && File.extname(bundle) == '.xcresult'
  errors << "测试模拟器 UDID 缺少 #{label}" unless row['simulator'].is_a?(String) && row['simulator'].match?(/\A[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\z/)
  if name == 'JobsBaseUI'
    errors << "Keychain XCTest 必须全部执行且零跳过 #{label}" unless passed == total && skipped.zero?
    errors << "Keychain 测试签名策略不匹配 #{label}" unless row['signing_policy'] == 'simulator-adhoc-keychain-v1'
    signature = row['host_signature']
    if !signature.is_a?(Hash) || signature['valid'] != true ||
       signature['codesign_exit_status'] != 0 || signature['verification_exit_status'] != 0
      errors << "Keychain 实际宿主签名审计缺失或失败 #{label}"
    else
      identifier = signature['bundle_identifier']
      permissions_match = lambda do |values|
        identifier.is_a?(String) && !identifier.empty? && values.is_a?(Hash) &&
          values['application-identifier'] == identifier && values['keychain-access-groups'] == [identifier] &&
          values['get-task-allow'] == true
      end
      # 领取当次测试记录中的编译证据，不重新读取后续构建可能已替换的 Products。
      permissions_valid = case signature['permission_source']
                          when 'code-signature'
                            permissions_match.call(signature['code_signature_entitlements'])
                          when 'simulator-binary-__TEXT-__entitlements'
                            proof = signature['compiled_permissions']
                            architectures = proof.is_a?(Hash) ? proof['architectures'] : nil
                            proof.is_a?(Hash) && proof['valid'] == true &&
                              proof['binary'].is_a?(String) && !proof['binary'].empty? &&
                              proof['binary_sha256'].is_a?(String) && proof['binary_sha256'].match?(/\A[0-9a-f]{64}\z/) &&
                              architectures.is_a?(Array) && !architectures.empty? &&
                              architectures.all? do |architecture|
                                architecture.is_a?(Hash) && architecture['valid'] == true &&
                                  architecture['architecture'].is_a?(String) && !architecture['architecture'].empty? &&
                                  permissions_match.call(architecture['entitlements'])
                              end
                          else
                            false
                          end
      errors << "Keychain 当次宿主权限证据缺失或不匹配 #{label}" unless permissions_valid
    end
  end
  if name == 'ApplicationTests'
    require_relative '../jobs_stability_integrated.rb/jobs_stability_integrated'
    component = JobsStabilityIntegrated.pod_application_tests(root)
    expected = component.fetch('expected_test_count')
    errors << "主工程必须完整执行 #{expected} 例且零跳过 #{label}" unless row['expected_test_count'] == expected &&
      row['test_inventory'] == component.fetch('test_inventory') && [total, passed, failed, skipped] == [expected, expected, 0, 0]
    errors << "主工程测试必须关联独立成功构建 #{label}" unless row['execution_mode'] == 'test-without-building'
    errors << "主工程签名策略不匹配 #{label}" unless row['signing_policy'] == 'simulator-adhoc-application-tests-v1'
    unless row['source_consistent'] == true && row['process_status_collected'] == true &&
        row['process_exit_status'] == 0 && row['process_signal'].nil? && row['timed_out'] == false &&
        row['process_pid'].is_a?(Integer) && row['process_pid'].positive?
      errors << "主工程测试实际进程证据未完整成功 #{label}"
    end
    signature = row['host_signature']
    proof = signature.is_a?(Hash) ? signature['compiled_permissions'] : nil
    unless signature.is_a?(Hash) && signature['valid'] == true &&
        signature['app'].is_a?(String) && !signature['app'].empty? &&
        signature['bundle_identifier'].is_a?(String) && !signature['bundle_identifier'].empty? &&
        proof.is_a?(Hash) && proof['valid'] == true &&
        proof['binary_sha256'].is_a?(String) && proof['binary_sha256'].match?(/\A[0-9a-f]{64}\z/)
      errors << "主工程当次实际宿主签名回执缺失或失败 #{label}"
    end
  end
  if name == 'JobsOCSearcher'
    artifact = require_result(errors, record, fingerprint, root, 'language_artifact', name, configuration)
    begin
      raise 'Searcher必须通过分离准备后运行并记录真实签名政策' unless row['execution_mode'] == 'test-without-building' &&
        %w[unsigned simulator-adhoc-searcher-localization-v1].include?(row['signing_policy'])
      path = evidence_path(row['language_artifact_path'], root)
      raise 'Searcher语言准备SHA回执缺失' unless path && File.file?(path) && artifact && artifact['source_consistent'] == true
      bytes = File.binread(path)
      sha = Digest::SHA256.hexdigest(bytes)
      receipt = JSON.parse(bytes)
      raise 'Searcher语言回执与当次记录不一致' unless sha == row['language_artifact_sha256'] &&
        sha == artifact['language_artifact_sha256'] && artifact['language_artifact_path'] == row['language_artifact_path'] &&
        receipt == row['language_artifact'] && receipt == artifact['language_artifact'] && receipt['signing_policy'] == row['signing_policy']
      preparation = latest_result(record, fingerprint, 'test_build', name, configuration)
      rows = record.fetch('results')
      positions = [preparation, artifact, row].map { |item| rows.rindex { |entry| entry.equal?(item) } }
      raise 'Searcher语言资源没有在最新构建后、实际测试前准备' unless positions.all? && positions[0] < positions[1] && positions[1] < positions[2]
      JobsSearcherLanguageArtifact.verify(root, receipt.fetch('host_app'), configuration, receipt)
    rescue StandardError => error
      errors << "Searcher真实语言资源回执无效 #{label}: #{error.message}"
    end
  end
  row
end

# 主工程回归属于完整矩阵，领取报告时重新核对实际 xcresult 和独立宿主二进制。
def require_application_tests(errors, record, fingerprint, root)
  require_relative '../jobs_stability_integrated.rb/jobs_stability_integrated'
  component = JobsStabilityIntegrated.pod_application_tests(root)
  expected = component.fetch('expected_test_count')
  row = require_test(errors, record, fingerprint, root, 'ApplicationTests', 'Debug')
  return nil unless row
  inventory = record['application_tests']
  classes = component.fetch('test_classes').sort
  unless inventory == component && row['expected_test_count'] == expected &&
      row['test_inventory'] == component.fetch('test_inventory') && Array(row['test_classes']).sort == classes
    errors << '主工程测试记录与当前精确方法清单不匹配。'
  end
  preparation = latest_result(record, fingerprint, 'test_build', 'ApplicationTests', 'Debug')
  filters = classes.map { |name| "-only-testing:#{JobsStabilityIntegrated::TESTS}/#{name}" }
  commands = [preparation && preparation['command'], row['command']]
  workspace = evidence_path(row['workspace'], root)
  commands_valid = workspace && File.directory?(workspace) && commands.all? do |command|
    command.is_a?(Array) && command.first == 'xcodebuild' &&
      command.include?('-workspace') && command[command.index('-workspace') + 1] == row['workspace'] &&
      command.include?('-scheme') && command[command.index('-scheme') + 1] == 'JobsIntegratedStability' &&
      command.include?('CODE_SIGNING_ALLOWED=YES') && command.include?('CODE_SIGN_IDENTITY=-') &&
      (filters - command).empty? && command.none? { |argument| argument.start_with?('SRCROOT=', 'PROJECT_DIR=') }
  end
  errors << '主工程测试构建命令、类过滤或实际签名政策不匹配。' unless commands_valid
  bundle = evidence_path(row['result_bundle'], root)
  if bundle && File.directory?(bundle)
    text, status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', bundle, '--compact')
    summary = JSON.parse(text)
    keys = %w[result totalTestCount passedTests failedTests skippedTests]
    unless status.success? && summary.values_at(*keys) == ['Passed', expected, expected, 0, 0] &&
        row['test_summary'].is_a?(Hash) && summary.values_at(*keys) == row['test_summary'].values_at(*keys)
      errors << '主工程真实 xcresult 与当次完整方法清单的成功回执不匹配。'
    end
  end
  signature = row['host_signature']
  if signature.is_a?(Hash) && signature['app'].is_a?(String)
    current = JobsStabilityIntegrated.host_audit(signature['app'])
    proof = signature['compiled_permissions']
    current_proof = current['compiled_permissions']
    unless current['valid'] == true && current['bundle_identifier'] == signature['bundle_identifier'] &&
        proof.is_a?(Hash) && current_proof.is_a?(Hash) && current_proof['binary_sha256'] == proof['binary_sha256']
      errors << '主工程实际宿主签名或二进制已改变，禁止领取旧回执。'
    end
  end
  row
rescue JSON::ParserError, KeyError, SystemCallError, RuntimeError => error
  errors << "主工程实际回执无法读取：#{error.message}"
  nil
end

def prepare_update(path, replacement)
  text = File.read(path)
  headings = text.to_enum(:scan, /^## [^\n]*本轮单元验证[^\n]*$/).map { Regexp.last_match }
  raise "独立验收章节缺少/重复: #{path}" unless headings.size == 1
  heading = headings.first
  start = heading.end(0)
  finish = text.index(/^## /, start) || text.length
  chapter = text[start...finish]
  raise "结果句缺少/重复或已回填: #{path}" unless chapter.scan(PENDING_PREFIX).size == 1
  updated = text.dup
  updated[start...finish] = chapter.sub(PENDING_PREFIX, replacement)
  [text, updated]
end

def main
  options = { root: DEFAULT_ROOT, apply: false }
  OptionParser.new do |parser|
    parser.banner = 'ruby ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/update_readme_results.rb/update_readme_results.rb --results PATH [--root PATH] [--apply]'
    parser.on('--results PATH', '最终 runner results.json') { |value| options[:results] = File.expand_path(value) }
    parser.on('--root PATH', '工程绝对路径') { |value| options[:root] = File.expand_path(value) }
    parser.on('--apply', '门禁全部通过后真正回填；省略时只预览') { options[:apply] = true }
  end.parse!
  raise '--results PATH 必须给出' unless options[:results]
  root = options[:root]
  if File.file?(File.join(root, 'Tests', 'ComponentStability', 'manifest.json'))
    require_relative '../jobs_stability_integrated.rb/jobs_stability_integrated'
    return JobsStabilityIntegrated.update_readme_results(options)
  end
  record = JSON.parse(File.read(options[:results]))
  fingerprint = record['source_fingerprint']
  raise '顶层 source_fingerprint 非法' unless fingerprint.is_a?(String) && fingerprint.match?(/\A[0-9a-f]{64}\z/)
  raise 'results 必须是数组' unless record['results'].is_a?(Array)
  raise '验收记录与当前依赖安装模式不一致' unless record['installation_mode'] == JobsStabilitySources.installation_mode
  raise 'results.root 与目标工程不一致' unless record['root'].is_a?(String) && File.realpath(record['root']) == File.realpath(root)
  pods = JobsStabilitySources.podspec_paths(root).to_h { |path| [File.basename(path, '.podspec'), path] }
  validate_pod_inventory(root, record, pods.keys)
  xcode_version, status = Open3.capture2('xcodebuild', '-version')
  raise '无法只读查询 Xcode 版本' unless status.success?
  raise 'Xcode 版本与验收记录不一致' unless record['xcode'] == xcode_version.strip
  initial_snapshot = snapshot(root)
  current = source_fingerprint(root, xcode_version, record['architecture'])
  raise '磁盘源码/资源/配置指纹已改变；禁止领取旧结果' unless current == fingerprint
  raise '计算指纹期间源码发生变化' unless snapshot(root) == initial_snapshot
  errors = []
  metadata = {}
  pods.each do |name, spec|
    %w[Debug Release].each do |configuration|
      require_result(errors, record, fingerprint, root, 'pod', name, configuration)
    end
    stability = File.read(spec).match?(/\.test_spec\s+['"]Stability['"]/)
    tests = stability ? (name == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']) : []
    tests.each { |configuration| require_test(errors, record, fingerprint, root, name, configuration) }
    harness = File.file?(File.join(File.dirname(spec), 'Tests', 'run_regression.rb'))
    require_result(errors, record, fingerprint, root, 'harness', name, 'macOS') if harness
    metadata[name] = { tests: tests, harness: harness }
  end
  application = File.directory?(File.join(root, 'JobsOCBaseConfigDemoTests'))
  require_application_tests(errors, record, fingerprint, root) if application
  require_result(errors, record, fingerprint, root, 'static', 'JobsPodsConfiguration', 'all')
  %w[Debug Release].each do |configuration|
    require_result(errors, record, fingerprint, root, 'app', 'JobsOCBaseConfigDemo', configuration)
  end
  raise "拒绝回填，不写任何README：\n#{errors.join("\n")}" unless errors.empty?
  updates = pods.map do |name, spec|
    batch_coverage = %w[Debug Release].select do |configuration|
      latest_result(record, fingerprint, 'pod', name, configuration)['execution_mode'] == 'batch-member'
    end
    facts = ['Debug / Release 自建 Pod target 编译']
    facts << "#{batch_coverage.join(' / ')} 单图批量覆盖（共享批次证据）" unless batch_coverage.empty?
    facts << "#{record['architecture']} 模拟器架构" if record['architecture']
    facts << '仅模拟器依赖图' if record['installation_mode'] == 'simulator-only'
    info = metadata.fetch(name)
    facts << "#{info[:tests].join(' / ')} Stability 回归" unless info[:tests].empty?
    facts << 'macOS 生产实现回归' if info[:harness]
    facts << "主工程与宿主 #{record.fetch('application_tests').fetch('expected_test_count')} 例回归" if application
    state = "当前结果：**#{facts.join('、')}已完成"
    state += '；本 Pod 无独立 Stability 回归' if info[:tests].empty?
    state += "；整体验收记录见根 #{RESULT_LINK}**。"
    path = File.join(File.dirname(spec), 'README.md')
    original, updated = prepare_update(path, state)
    { name: name, path: path, original: original, updated: updated, result: state }
  end
  raise '预览期间源码发生变化；禁止回填' unless snapshot(root) == initial_snapshot
  puts JSON.pretty_generate({ mode: options[:apply] ? 'apply' : 'preview', source_fingerprint: fingerprint, readmes: updates.size, stability: metadata.values.count { |info| !info[:tests].empty? }, harness: metadata.values.count { |info| info[:harness] }, results: updates.map { |row| { pod: row[:name], result: row[:result] } } })
  return unless options[:apply]
  # 所有章节和证据先过门禁，再生成同目录临时文件；原文发生并发变化则不开始替换。
  temporary_files = []
  begin
    updates.each do |row|
      temporary = Tempfile.new(['.jobs-readme-results-', '.md'], File.dirname(row[:path]))
      temporary.binmode
      temporary.write(row[:updated])
      temporary.flush
      temporary.fsync
      File.chmod(File.stat(row[:path]).mode & 0o777, temporary.path)
      temporary_files << [temporary, row]
    end
    raise '暂存期间源码发生变化；禁止回填' unless snapshot(root) == initial_snapshot
    raise 'README 被其他任务修改；禁止覆盖' unless updates.all? { |row| File.read(row[:path]) == row[:original] }
    temporary_files.each { |temporary, row| File.rename(temporary.path, row[:path]) }
  ensure
    temporary_files.each { |temporary, _| temporary.close! }
  end
  puts "已回填 #{updates.size} 份独立验收结果句。未修改模块合同或工程配置；主App运行/资源结论由根报告保存。"
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue StandardError => error
    warn error.message
    exit 1
  end
end
